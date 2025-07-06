// ignore_for_file: prefer_interpolation_to_compose_strings, deprecated_member_use, unnecessary_to_list_in_spreads, avoid_print, no_leading_underscores_for_local_identifiers
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:princeproject/components/app_bar.dart';

class AcademicCalendar extends StatefulWidget {
  const AcademicCalendar({super.key});

  @override
  State<AcademicCalendar> createState() => _AcademicCalendarState();
}

// Custom tasks model and list.
// Defined as a separate class outside the build method.
class CustomTask {
  final DateTime fromDate;
  final DateTime? endDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String note;

  CustomTask({
    required this.fromDate,
    this.endDate,
    required this.startTime,
    required this.endTime,
    required this.note,
  });
}

class _AcademicCalendarState extends State<AcademicCalendar> {
  DateTime selectedDate = DateTime.now();
  DateTime currentMonth = DateTime.now();
  List<Event> tasks = [];
  final DeviceCalendarPlugin _calendarPlugin = DeviceCalendarPlugin();
  List<CustomTask> customTasks = [];
  // In your state, add flags and a Set for tracking tasks to delete:
  bool isDeleteMode = false;
  Set<CustomTask> tasksToDelete = {};

  // Add this helper method to your _AcademicCalendarState class
  bool isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  void initState() {
    super.initState();
    _retrievePermissions();
    fetchTasksFromFirebase(); // Fetch tasks from Firebase
  }

  Future<void> _retrievePermissions() async {
    PermissionStatus status = await Permission.calendarFullAccess.request();
    if (status.isGranted) {
      _fetchHolidays();
    }
  }

  Future<void> _fetchHolidays() async {
    PermissionStatus status = await Permission.calendarFullAccess.request();

    if (status.isGranted) {
      print("✅ Permission Granted!");

      // Retrieve available calendars
      final calendarsResult = await _calendarPlugin.retrieveCalendars();
      if (calendarsResult.isSuccess && calendarsResult.data!.isNotEmpty) {
        // Find Holiday Calendar (Some devices name it "Holidays" or similar)
        var holidayCalendar = calendarsResult.data!.firstWhere(
          (cal) => cal.name!.toLowerCase().contains("holiday"),
          orElse: () => calendarsResult.data!.first,
        );

        print("📅 Using Calendar: ${holidayCalendar.name}");

        // Retrieve tasks from Holiday Calendar
        final tasksResult = await _calendarPlugin.retrieveEvents(
          holidayCalendar.id!,
          RetrieveEventsParams(
            startDate: DateTime(2000, 1, 1),
            endDate: DateTime(2100, 12, 31),
          ),
        );

        if (tasksResult.isSuccess) {
          setState(() {
            tasks = tasksResult.data ?? [];
          });

          if (tasks.isNotEmpty) {
            print("🎉 Found ${tasks.length} Holidays!");
            for (var task in tasks) {
              print("📌 Holiday: ${task.title} on ${task.start}");
            }
          } else {
            print("❌ No holidays found in the calendar.");
          }
        } else {
          print("⚠️ Failed to retrieve holidays!");
        }
      } else {
        print("❌ No calendars found!");
      }
    } else {
      print("🚫 Calendar Permission Denied!");
    }
  }

  Future<void> fetchTasksFromFirebase() async {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    try {
      print("Attempting to fetch tasks...");
      QuerySnapshot snapshot = await tasks.get();
      print("Received ${snapshot.docs.length} documents");

      if (snapshot.docs.isEmpty) {
        print("No tasks found in Firestore.");
        return;
      }

      // Add document ID logging
      snapshot.docs.forEach((doc) {
        print("Processing document ${doc.id}");
        print("Document data: ${doc.data()}");
      });

      List<CustomTask> fetchedTasks =
          snapshot.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return CustomTask(
              fromDate: (data['fromDate'] as Timestamp).toDate(),
              endDate:
                  data['endDate'] != null
                      ? (data['endDate'] as Timestamp).toDate()
                      : null,
              startTime: _parseTime(data['startTime']), // Updated parsing
              endTime: _parseTime(data['endTime']), // Updated parsing
              note: data['note'],
            );
          }).toList();

