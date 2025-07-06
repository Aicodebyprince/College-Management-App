import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            children: [
              // First Schedule
              SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: ScheduleWidget(screenWidth: screenWidth),
                ),
              ),

              // Remaining Schedules
              SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Schedule2(screenWidth: screenWidth),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Schedule3(screenWidth: screenWidth),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Schedule4(screenWidth: screenWidth),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Schedule5(screenWidth: screenWidth),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Schedule6(screenWidth: screenWidth),
                ),
              ),
            ],
          ),

          // Floating Action Buttons remain unchanged
          Positioned(
            left: 20,
            bottom: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              child: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                if (_currentPage > 0) {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(Icons.arrow_forward, color: Colors.white),
              onPressed: () {
                if (_currentPage < 5) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class Lecture {
  String subject;
  String time;
  String? type;

  Lecture({required this.subject, required this.time, this.type});
}

class DaySchedule {
  String day;
  DateTime date;
  List<Lecture> lectures;

  DaySchedule({required this.day, required this.date, required this.lectures});
}

class ScheduleWidget extends StatefulWidget {
  final double screenWidth;
  const ScheduleWidget({super.key, required this.screenWidth});

  @override
  _ScheduleWidgetState createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  DateTime today = DateTime.now();
  int highlightedIndex = 0;
  String headerTitle = "Today's Lectures";
  bool isScheduleAvailable = false;
  bool isScheduleAdded = false;

  List<DaySchedule> days = [];

  final List<String> lectures = [
    "Lecture 1",
    "Lecture 2",
    "Lecture 3",
    "Lecture 4",
  ];

  final Map<String, String> fullDayNames = {
    'Mon': 'Monday',
    'Tue': 'Tuesday',
    'Wed': 'Wednesday',
    'Thu': 'Thursday',
    'Fri': 'Friday',
    'Sat': 'Saturday',
    'Sun': 'Sunday',
  };

  String? selectedDay;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String? selectedSubject;
  int? selectedLectureIndex;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  String? selectedType;

  @override
  void initState() {
    super.initState();
    _initializeDays();
    _initializeCurrentDay();
    _startDayChangeTimer();
    _checkScheduleAvailability();
    _fetchScheduleFromFirestore();
  }

  void _initializeDays() {
    DateTime monday = today.subtract(Duration(days: today.weekday - 1));

    days = List.generate(7, (index) {
      DateTime currentDate = monday.add(Duration(days: index));
      String dayName = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index];
      return DaySchedule(
        day: dayName,
        date: currentDate,
        lectures: List.generate(
          4,
          (i) => Lecture(subject: 'Please Add Subject Name', time: 'Timing'),
        ),
      );
    });
  }

  void _initializeCurrentDay() {
    final currentDay = _getDayName(today);
    highlightedIndex = days.indexWhere((day) => day.day == currentDay);
    if (highlightedIndex == -1) highlightedIndex = 0;
    _updateHeaderTitle();
  }

  void _updateHeaderTitle() {
    setState(() {
      headerTitle =
          highlightedIndex == 0 ? "Today's Lectures" : "Scheduled Lectures";
    });
  }

  void _startDayChangeTimer() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      final now = DateTime.now();
      if (now.day != today.day) {
        setState(() {
          today = now;
          _shiftDays();
          _initializeCurrentDay();
        });
      }
    });
  }

  void _shiftDays() {
    final daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    DateTime nextDay = days.last.date.add(const Duration(days: 1));

    days = [
      ...days.sublist(1),
      DaySchedule(
        day: daysOfWeek[(daysOfWeek.indexOf(days.last.day) + 1) % 7],
        date: nextDay,
        lectures: List.generate(
          4,
          (i) => Lecture(subject: 'Please Add Subject Name', time: 'Timing'),
        ),
      ),
    ];
  }

  String _getDayName(DateTime date) {
    const daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return daysOfWeek[date.weekday - 1];
  }

  void _checkScheduleAvailability() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('schedules-BSC-IT-FY')
            .get();
    setState(() {
      isScheduleAvailable = snapshot.docs.isNotEmpty;
      isScheduleAdded = snapshot.docs.isNotEmpty;
    });
  }

  void _fetchScheduleFromFirestore() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('schedules-BSC-IT-FY')
            .get();
    if (snapshot.docs.isNotEmpty) {
      for (var doc in snapshot.docs) {
        String day = doc.id;
        List<Lecture> lectures =
            (doc['lectures'] as List).map((lecture) {
              return Lecture(
                subject: lecture['subject'],
                time: lecture['time'],
                type: lecture['type'],
              );
            }).toList();

        int dayIndex = days.indexWhere((daySchedule) => daySchedule.day == day);
        if (dayIndex != -1) {
          setState(() {
            days[dayIndex].lectures = lectures;
          });
        }
      }
      _initializeCurrentDay();
    }
  }

  // NEW: Method to show success dialog
  void _showSuccessDialog(BuildContext context, String selectedDay) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Lecture updated successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the success dialog
                  // Find and navigate to the selected day
                  int dayIndex = days.indexWhere(
                    (day) => day.day == selectedDay,
                  );
                  if (dayIndex != -1) {
                    setState(() {
                      highlightedIndex = dayIndex;
                      _updateHeaderTitle();
                    });
                  }
                },
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _pickDay(BuildContext context) async {
    String? selectedDay = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text("Select Day")),
          content: SizedBox(
            width: 300,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    days.map((daySchedule) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop(daySchedule.day);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Text(
                                fullDayNames[daySchedule.day] ??
                                    daySchedule.day,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
        );
      },
    );

    if (selectedDay != null) {
      setState(() {
        this.selectedDay = selectedDay;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text("Update Schedule"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      _pickDay(context);
                    },
                    child: Text(
                      selectedDay == null
                          ? "Select Day"
                          : (fullDayNames[selectedDay!] ?? selectedDay!),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _pickStartTime(context);
                        },
                        child: Text(
                          startTime == null
                              ? "Start Time"
                              : startTime!.format(context),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _pickEndTime(context);
                        },
                        child: Text(
                          endTime == null
                              ? "End Time"
                              : endTime!.format(context),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 130,
                    child: DropdownButtonFormField<int?>(
                      value: selectedLectureIndex,
                      hint: const Text("Select Lecture"),
                      onChanged: (int? newIndex) {
                        setState(() {
                          selectedLectureIndex = newIndex;
                        });
                      },
                      items: List.generate(lectures.length, (index) {
                        return DropdownMenuItem<int>(
                          value: index,
                          child: Text(lectures[index]),
                        );
                      }),
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        selectedSubject = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter Subject",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Theory',
                            groupValue: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),
                          const Text('Theory'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Practical',
                            groupValue: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),
                          const Text('Practical'),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (selectedDay != null && selectedLectureIndex != null) {
                        String time =
                            "${startTime!.format(context)} - ${endTime!.format(context)}";
                        String subject = selectedSubject ?? "No Subject";

                        int dayIndex = days.indexWhere(
                          (day) => day.day == selectedDay,
                        );

                        if (dayIndex != -1) {
                          if (days[dayIndex].lectures.length < 4) {
                            days[dayIndex].lectures.add(
                              Lecture(
                                subject: subject,
                                time: time,
                                type: selectedType,
                              ),
                            );
                          } else {
                            days[dayIndex]
                                .lectures[selectedLectureIndex!] = Lecture(
                              subject: subject,
                              time: time,
                              type: selectedType,
                            );
                          }

                          await FirebaseFirestore.instance
                              .collection('schedules-BSC-IT-FY')
                              .doc(selectedDay!)
                              .set({
                                'day': selectedDay,
                                'fullDayName': fullDayNames[selectedDay!],
                                'lectures':
                                    days[dayIndex].lectures
                                        .map(
                                          (lecture) => {
                                            'subject': lecture.subject,
                                            'time': lecture.time,
                                            'type': lecture.type,
                                          },
                                        )
                                        .toList(),
                                'created_at': FieldValue.serverTimestamp(),
                              })
                              .then((value) {
                                Navigator.of(
                                  context,
                                ).pop(); // Close update dialog
                                _showSuccessDialog(
                                  context,
                                  selectedDay!,
                                ); // Show success dialog
                              })
                              .catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Failed to update schedule: $error',
                                    ),
                                  ),
                                );
                              });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Selected day not found'),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill in all fields'),
                          ),
                        );
                      }
                    },
                    child: const Text("Update Schedule"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _pickStartTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        startTime = pickedTime;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  void _pickEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        endTime = pickedTime;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    String monthName = _getMonthName(today.month);
    String year = today.year.toString();

    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 6.0, right: 6.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(bottom: 15.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'BSC IT FY Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              '$monthName, $year',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: 110,
            width: widget.screenWidth * 0.95,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(days.length, (index) {
                  bool isCurrentDay = index == highlightedIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        highlightedIndex = index;
                        _updateHeaderTitle();
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 80,
                      width: 40,
                      decoration: BoxDecoration(
                        color: isCurrentDay ? Colors.white : Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            days[index].day,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            DateFormat('d').format(days[index].date),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 5.0),
                child: Text(
                  headerTitle,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 5.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      if (!isScheduleAvailable) {
                        _showUpdateDialog(context);
                      } else {
                        _showUpdateDialog(context);
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFFF3131),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      isScheduleAvailable ? "Update" : "Add",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                children: List.generate(
                  days[highlightedIndex].lectures.length,
                  (index) {
                    final lecture = days[highlightedIndex].lectures[index];
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
                            lecture.time,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            // Only show "- Practical" if type is Practical
                            // Theory will be stored but not displayed
                            lecture.type == 'Practical'
                                ? "${lecture.subject} - Practical"
                                : lecture.subject,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Schedule2 extends StatefulWidget {
  final double screenWidth;
  const Schedule2({super.key, required this.screenWidth});

  @override
  _Schedule2State createState() => _Schedule2State();
}

class _Schedule2State extends State<Schedule2> {
  DateTime today = DateTime.now();
  int highlightedIndex = 0;
  String headerTitle = "Today's Lectures";
  bool isScheduleAvailable = false;
  bool isScheduleAdded = false;

  List<DaySchedule> days = [];

  final List<String> lectures = [
    "Lecture 1",
    "Lecture 2",
    "Lecture 3",
    "Lecture 4",
  ];

  final Map<String, String> fullDayNames = {
    'Mon': 'Monday',
    'Tue': 'Tuesday',
    'Wed': 'Wednesday',
    'Thu': 'Thursday',
    'Fri': 'Friday',
    'Sat': 'Saturday',
    'Sun': 'Sunday',
  };

  String? selectedDay;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String? selectedSubject;
  int? selectedLectureIndex;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  String? selectedType;

  @override
  void initState() {
    super.initState();
    _initializeDays();
    _initializeCurrentDay();
    _startDayChangeTimer();
    _checkScheduleAvailability();
    _fetchScheduleFromFirestore();
  }

  void _initializeDays() {
    DateTime monday = today.subtract(Duration(days: today.weekday - 1));

    days = List.generate(7, (index) {
      DateTime currentDate = monday.add(Duration(days: index));
      String dayName = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index];
      return DaySchedule(
        day: dayName,
        date: currentDate,
        lectures: List.generate(
          4,
          (i) => Lecture(subject: 'Please Add Subject Name', time: 'Timing'),
        ),
      );
    });
  }

  void _initializeCurrentDay() {
    final currentDay = _getDayName(today);
    highlightedIndex = days.indexWhere((day) => day.day == currentDay);
    if (highlightedIndex == -1) highlightedIndex = 0;
    _updateHeaderTitle();
  }

  void _updateHeaderTitle() {
    setState(() {
      headerTitle =
          highlightedIndex == 0 ? "Today's Lectures" : "Scheduled Lectures";
    });
  }

  void _startDayChangeTimer() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      final now = DateTime.now();
      if (now.day != today.day) {
        setState(() {
          today = now;
          _shiftDays();
          _initializeCurrentDay();
        });
      }
    });
  }

  void _shiftDays() {
    final daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    DateTime nextDay = days.last.date.add(const Duration(days: 1));

    days = [
      ...days.sublist(1),
      DaySchedule(
        day: daysOfWeek[(daysOfWeek.indexOf(days.last.day) + 1) % 7],
        date: nextDay,
        lectures: List.generate(
          4,
          (i) => Lecture(subject: 'Please Add Subject Name', time: 'Timing'),
        ),
      ),
    ];
  }

  String _getDayName(DateTime date) {
    const daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return daysOfWeek[date.weekday - 1];
  }

  void _checkScheduleAvailability() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('schedules-BSC-IT-SY')
            .get();
    setState(() {
      isScheduleAvailable = snapshot.docs.isNotEmpty;
      isScheduleAdded = snapshot.docs.isNotEmpty;
    });
  }

  void _fetchScheduleFromFirestore() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('schedules-BSC-IT-SY')
            .get();
    if (snapshot.docs.isNotEmpty) {
      for (var doc in snapshot.docs) {
        String day = doc.id;
        List<Lecture> lectures =
            (doc['lectures'] as List).map((lecture) {
              return Lecture(
                subject: lecture['subject'],
                time: lecture['time'],
                type: lecture['type'],
              );
            }).toList();

        int dayIndex = days.indexWhere((daySchedule) => daySchedule.day == day);
        if (dayIndex != -1) {
          setState(() {
            days[dayIndex].lectures = lectures;
          });
        }
      }
      _initializeCurrentDay();
    }
  }

  // NEW: Method to show success dialog
  void _showSuccessDialog(BuildContext context, String selectedDay) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Lecture updated successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the success dialog
                  // Find and navigate to the selected day
                  int dayIndex = days.indexWhere(
                    (day) => day.day == selectedDay,
                  );
                  if (dayIndex != -1) {
                    setState(() {
                      highlightedIndex = dayIndex;
                      _updateHeaderTitle();
                    });
                  }
                },
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _pickDay(BuildContext context) async {
    String? selectedDay = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text("Select Day")),
          content: SizedBox(
            width: 300,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    days.map((daySchedule) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop(daySchedule.day);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Text(
                                fullDayNames[daySchedule.day] ??
                                    daySchedule.day,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
        );
      },
    );

    if (selectedDay != null) {
      setState(() {
        this.selectedDay = selectedDay;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text("Update Schedule"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      _pickDay(context);
                    },
                    child: Text(
                      selectedDay == null
                          ? "Select Day"
                          : (fullDayNames[selectedDay!] ?? selectedDay!),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _pickStartTime(context);
                        },
                        child: Text(
                          startTime == null
                              ? "Start Time"
                              : startTime!.format(context),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _pickEndTime(context);
                        },
                        child: Text(
                          endTime == null
                              ? "End Time"
                              : endTime!.format(context),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 130,
                    child: DropdownButtonFormField<int?>(
                      value: selectedLectureIndex,
                      hint: const Text("Select Lecture"),
                      onChanged: (int? newIndex) {
                        setState(() {
                          selectedLectureIndex = newIndex;
                        });
                      },
                      items: List.generate(lectures.length, (index) {
                        return DropdownMenuItem<int>(
                          value: index,
                          child: Text(lectures[index]),
                        );
                      }),
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        selectedSubject = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter Subject",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Theory',
                            groupValue: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),
                          const Text('Theory'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Practical',
                            groupValue: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),
                          const Text('Practical'),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (selectedDay != null && selectedLectureIndex != null) {
                        String time =
                            "${startTime!.format(context)} - ${endTime!.format(context)}";
                        String subject = selectedSubject ?? "No Subject";

                        int dayIndex = days.indexWhere(
                          (day) => day.day == selectedDay,
                        );

                        if (dayIndex != -1) {
                          if (days[dayIndex].lectures.length < 4) {
                            days[dayIndex].lectures.add(
                              Lecture(
                                subject: subject,
                                time: time,
                                type: selectedType,
                              ),
                            );
                          } else {
                            days[dayIndex]
                                .lectures[selectedLectureIndex!] = Lecture(
                              subject: subject,
                              time: time,
                              type: selectedType,
                            );
                          }

                          await FirebaseFirestore.instance
                              .collection('schedules-BSC-IT-SY')
                              .doc(selectedDay!)
                              .set({
                                'day': selectedDay,
                                'fullDayName': fullDayNames[selectedDay!],
                                'lectures':
                                    days[dayIndex].lectures
                                        .map(
                                          (lecture) => {
                                            'subject': lecture.subject,
                                            'time': lecture.time,
                                            'type': lecture.type,
                                          },
                                        )
                                        .toList(),
                                'created_at': FieldValue.serverTimestamp(),
                              })
                              .then((value) {
                                Navigator.of(
                                  context,
                                ).pop(); // Close update dialog
                                _showSuccessDialog(
                                  context,
                                  selectedDay!,
                                ); // Show success dialog
                              })
                              .catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Failed to update schedule: $error',
                                    ),
                                  ),
                                );
                              });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Selected day not found'),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill in all fields'),
                          ),
                        );
                      }
                    },
                    child: const Text("Update Schedule"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _pickStartTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        startTime = pickedTime;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  void _pickEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        endTime = pickedTime;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    String monthName = _getMonthName(today.month);
    String year = today.year.toString();

    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 6.0, right: 6.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(bottom: 15.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 54, 63, 244),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'BSC IT SY Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              '$monthName, $year',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: 100,
            width: widget.screenWidth * 0.95,
            decoration: const BoxDecoration(
              color: const Color.fromARGB(255, 54, 63, 244),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(days.length, (index) {
                  bool isCurrentDay = index == highlightedIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        highlightedIndex = index;
                        _updateHeaderTitle();
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 80,
                      width: 40,
                      decoration: BoxDecoration(
                        color: isCurrentDay ? Colors.white : Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            days[index].day,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            DateFormat('d').format(days[index].date),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 5.0),
                child: Text(
                  headerTitle,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 5.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      if (!isScheduleAvailable) {
                        _showUpdateDialog(context);
                      } else {
                        _showUpdateDialog(context);
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 54, 63, 244),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      isScheduleAvailable ? "Update" : "Add",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                children: List.generate(
                  days[highlightedIndex].lectures.length,
                  (index) {
                    final lecture = days[highlightedIndex].lectures[index];
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
                            lecture.time,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            // Only show "- Practical" if type is Practical
                            // Theory will be stored but not displayed
                            lecture.type == 'Practical'
                                ? "${lecture.subject} - Practical"
                                : lecture.subject,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Schedule3 extends StatefulWidget {
  final double screenWidth;
  const Schedule3({super.key, required this.screenWidth});

  @override
  _Schedule3State createState() => _Schedule3State();
}

class _Schedule3State extends State<Schedule3> {
  DateTime today = DateTime.now();
  int highlightedIndex = 0;
  String headerTitle = "Today's Lectures";
  bool isScheduleAvailable = false;
  bool isScheduleAdded = false;

  List<DaySchedule> days = [];

  final List<String> lectures = [
    "Lecture 1",
    "Lecture 2",
    "Lecture 3",
    "Lecture 4",
  ];

  final Map<String, String> fullDayNames = {
    'Mon': 'Monday',
    'Tue': 'Tuesday',
    'Wed': 'Wednesday',
    'Thu': 'Thursday',
    'Fri': 'Friday',
    'Sat': 'Saturday',
    'Sun': 'Sunday',
  };

  String? selectedDay;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String? selectedSubject;
  int? selectedLectureIndex;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  String? selectedType;

  @override
  void initState() {
    super.initState();
    _initializeDays();
    _initializeCurrentDay();
    _startDayChangeTimer();
    _checkScheduleAvailability();
    _fetchScheduleFromFirestore();
  }

  void _initializeDays() {
    DateTime monday = today.subtract(Duration(days: today.weekday - 1));

    days = List.generate(7, (index) {
      DateTime currentDate = monday.add(Duration(days: index));
      String dayName = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index];
      return DaySchedule(
        day: dayName,
        date: currentDate,
        lectures: List.generate(
          4,
          (i) => Lecture(subject: 'Please Add Subject Name', time: 'Timing'),
        ),
      );
    });
  }

  void _initializeCurrentDay() {
    final currentDay = _getDayName(today);
    highlightedIndex = days.indexWhere((day) => day.day == currentDay);
    if (highlightedIndex == -1) highlightedIndex = 0;
    _updateHeaderTitle();
  }

  void _updateHeaderTitle() {
    setState(() {
      headerTitle =
          highlightedIndex == 0 ? "Today's Lectures" : "Scheduled Lectures";
    });
  }

  void _startDayChangeTimer() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      final now = DateTime.now();
      if (now.day != today.day) {
        setState(() {
          today = now;
          _shiftDays();
          _initializeCurrentDay();
        });
      }
    });
  }

  void _shiftDays() {
    final daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    DateTime nextDay = days.last.date.add(const Duration(days: 1));

    days = [
      ...days.sublist(1),
      DaySchedule(
        day: daysOfWeek[(daysOfWeek.indexOf(days.last.day) + 1) % 7],
        date: nextDay,
        lectures: List.generate(
          4,
          (i) => Lecture(subject: 'Please Add Subject Name', time: 'Timing'),
        ),
      ),
    ];
  }

  String _getDayName(DateTime date) {
    const daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return daysOfWeek[date.weekday - 1];
  }

  void _checkScheduleAvailability() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('schedules-BSC-IT-TY')
            .get();
    setState(() {
      isScheduleAvailable = snapshot.docs.isNotEmpty;
      isScheduleAdded = snapshot.docs.isNotEmpty;
    });
  }

  void _fetchScheduleFromFirestore() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('schedules-BSC-IT-TY')
            .get();
    if (snapshot.docs.isNotEmpty) {
      for (var doc in snapshot.docs) {
        String day = doc.id;
        List<Lecture> lectures =
            (doc['lectures'] as List).map((lecture) {
              return Lecture(
                subject: lecture['subject'],
                time: lecture['time'],
                type: lecture['type'],
              );
            }).toList();

        int dayIndex = days.indexWhere((daySchedule) => daySchedule.day == day);
        if (dayIndex != -1) {
          setState(() {
            days[dayIndex].lectures = lectures;
          });
        }
      }
      _initializeCurrentDay();
    }
  }

  // NEW: Method to show success dialog
  void _showSuccessDialog(BuildContext context, String selectedDay) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Lecture updated successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the success dialog
                  // Find and navigate to the selected day
                  int dayIndex = days.indexWhere(
                    (day) => day.day == selectedDay,
                  );
                  if (dayIndex != -1) {
                    setState(() {
                      highlightedIndex = dayIndex;
                      _updateHeaderTitle();
                    });
                  }
                },
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _pickDay(BuildContext context) async {
    String? selectedDay = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text("Select Day")),
          content: SizedBox(
            width: 300,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    days.map((daySchedule) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop(daySchedule.day);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Text(
                                fullDayNames[daySchedule.day] ??
                                    daySchedule.day,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
        );
      },
    );

    if (selectedDay != null) {
      setState(() {
        this.selectedDay = selectedDay;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text("Update Schedule"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      _pickDay(context);
                    },
                    child: Text(
                      selectedDay == null
                          ? "Select Day"
                          : (fullDayNames[selectedDay!] ?? selectedDay!),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _pickStartTime(context);
                        },
                        child: Text(
                          startTime == null
                              ? "Start Time"
                              : startTime!.format(context),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _pickEndTime(context);
                        },
                        child: Text(
                          endTime == null
                              ? "End Time"
                              : endTime!.format(context),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 130,
                    child: DropdownButtonFormField<int?>(
                      value: selectedLectureIndex,
                      hint: const Text("Select Lecture"),
                      onChanged: (int? newIndex) {
                        setState(() {
                          selectedLectureIndex = newIndex;
                        });
                      },
                      items: List.generate(lectures.length, (index) {
                        return DropdownMenuItem<int>(
                          value: index,
                          child: Text(lectures[index]),
                        );
                      }),
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        selectedSubject = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter Subject",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Theory',
                            groupValue: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),
                          const Text('Theory'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Practical',
                            groupValue: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),
                          const Text('Practical'),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (selectedDay != null && selectedLectureIndex != null) {
                        String time =
                            "${startTime!.format(context)} - ${endTime!.format(context)}";
                        String subject = selectedSubject ?? "No Subject";

                        int dayIndex = days.indexWhere(
                          (day) => day.day == selectedDay,
                        );

                        if (dayIndex != -1) {
                          if (days[dayIndex].lectures.length < 4) {
                            days[dayIndex].lectures.add(
                              Lecture(
                                subject: subject,
                                time: time,
                                type: selectedType,
                              ),
                            );
                          } else {
                            days[dayIndex]
                                .lectures[selectedLectureIndex!] = Lecture(
                              subject: subject,
                              time: time,
                              type: selectedType,
                            );
                          }

                          await FirebaseFirestore.instance
                              .collection('schedules-BSC-IT-TY')
                              .doc(selectedDay!)
                              .set({
                                'day': selectedDay,
                                'fullDayName': fullDayNames[selectedDay!],
                                'lectures':
                                    days[dayIndex].lectures
                                        .map(
                                          (lecture) => {
                                            'subject': lecture.subject,
                                            'time': lecture.time,
                                            'type': lecture.type,
                                          },
                                        )
                                        .toList(),
                                'created_at': FieldValue.serverTimestamp(),
                              })
                              .then((value) {
                                Navigator.of(
                                  context,
                                ).pop(); // Close update dialog
                                _showSuccessDialog(
                                  context,
                                  selectedDay!,
                                ); // Show success dialog
                              })
                              .catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Failed to update schedule: $error',
                                    ),
                                  ),
                                );
                              });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Selected day not found'),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill in all fields'),
                          ),
                        );
                      }
                    },
                    child: const Text("Update Schedule"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _pickStartTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        startTime = pickedTime;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  void _pickEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        endTime = pickedTime;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    String monthName = _getMonthName(today.month);
    String year = today.year.toString();

    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 6.0, right: 6.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(bottom: 15.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'BSC IT TY Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              '$monthName, $year',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: 100,
            width: widget.screenWidth * 0.95,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(days.length, (index) {
                  bool isCurrentDay = index == highlightedIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        highlightedIndex = index;
                        _updateHeaderTitle();
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 80,
                      width: 40,
                      decoration: BoxDecoration(
                        color: isCurrentDay ? Colors.white : Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            days[index].day,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            DateFormat('d').format(days[index].date),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 5.0),
                child: Text(
                  headerTitle,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 5.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      if (!isScheduleAvailable) {
                        _showUpdateDialog(context);
                      } else {
                        _showUpdateDialog(context);
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFFF3131),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      isScheduleAvailable ? "Update" : "Add",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                children: List.generate(
                  days[highlightedIndex].lectures.length,
                  (index) {
                    final lecture = days[highlightedIndex].lectures[index];
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
                            lecture.time,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            // Only show "- Practical" if type is Practical
                            // Theory will be stored but not displayed
                            lecture.type == 'Practical'
                                ? "${lecture.subject} - Practical"
                                : lecture.subject,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Schedule4 extends StatefulWidget {
  final double screenWidth;
  const Schedule4({super.key, required this.screenWidth});

  @override
  _Schedule4State createState() => _Schedule4State();
}

class _Schedule4State extends State<Schedule4> {
  DateTime today = DateTime.now();
  int highlightedIndex = 0;
  String headerTitle = "Today's Lectures";
  bool isScheduleAvailable = false;
  bool isScheduleAdded = false;

  List<DaySchedule> days = [];

  final List<String> lectures = [
    "Lecture 1",
    "Lecture 2",
    "Lecture 3",
    "Lecture 4",
  ];

  final Map<String, String> fullDayNames = {
    'Mon': 'Monday',
    'Tue': 'Tuesday',
    'Wed': 'Wednesday',
    'Thu': 'Thursday',
    'Fri': 'Friday',
    'Sat': 'Saturday',
    'Sun': 'Sunday',
  };

  String? selectedDay;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String? selectedSubject;
  int? selectedLectureIndex;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  String? selectedType;

  @override
  void initState() {
    super.initState();
    _initializeDays();
    _initializeCurrentDay();
    _startDayChangeTimer();
    _checkScheduleAvailability();
    _fetchScheduleFromFirestore();
  }

  void _initializeDays() {
    DateTime monday = today.subtract(Duration(days: today.weekday - 1));

    days = List.generate(7, (index) {
      DateTime currentDate = monday.add(Duration(days: index));
      String dayName = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index];
      return DaySchedule(
        day: dayName,
        date: currentDate,
        lectures: List.generate(
          4,
          (i) => Lecture(subject: 'Please Add Subject Name', time: 'Timing'),
        ),
      );
    });
  }

  void _initializeCurrentDay() {
    final currentDay = _getDayName(today);
    highlightedIndex = days.indexWhere((day) => day.day == currentDay);
    if (highlightedIndex == -1) highlightedIndex = 0;
    _updateHeaderTitle();
  }

  void _updateHeaderTitle() {
    setState(() {
      headerTitle =
          highlightedIndex == 0 ? "Today's Lectures" : "Scheduled Lectures";
    });
  }

  void _startDayChangeTimer() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      final now = DateTime.now();
      if (now.day != today.day) {
        setState(() {
          today = now;
          _shiftDays();
          _initializeCurrentDay();
        });
      }
    });
  }

  void _shiftDays() {
    final daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    DateTime nextDay = days.last.date.add(const Duration(days: 1));

    days = [
      ...days.sublist(1),
      DaySchedule(
        day: daysOfWeek[(daysOfWeek.indexOf(days.last.day) + 1) % 7],
        date: nextDay,
        lectures: List.generate(
          4,
          (i) => Lecture(subject: 'Please Add Subject Name', time: 'Timing'),
        ),
      ),
    ];
  }

  String _getDayName(DateTime date) {
    const daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return daysOfWeek[date.weekday - 1];
  }

  void _checkScheduleAvailability() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('schedules-BSC-DS-FY')
            .get();
    setState(() {
      isScheduleAvailable = snapshot.docs.isNotEmpty;
      isScheduleAdded = snapshot.docs.isNotEmpty;
    });
  }

  void _fetchScheduleFromFirestore() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('schedules-BSC-DS-FY')
            .get();
    if (snapshot.docs.isNotEmpty) {
      for (var doc in snapshot.docs) {
        String day = doc.id;
        List<Lecture> lectures =
            (doc['lectures'] as List).map((lecture) {
              return Lecture(
                subject: lecture['subject'],
                time: lecture['time'],
                type: lecture['type'],
              );
            }).toList();

        int dayIndex = days.indexWhere((daySchedule) => daySchedule.day == day);
        if (dayIndex != -1) {
          setState(() {
            days[dayIndex].lectures = lectures;
          });
        }
      }
      _initializeCurrentDay();
    }
  }

  // NEW: Method to show success dialog
  void _showSuccessDialog(BuildContext context, String selectedDay) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Lecture updated successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the success dialog
                  // Find and navigate to the selected day
                  int dayIndex = days.indexWhere(
                    (day) => day.day == selectedDay,
                  );
                  if (dayIndex != -1) {
                    setState(() {
                      highlightedIndex = dayIndex;
                      _updateHeaderTitle();
                    });
                  }
                },
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _pickDay(BuildContext context) async {
    String? selectedDay = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text("Select Day")),
          content: SizedBox(
            width: 300,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    days.map((daySchedule) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop(daySchedule.day);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Text(
                                fullDayNames[daySchedule.day] ??
                                    daySchedule.day,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
        );
      },
    );

    if (selectedDay != null) {
      setState(() {
        this.selectedDay = selectedDay;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text("Update Schedule"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      _pickDay(context);
                    },
                    child: Text(
                      selectedDay == null
                          ? "Select Day"
                          : (fullDayNames[selectedDay!] ?? selectedDay!),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _pickStartTime(context);
                        },
                        child: Text(
                          startTime == null
                              ? "Start Time"
                              : startTime!.format(context),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _pickEndTime(context);
                        },
                        child: Text(
                          endTime == null
                              ? "End Time"
                              : endTime!.format(context),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 130,
                    child: DropdownButtonFormField<int?>(
                      value: selectedLectureIndex,
                      hint: const Text("Select Lecture"),
                      onChanged: (int? newIndex) {
                        setState(() {
                          selectedLectureIndex = newIndex;
                        });
                      },
                      items: List.generate(lectures.length, (index) {
                        return DropdownMenuItem<int>(
                          value: index,
                          child: Text(lectures[index]),
                        );
                      }),
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        selectedSubject = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter Subject",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Theory',
                            groupValue: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),
                          const Text('Theory'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Practical',
                            groupValue: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),
                          const Text('Practical'),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (selectedDay != null && selectedLectureIndex != null) {
                        String time =
                            "${startTime!.format(context)} - ${endTime!.format(context)}";
                        String subject = selectedSubject ?? "No Subject";

                        int dayIndex = days.indexWhere(
                          (day) => day.day == selectedDay,
                        );

                        if (dayIndex != -1) {
                          if (days[dayIndex].lectures.length < 4) {
                            days[dayIndex].lectures.add(
                              Lecture(
                                subject: subject,
                                time: time,
                                type: selectedType,
                              ),
                            );
                          } else {
                            days[dayIndex]
                                .lectures[selectedLectureIndex!] = Lecture(
                              subject: subject,
                              time: time,
                              type: selectedType,
                            );
                          }

                          await FirebaseFirestore.instance
                              .collection('schedules-BSC-DS-FY')
                              .doc(selectedDay!)
                              .set({
                                'day': selectedDay,
                                'fullDayName': fullDayNames[selectedDay!],
                                'lectures':
                                    days[dayIndex].lectures
                                        .map(
                                          (lecture) => {
                                            'subject': lecture.subject,
                                            'time': lecture.time,
                                            'type': lecture.type,
                                          },
                                        )
                                        .toList(),
                                'created_at': FieldValue.serverTimestamp(),
                              })
                              .then((value) {
                                Navigator.of(
                                  context,
                                ).pop(); // Close update dialog
                                _showSuccessDialog(
                                  context,
                                  selectedDay!,
                                ); // Show success dialog
                              })
                              .catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Failed to update schedule: $error',
                                    ),
                                  ),
                                );
                              });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Selected day not found'),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill in all fields'),
                          ),
                        );
                      }
                    },
                    child: const Text("Update Schedule"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _pickStartTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        startTime = pickedTime;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  void _pickEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        endTime = pickedTime;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    String monthName = _getMonthName(today.month);
    String year = today.year.toString();

    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 6.0, right: 6.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(bottom: 15.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 197, 224, 18),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'BSC DS FY Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              '$monthName, $year',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: 100,
            width: widget.screenWidth * 0.95,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 197, 224, 18),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(days.length, (index) {
                  bool isCurrentDay = index == highlightedIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        highlightedIndex = index;
                        _updateHeaderTitle();
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 80,
                      width: 40,
                      decoration: BoxDecoration(
                        color: isCurrentDay ? Colors.white : Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            days[index].day,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            DateFormat('d').format(days[index].date),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 5.0),
                child: Text(
                  headerTitle,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 5.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      if (!isScheduleAvailable) {
                        _showUpdateDialog(context);
                      } else {
                        _showUpdateDialog(context);
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 54, 63, 244),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      isScheduleAvailable ? "Update" : "Add",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                children: List.generate(
                  days[highlightedIndex].lectures.length,
                  (index) {
                    final lecture = days[highlightedIndex].lectures[index];
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
                            lecture.time,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            // Only show "- Practical" if type is Practical
                            // Theory will be stored but not displayed
                            lecture.type == 'Practical'
                                ? "${lecture.subject} - Practical"
                                : lecture.subject,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Schedule5 extends StatefulWidget {
  final double screenWidth;
  const Schedule5({super.key, required this.screenWidth});

  @override
  _Schedule5State createState() => _Schedule5State();
}

class _Schedule5State extends State<Schedule5> {
  DateTime today = DateTime.now();
  int highlightedIndex = 0;
  String headerTitle = "Today's Lectures";
  bool isScheduleAvailable = false;
  bool isScheduleAdded = false;

  List<DaySchedule> days = [];

  final List<String> lectures = [
    "Lecture 1",
    "Lecture 2",
    "Lecture 3",
    "Lecture 4",
  ];

  final Map<String, String> fullDayNames = {
    'Mon': 'Monday',
    'Tue': 'Tuesday',
    'Wed': 'Wednesday',
    'Thu': 'Thursday',
    'Fri': 'Friday',
    'Sat': 'Saturday',
    'Sun': 'Sunday',
  };

  String? selectedDay;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String? selectedSubject;
  int? selectedLectureIndex;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  String? selectedType;

  @override
  void initState() {
    super.initState();
    _initializeDays();
    _initializeCurrentDay();
    _startDayChangeTimer();
    _checkScheduleAvailability();
    _fetchScheduleFromFirestore();
  }

  void _initializeDays() {
    DateTime monday = today.subtract(Duration(days: today.weekday - 1));

    days = List.generate(7, (index) {
      DateTime currentDate = monday.add(Duration(days: index));
      String dayName = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index];
      return DaySchedule(
        day: dayName,
        date: currentDate,
        lectures: List.generate(
          4,
          (i) => Lecture(subject: 'Please Add Subject Name', time: 'Timing'),
        ),
      );
    });
  }

  void _initializeCurrentDay() {
    final currentDay = _getDayName(today);
    highlightedIndex = days.indexWhere((day) => day.day == currentDay);
    if (highlightedIndex == -1) highlightedIndex = 0;
    _updateHeaderTitle();
  }

  void _updateHeaderTitle() {
    setState(() {
      headerTitle =
          highlightedIndex == 0 ? "Today's Lectures" : "Scheduled Lectures";
    });
  }

  void _startDayChangeTimer() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      final now = DateTime.now();
      if (now.day != today.day) {
        setState(() {
          today = now;
          _shiftDays();
          _initializeCurrentDay();
        });
      }
    });
  }

  void _shiftDays() {
    final daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    DateTime nextDay = days.last.date.add(const Duration(days: 1));

    days = [
      ...days.sublist(1),
      DaySchedule(
        day: daysOfWeek[(daysOfWeek.indexOf(days.last.day) + 1) % 7],
        date: nextDay,
        lectures: List.generate(
          4,
          (i) => Lecture(subject: 'Please Add Subject Name', time: 'Timing'),
        ),
      ),
    ];
  }

  String _getDayName(DateTime date) {
    const daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return daysOfWeek[date.weekday - 1];
  }

  void _checkScheduleAvailability() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('schedules-BSC-DS-SY')
            .get();
    setState(() {
      isScheduleAvailable = snapshot.docs.isNotEmpty;
      isScheduleAdded = snapshot.docs.isNotEmpty;
    });
  }

  void _fetchScheduleFromFirestore() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('schedules-BSC-DS-SY')
            .get();
    if (snapshot.docs.isNotEmpty) {
      for (var doc in snapshot.docs) {
        String day = doc.id;
        List<Lecture> lectures =
            (doc['lectures'] as List).map((lecture) {
              return Lecture(
                subject: lecture['subject'],
                time: lecture['time'],
                type: lecture['type'],
              );
            }).toList();

        int dayIndex = days.indexWhere((daySchedule) => daySchedule.day == day);
        if (dayIndex != -1) {
          setState(() {
            days[dayIndex].lectures = lectures;
          });
        }
      }
      _initializeCurrentDay();
    }
  }

  // NEW: Method to show success dialog
  void _showSuccessDialog(BuildContext context, String selectedDay) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Lecture updated successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the success dialog
                  // Find and navigate to the selected day
                  int dayIndex = days.indexWhere(
                    (day) => day.day == selectedDay,
                  );
                  if (dayIndex != -1) {
                    setState(() {
                      highlightedIndex = dayIndex;
                      _updateHeaderTitle();
                    });
                  }
                },
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _pickDay(BuildContext context) async {
    String? selectedDay = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text("Select Day")),
          content: SizedBox(
            width: 300,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    days.map((daySchedule) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop(daySchedule.day);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Text(
                                fullDayNames[daySchedule.day] ??
                                    daySchedule.day,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
        );
      },
    );

    if (selectedDay != null) {
      setState(() {
        this.selectedDay = selectedDay;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text("Update Schedule"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      _pickDay(context);
                    },
                    child: Text(
                      selectedDay == null
                          ? "Select Day"
                          : (fullDayNames[selectedDay!] ?? selectedDay!),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _pickStartTime(context);
                        },
                        child: Text(
                          startTime == null
                              ? "Start Time"
                              : startTime!.format(context),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _pickEndTime(context);
                        },
                        child: Text(
                          endTime == null
                              ? "End Time"
                              : endTime!.format(context),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 130,
                    child: DropdownButtonFormField<int?>(
                      value: selectedLectureIndex,
                      hint: const Text("Select Lecture"),
                      onChanged: (int? newIndex) {
                        setState(() {
                          selectedLectureIndex = newIndex;
                        });
                      },
                      items: List.generate(lectures.length, (index) {
                        return DropdownMenuItem<int>(
                          value: index,
                          child: Text(lectures[index]),
                        );
                      }),
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        selectedSubject = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter Subject",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Theory',
                            groupValue: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),
                          const Text('Theory'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Practical',
                            groupValue: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),
                          const Text('Practical'),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (selectedDay != null && selectedLectureIndex != null) {
                        String time =
                            "${startTime!.format(context)} - ${endTime!.format(context)}";
                        String subject = selectedSubject ?? "No Subject";

                        int dayIndex = days.indexWhere(
                          (day) => day.day == selectedDay,
                        );

                        if (dayIndex != -1) {
                          if (days[dayIndex].lectures.length < 4) {
                            days[dayIndex].lectures.add(
                              Lecture(
                                subject: subject,
                                time: time,
                                type: selectedType,
                              ),
                            );
                          } else {
                            days[dayIndex]
                                .lectures[selectedLectureIndex!] = Lecture(
                              subject: subject,
                              time: time,
                              type: selectedType,
                            );
                          }

                          await FirebaseFirestore.instance
                              .collection('schedules-BSC-DS-SY')
                              .doc(selectedDay!)
                              .set({
                                'day': selectedDay,
                                'fullDayName': fullDayNames[selectedDay!],
                                'lectures':
                                    days[dayIndex].lectures
                                        .map(
                                          (lecture) => {
                                            'subject': lecture.subject,
                                            'time': lecture.time,
                                            'type': lecture.type,
                                          },
                                        )
                                        .toList(),
                                'created_at': FieldValue.serverTimestamp(),
                              })
                              .then((value) {
                                Navigator.of(
                                  context,
                                ).pop(); // Close update dialog
                                _showSuccessDialog(
                                  context,
                                  selectedDay!,
                                ); // Show success dialog
                              })
                              .catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Failed to update schedule: $error',
                                    ),
                                  ),
                                );
                              });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Selected day not found'),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill in all fields'),
                          ),
                        );
                      }
                    },
                    child: const Text("Update Schedule"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _pickStartTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        startTime = pickedTime;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  void _pickEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        endTime = pickedTime;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    String monthName = _getMonthName(today.month);
    String year = today.year.toString();

    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 6.0, right: 6.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(bottom: 15.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 210, 15, 197),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'BSC DS SY Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              '$monthName, $year',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: 100,
            width: widget.screenWidth * 0.95,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 210, 15, 197),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(days.length, (index) {
                  bool isCurrentDay = index == highlightedIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        highlightedIndex = index;
                        _updateHeaderTitle();
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 80,
                      width: 40,
                      decoration: BoxDecoration(
                        color: isCurrentDay ? Colors.white : Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            days[index].day,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            DateFormat('d').format(days[index].date),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 5.0),
                child: Text(
                  headerTitle,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 5.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      if (!isScheduleAvailable) {
                        _showUpdateDialog(context);
                      } else {
                        _showUpdateDialog(context);
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 54, 63, 244),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      isScheduleAvailable ? "Update" : "Add",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                children: List.generate(
                  days[highlightedIndex].lectures.length,
                  (index) {
                    final lecture = days[highlightedIndex].lectures[index];
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
                            lecture.time,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            // Only show "- Practical" if type is Practical
                            // Theory will be stored but not displayed
                            lecture.type == 'Practical'
                                ? "${lecture.subject} - Practical"
                                : lecture.subject,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Schedule6 extends StatefulWidget {
  final double screenWidth;
  const Schedule6({super.key, required this.screenWidth});

  @override
  _Schedule6State createState() => _Schedule6State();
}

class _Schedule6State extends State<Schedule6> {
  DateTime today = DateTime.now();
  int highlightedIndex = 0;
  String headerTitle = "Today's Lectures";
  bool isScheduleAvailable = false;
  bool isScheduleAdded = false;

  List<DaySchedule> days = [];

  final List<String> lectures = [
    "Lecture 1",
    "Lecture 2",
    "Lecture 3",
    "Lecture 4",
  ];

  final Map<String, String> fullDayNames = {
    'Mon': 'Monday',
    'Tue': 'Tuesday',
    'Wed': 'Wednesday',
    'Thu': 'Thursday',
    'Fri': 'Friday',
    'Sat': 'Saturday',
    'Sun': 'Sunday',
  };

  String? selectedDay;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String? selectedSubject;
  int? selectedLectureIndex;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  String? selectedType;

  @override
  void initState() {
    super.initState();
    _initializeDays();
    _initializeCurrentDay();
    _startDayChangeTimer();
    _checkScheduleAvailability();
    _fetchScheduleFromFirestore();
  }

  void _initializeDays() {
    DateTime monday = today.subtract(Duration(days: today.weekday - 1));

    days = List.generate(7, (index) {
      DateTime currentDate = monday.add(Duration(days: index));
      String dayName = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index];
      return DaySchedule(
        day: dayName,
        date: currentDate,
        lectures: List.generate(
          4,
          (i) => Lecture(subject: 'Please Add Subject Name', time: 'Timing'),
        ),
      );
    });
  }

  void _initializeCurrentDay() {
    final currentDay = _getDayName(today);
    highlightedIndex = days.indexWhere((day) => day.day == currentDay);
    if (highlightedIndex == -1) highlightedIndex = 0;
    _updateHeaderTitle();
  }

  void _updateHeaderTitle() {
    setState(() {
      headerTitle =
          highlightedIndex == 0 ? "Today's Lectures" : "Scheduled Lectures";
    });
  }

  void _startDayChangeTimer() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      final now = DateTime.now();
      if (now.day != today.day) {
        setState(() {
          today = now;
          _shiftDays();
          _initializeCurrentDay();
        });
      }
    });
  }

  void _shiftDays() {
    final daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    DateTime nextDay = days.last.date.add(const Duration(days: 1));

    days = [
      ...days.sublist(1),
      DaySchedule(
        day: daysOfWeek[(daysOfWeek.indexOf(days.last.day) + 1) % 7],
        date: nextDay,
        lectures: List.generate(
          4,
          (i) => Lecture(subject: 'Please Add Subject Name', time: 'Timing'),
        ),
      ),
    ];
  }

  String _getDayName(DateTime date) {
    const daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return daysOfWeek[date.weekday - 1];
  }

  void _checkScheduleAvailability() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('schedules-BSC-DS-TY')
            .get();
    setState(() {
      isScheduleAvailable = snapshot.docs.isNotEmpty;
      isScheduleAdded = snapshot.docs.isNotEmpty;
    });
  }

  void _fetchScheduleFromFirestore() async {
    final snapshot =
        await FirebaseFirestore.instance
            .collection('schedules-BSC-DS-TY')
            .get();
    if (snapshot.docs.isNotEmpty) {
      for (var doc in snapshot.docs) {
        String day = doc.id;
        List<Lecture> lectures =
            (doc['lectures'] as List).map((lecture) {
              return Lecture(
                subject: lecture['subject'],
                time: lecture['time'],
                type: lecture['type'],
              );
            }).toList();

        int dayIndex = days.indexWhere((daySchedule) => daySchedule.day == day);
        if (dayIndex != -1) {
          setState(() {
            days[dayIndex].lectures = lectures;
          });
        }
      }
      _initializeCurrentDay();
    }
  }

  // NEW: Method to show success dialog
  void _showSuccessDialog(BuildContext context, String selectedDay) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Lecture updated successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the success dialog
                  // Find and navigate to the selected day
                  int dayIndex = days.indexWhere(
                    (day) => day.day == selectedDay,
                  );
                  if (dayIndex != -1) {
                    setState(() {
                      highlightedIndex = dayIndex;
                      _updateHeaderTitle();
                    });
                  }
                },
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _pickDay(BuildContext context) async {
    String? selectedDay = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text("Select Day")),
          content: SizedBox(
            width: 300,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    days.map((daySchedule) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop(daySchedule.day);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Text(
                                fullDayNames[daySchedule.day] ??
                                    daySchedule.day,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
        );
      },
    );

    if (selectedDay != null) {
      setState(() {
        this.selectedDay = selectedDay;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text("Update Schedule"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      _pickDay(context);
                    },
                    child: Text(
                      selectedDay == null
                          ? "Select Day"
                          : (fullDayNames[selectedDay!] ?? selectedDay!),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _pickStartTime(context);
                        },
                        child: Text(
                          startTime == null
                              ? "Start Time"
                              : startTime!.format(context),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _pickEndTime(context);
                        },
                        child: Text(
                          endTime == null
                              ? "End Time"
                              : endTime!.format(context),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 130,
                    child: DropdownButtonFormField<int?>(
                      value: selectedLectureIndex,
                      hint: const Text("Select Lecture"),
                      onChanged: (int? newIndex) {
                        setState(() {
                          selectedLectureIndex = newIndex;
                        });
                      },
                      items: List.generate(lectures.length, (index) {
                        return DropdownMenuItem<int>(
                          value: index,
                          child: Text(lectures[index]),
                        );
                      }),
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        selectedSubject = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter Subject",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Theory',
                            groupValue: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),
                          const Text('Theory'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Practical',
                            groupValue: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),
                          const Text('Practical'),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (selectedDay != null && selectedLectureIndex != null) {
                        String time =
                            "${startTime!.format(context)} - ${endTime!.format(context)}";
                        String subject = selectedSubject ?? "No Subject";

                        int dayIndex = days.indexWhere(
                          (day) => day.day == selectedDay,
                        );

                        if (dayIndex != -1) {
                          if (days[dayIndex].lectures.length < 4) {
                            days[dayIndex].lectures.add(
                              Lecture(
                                subject: subject,
                                time: time,
                                type: selectedType,
                              ),
                            );
                          } else {
                            days[dayIndex]
                                .lectures[selectedLectureIndex!] = Lecture(
                              subject: subject,
                              time: time,
                              type: selectedType,
                            );
                          }

                          await FirebaseFirestore.instance
                              .collection('schedules-BSC-DS-TY')
                              .doc(selectedDay!)
                              .set({
                                'day': selectedDay,
                                'fullDayName': fullDayNames[selectedDay!],
                                'lectures':
                                    days[dayIndex].lectures
                                        .map(
                                          (lecture) => {
                                            'subject': lecture.subject,
                                            'time': lecture.time,
                                            'type': lecture.type,
                                          },
                                        )
                                        .toList(),
                                'created_at': FieldValue.serverTimestamp(),
                              })
                              .then((value) {
                                Navigator.of(
                                  context,
                                ).pop(); // Close update dialog
                                _showSuccessDialog(
                                  context,
                                  selectedDay!,
                                ); // Show success dialog
                              })
                              .catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Failed to update schedule: $error',
                                    ),
                                  ),
                                );
                              });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Selected day not found'),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill in all fields'),
                          ),
                        );
                      }
                    },
                    child: const Text("Update Schedule"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _pickStartTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        startTime = pickedTime;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  void _pickEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        endTime = pickedTime;
      });
      Navigator.of(context).pop();
      _showUpdateDialog(context);
    }
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    String monthName = _getMonthName(today.month);
    String year = today.year.toString();

    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 6.0, right: 6.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(bottom: 15.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 197, 224, 18),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'BSC DS TY Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              '$monthName, $year',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: 100,
            width: widget.screenWidth * 0.95,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 197, 224, 18),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(days.length, (index) {
                  bool isCurrentDay = index == highlightedIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        highlightedIndex = index;
                        _updateHeaderTitle();
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 80,
                      width: 40,
                      decoration: BoxDecoration(
                        color: isCurrentDay ? Colors.white : Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            days[index].day,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            DateFormat('d').format(days[index].date),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 5.0),
                child: Text(
                  headerTitle,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 5.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      if (!isScheduleAvailable) {
                        _showUpdateDialog(context);
                      } else {
                        _showUpdateDialog(context);
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 54, 63, 244),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      isScheduleAvailable ? "Update" : "Add",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                children: List.generate(
                  days[highlightedIndex].lectures.length,
                  (index) {
                    final lecture = days[highlightedIndex].lectures[index];
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
                            lecture.time,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            // Only show "- Practical" if type is Practical
                            // Theory will be stored but not displayed
                            lecture.type == 'Practical'
                                ? "${lecture.subject} - Practical"
                                : lecture.subject,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
