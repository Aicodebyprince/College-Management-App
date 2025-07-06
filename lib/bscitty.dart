import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class Schedule3 extends StatelessWidget {
  const Schedule3({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(children: [ScheduleWidget(screenWidth: screenWidth)]),
    );
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
  List<DaySchedule> days = [];

  @override
  void initState() {
    super.initState();
    _initializeDays();
    _initializeCurrentDay();
    _startDayChangeTimer();
    _fetchScheduleFromFirestore();
  }

  /// 🔹 Initialize the 7-day schedule
  void _initializeDays() {
    DateTime monday = today.subtract(Duration(days: today.weekday - 1));

    days = List.generate(7, (index) {
      DateTime currentDate = monday.add(Duration(days: index));
      String dayName = DateFormat('EEE').format(currentDate);
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

  /// 🔹 Set current day's index
  void _initializeCurrentDay() {
    final currentDay = DateFormat('EEE').format(today);
    highlightedIndex = days.indexWhere((day) => day.day == currentDay);
    if (highlightedIndex == -1) highlightedIndex = 0;
    _updateHeaderTitle();
  }

  /// 🔹 Update the header title based on selected day
  void _updateHeaderTitle() {
    setState(() {
      headerTitle =
          highlightedIndex == 0
              ? "Today's Lectures BSC IT TY"
              : "Scheduled Lectures BSC IT TY";
    });
  }

  /// 🔹 Automatically update day when date changes
  void _startDayChangeTimer() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      final now = DateTime.now();
      if (now.day != today.day) {
        setState(() {
          today = now;
          _initializeDays();
          _initializeCurrentDay();
        });
      }
    });
  }

  /// 🔹 Fetch schedule from Firestore
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
    }
  }

  /// 🔹 Get month name
  String _getMonthName(int month) {
    return DateFormat('MMMM').format(DateTime(today.year, month));
  }

  @override
  Widget build(BuildContext context) {
    String monthName = _getMonthName(today.month);
    String year = today.year.toString();

    return Padding(
      padding: const EdgeInsets.only(top: 2.0, left: 6.0, right: 6.0),
      child: Column(
        children: [
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
              color: Color.fromARGB(255, 175, 22, 162),
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
                      width: 50,
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
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isCurrentDay ? Colors.red : Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            DateFormat('d').format(days[index].date),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isCurrentDay ? Colors.red : Colors.white,
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
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  headerTitle,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
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