      setState(() {
        customTasks = fetchedTasks;
      });
    } catch (e) {
      print("Failed to fetch tasks: $e");
    }
  }

  TimeOfDay _parseTime(String time) {
    try {
      final timeParts = time.split(':');
      final hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1]);
      return TimeOfDay(hour: hour, minute: minute);
    } catch (e) {
      print("Error parsing time: $time");
      return TimeOfDay(hour: 0, minute: 0); // Return default value
    }
  }

  @override
  Widget build(BuildContext context) {
    int daysInMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, 0).day;
    String monthText = DateFormat('MMMM, yyyy').format(currentMonth);

    // Filter holiday tasks for the selected date.
    List<Event> selectedDayHolidays =
        tasks.where((task) {
          return task.start?.toLocal().year == selectedDate.year &&
              task.start?.toLocal().month == selectedDate.month &&
              task.start?.toLocal().day == selectedDate.day;
        }).toList();

    // Filter custom tasks for the selected date.
    List<CustomTask> selectedCustomTasks =
        customTasks.where((task) {
          // If task has an endDate, show it on every day from start to end (inclusive)
          if (task.endDate != null) {
            return !selectedDate.isBefore(task.fromDate) &&
                !selectedDate.isAfter(task.endDate!);
          } else {
            return task.fromDate.year == selectedDate.year &&
                task.fromDate.month == selectedDate.month &&
                task.fromDate.day == selectedDate.day;
          }
        }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD9D9D9),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Academic Calendar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Calendar Container
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    // Month navigation row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_left,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              currentMonth = DateTime(
                                currentMonth.year,
                                currentMonth.month - 1,
                                1,
                              );
                              _fetchHolidays();
                            });
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            final today = DateTime.now();
                            if (!isSameDate(selectedDate, today)) {
                              setState(() {
                                selectedDate = today;
                                currentMonth = DateTime(
                                  today.year,
                                  today.month,
                                  1,
                                );
                              });
                              _fetchHolidays();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              monthText,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_right,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              currentMonth = DateTime(
                                currentMonth.year,
                                currentMonth.month + 1,
                                1,
                              );
                              _fetchHolidays();
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Weekday labels
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:
                          ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                              .map(
                                (day) => Text(
                                  day,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: 10),
                    // Dates grid with previous, current, and next month dates.
                    Wrap(
                      spacing: 7,
                      runSpacing: 7,
                      children: [
                        // Previous month dates
                        ...List.generate(
                          DateTime(
                                currentMonth.year,
                                currentMonth.month,
                                1,
                              ).weekday %
                              7,
                          (index) {
                            DateTime prevMonth = DateTime(
                              currentMonth.year,
                              currentMonth.month,
                              1,
                            ).subtract(const Duration(days: 1));
                            int daysInPrevMonth =
                                DateTime(
                                  prevMonth.year,
                                  prevMonth.month + 1,
                                  0,
                                ).day;
                            int day =
                                daysInPrevMonth -
                                ((DateTime(
                                          currentMonth.year,
                                          currentMonth.month,
                                          1,
                                        ).weekday %
                                        7) -
                                    1) +
                                index;
                            DateTime dateToShow = DateTime(
                              prevMonth.year,
                              prevMonth.month,
                              day,
                            );
                            bool isSelected =
                                dateToShow.day == selectedDate.day &&
                                dateToShow.month == selectedDate.month &&
                                dateToShow.year == selectedDate.year;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDate = dateToShow;
                                  currentMonth = DateTime(
                                    dateToShow.year,
                                    dateToShow.month,
                                    1,
                                  );
                                  _fetchHolidays();
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      isSelected
                                          ? Colors.white
                                          : Colors.transparent,
                                ),
                                child: Text(
                                  '$day',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        isSelected
                                            ? Colors.black
                                            : Colors.white54,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        // Current month dates
                        ...List.generate(daysInMonth, (index) {
                          DateTime currentDate = DateTime(
                            currentMonth.year,
                            currentMonth.month,
                            index + 1,
                          );
                          bool isSelected =
                              currentDate.day == selectedDate.day &&
                              currentDate.month == selectedDate.month &&
                              currentDate.year == selectedDate.year;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDate = currentDate;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    isSelected
                                        ? Colors.white
                                        : Colors.transparent,
                              ),
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isSelected ? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                          );
                        }),
                        // Next month dates
                        ...List.generate(
                          (() {
                            int totalItems =
                                (DateTime(
                                      currentMonth.year,
                                      currentMonth.month,
                                      1,
                                    ).weekday %
                                    7) +
                                daysInMonth;
                            int remainder = totalItems % 7;
                            return remainder == 0 ? 0 : 7 - remainder;
                          }()),
                          (index) {
                            int day = index + 1;
                            DateTime nextMonth = DateTime(
                              currentMonth.year,
                              currentMonth.month + 1,
                              1,
                            );
                            DateTime dateToShow = DateTime(
                              nextMonth.year,
                              nextMonth.month,
                              day,
                            );
                            bool isSelected =
                                dateToShow.day == selectedDate.day &&
                                dateToShow.month == selectedDate.month &&
                                dateToShow.year == selectedDate.year;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDate = dateToShow;
                                  currentMonth = DateTime(
                                    dateToShow.year,
                                    dateToShow.month,
                                    1,
                                  );
                                  _fetchHolidays();
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      isSelected
                                          ? Colors.white
                                          : Colors.transparent,
                                ),
                                child: Text(
                                  '$day',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        isSelected
                                            ? Colors.black
                                            : Colors.white54,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Tasks header row with "Tasks" and "Add" button.
              // In the "Tasks" row, update buttons:
              // In the "Tasks" row, update buttons accordingly:

              // Display Holiday Tasks and Custom Tasks for the selected date.
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFACB8C0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Holiday tasks (if any)
                      ...selectedDayHolidays.map((holiday) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                holiday.title ?? 'Holiday',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                DateFormat(
                                  'EEEE, MMM d, yyyy',
                                ).format(holiday.start!),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      // Custom tasks (if any)
                      // For each custom task widget:
                      ...selectedCustomTasks.map((task) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Expanded section for task details.
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      task.note,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'From: ${DateFormat('yyyy-MM-dd').format(task.fromDate)} '
                                              '(${task.startTime.format(context)} - ${task.endTime.format(context)})' +
                                          (task.endDate != null
                                              ? '\nTo: ${DateFormat('yyyy-MM-dd').format(task.endDate!)}'
                                              : ''),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Show checkbox if in delete mode.
                              if (isDeleteMode)
                                Checkbox(
                                  value: tasksToDelete.contains(task),
                                  onChanged: (value) {
                                    setState(() {
                                      if (value == true) {
                                        tasksToDelete.add(task);
                                      } else {
                                        tasksToDelete.remove(task);
                                      }
                                    });
                                  },
                                ),
                            ],
                          ),
                        );
                      }).toList(),
                      // If no tasks found, show default message.
                      if (selectedDayHolidays.isEmpty &&
                          selectedCustomTasks.isEmpty)
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              "No Tasks for Today",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
