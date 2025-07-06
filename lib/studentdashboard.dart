import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:princeproject/academic_student_calendar.dart';
import 'package:princeproject/bscDS_FY.dart';
import 'package:princeproject/bscDS_SY.dart';
import 'package:princeproject/bscDS_TY.dart';
import 'package:princeproject/bscitsy.dart';
import 'package:princeproject/bscitty.dart';
import 'package:princeproject/studenttimetable.dart';
import 'loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentDashboard extends StatefulWidget {
  final String streamYearRollNo;
  const StudentDashboard({super.key, required this.streamYearRollNo});

  @override
  // ignore: library_private_types_in_public_api
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  int selectedIndex = 0;
  double practicalPercentage = 0.0;
  double theoryPercentage = 0.0;
  double overallPercentage = 0.0;
  bool isLoading = true;
  String studentName = '';
  String studentEmail = '';

  // Get current user UID
  String get userId => FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    super.initState();
    _fetchAttendance();
    _fetchStudentDetails();
  }

  Future<void> _fetchAttendance() async {
    try {
      var attendanceDoc =
          await FirebaseFirestore.instance
              .collection('attendance')
              .doc(widget.streamYearRollNo) // Use UID here
              .get();

      if (attendanceDoc.exists) {
        var attendanceData = attendanceDoc.data()?['attendance'] as List?;

        if (attendanceData != null) {
          int practicalPresent = 0;
          int practicalTotal = 0;
          int theoryPresent = 0;
          int theoryTotal = 0;
          int totalPresent = 0;
          int totalLectures = 0;

          for (var attendance in attendanceData) {
            var lecturesData = attendance['lectures'] as List?;

            if (lecturesData != null) {
              for (var lecture in lecturesData) {
                if (lecture['type'] == 'Practical') {
                  practicalTotal++;
                  if (lecture['status'] == true) practicalPresent++;
                } else if (lecture['type'] == 'Theory') {
                  theoryTotal++;
                  if (lecture['status'] == true) theoryPresent++;
                }

                totalLectures++;
                if (lecture['status'] == true) totalPresent++;
              }
            }
          }

          setState(() {
            practicalPercentage =
                practicalTotal > 0 ? practicalPresent / practicalTotal : 0.0;
            theoryPercentage =
                theoryTotal > 0 ? theoryPresent / theoryTotal : 0.0;
            overallPercentage =
                totalLectures > 0 ? totalPresent / totalLectures : 0.0;
          });
        }
      }
    } catch (e) {
      print('Error fetching attendance: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _fetchStudentDetails() async {
    try {
      var studentDoc =
          await FirebaseFirestore.instance
              .collection('students')
              .doc(widget.streamYearRollNo) // Use UID here
              .get();

      if (studentDoc.exists) {
        setState(() {
          studentName = studentDoc.data()?['name'] ?? '';
          studentEmail = studentDoc.data()?['email'] ?? '';
        });
      }
    } catch (e) {
      print('Error fetching student details: $e');
    }
  }

  Widget _buildSelectedScreen() {
    switch (selectedIndex) {
      case 0:
        return DashboardScreen(
          practical: practicalPercentage,
          theory: theoryPercentage,
          overall: overallPercentage,
        );
      case 1:
        return AttendanceScreen(
          userId: userId,
          streamYearRollNo: widget.streamYearRollNo,
        );
      case 2:
        return SyllabusOptionsScreen(userId: userId);
      case 3:
        return Profile(userId: userId);
      default:
        return const Center(child: Text('Under Development'));
    }
  }

  Drawer _buildDrawer(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2980B9), Color(0xFF2E4053)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Text(
                    user?.email?.substring(0, 1) ?? 'S',
                    style: const TextStyle(
                      fontSize: 28,
                      color: Color(0xFF2E4053),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  user?.email ?? 'Student Account',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          _buildListTile(
            icon: Icons.event,
            title: 'College Events',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EventsScreen()),
              );
            },
          ),
          const Divider(thickness: 1),
          _buildListTile(
            icon: Icons.event,
            title: 'Academic Calendar',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AcademicCalendar()),
              );
            },
          ),
          const Divider(thickness: 1),
          _buildListTile(
            icon: Icons.logout,
            title: 'Logout',
            color: const Color(0xFFE74C3C),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  // Reusable list tile builder matching teacher's style
  ListTile _buildListTile({
    required IconData icon,
    required String title,
    Color color = const Color(0xFF2E4053),
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
      hoverColor: color.withOpacity(0.1),
      splashColor: color.withOpacity(0.2),
    );
  }

  String get _appBarTitle {
    switch (selectedIndex) {
      case 0:
        return 'Student Dashboard';
      case 1:
        return 'Attendance Track';
      case 2:
        return 'Syllabus & Notes';
      case 3:
        return 'Profile';
      default:
        return 'Student Dashboard';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appBarTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 188, 36, 36),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true, // Add this line to center the title
      ),
      drawer: _buildDrawer(context),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildSelectedScreen(),
              ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) => setState(() => selectedIndex = index),
          items: [
            _buildNavItem(Icons.home_outlined, Icons.home_filled, 'Home', 0),
            _buildNavItem(
              Icons.access_time_outlined,
              Icons.access_time_filled,
              'Attendance',
              1,
            ),
            _buildNavItem(Icons.article_outlined, Icons.article, 'Syllabus', 2),
            _buildNavItem(Icons.person_outline, Icons.person, 'Profile', 3),
          ],
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff9a1b1b), // Match your red theme
          unselectedItemColor: Colors.grey[600],
          selectedLabelStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Color(0xff9a1b1b),
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
          showSelectedLabels: true,
          showUnselectedLabels: false,
          elevation: 10,
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData outlineIcon,
    IconData filledIcon,
    String label,
    int index,
  ) {
    final isSelected = selectedIndex == index;

    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient:
              isSelected
                  ? LinearGradient(
                    colors: [
                      Color.fromARGB(255, 237, 63, 63),
                      Color.fromARGB(255, 222, 54, 54),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                  : null,
        ),
        child: Icon(
          isSelected ? filledIcon : outlineIcon,
          size: isSelected ? 26 : 24,
          color: isSelected ? Colors.white : Colors.grey[600],
        ),
      ),
      label: label,
      activeIcon: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 222, 43, 43),
              Color.fromARGB(255, 218, 35, 35),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Icon(filledIcon, size: 26, color: Colors.white),
      ),
    );
  }
}

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('College Events')),
      body: Container(
        color: Colors.white,
        child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance
                  .collection('events')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Error loading events'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView(
              padding: const EdgeInsets.all(16),
              children:
                  snapshot.data!.docs.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    return EventCard(
                      imageUrl: data['imageUrl'] as String?,
                      title: data['title'] as String?,
                      date: data['date'] as String?,
                      description: data['description'] as String?,
                      link: data['link'] as String?,
                    );
                  }).toList(),
            );
          },
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? date;
  final String? description;
  final String? link;

  const EventCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.description,
    required this.link,
  });

  void _launchURL(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(const SnackBar(content: Text('Could not launch URL')));
    }
  }

  void _showImageZoom(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder:
          (context) => GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            behavior: HitTestBehavior.opaque,
            child: Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.zero,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: PhotoView(
                  imageProvider: NetworkImage(imageUrl),
                  backgroundDecoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 4,
                  initialScale: PhotoViewComputedScale.contained,
                  heroAttributes: PhotoViewHeroAttributes(tag: imageUrl),
                  gestureDetectorBehavior: HitTestBehavior.translucent,
                ),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0x9BC5C6CA),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                if (imageUrl != null) {
                  _showImageZoom(context, imageUrl!);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl ?? 'https://via.placeholder.com/400x200',
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? 'No Title',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    date ?? 'No Date',
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description != null && description!.length > 100
                        ? '${description!.substring(0, 100)}...'
                        : description ?? 'No Description',
                    style: const TextStyle(color: Colors.black, fontSize: 13),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: Text(title ?? 'No Title'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(description ?? 'No Description'),
                                    if (link != null && link!.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 16),
                                        child: InkWell(
                                          onTap:
                                              () => _launchURL(context, link!),
                                          child: Text(
                                            link!,
                                            style: TextStyle(
                                              color: Colors.blue.shade400,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE0E3E7),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Read More',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (link != null && link!.isNotEmpty) {
                        _launchURL(context, link!);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4B39EF),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Join us',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  final double offsetY;

  CustomFloatingActionButtonLocation({required this.offsetY});

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX =
        (scaffoldGeometry.scaffoldSize.width / 2) -
        (scaffoldGeometry.floatingActionButtonSize.width / 2);
    final double fabY =
        scaffoldGeometry.scaffoldSize.height -
        scaffoldGeometry.bottomSheetSize.height -
        scaffoldGeometry.floatingActionButtonSize.height / 2 -
        offsetY;
    return Offset(fabX, fabY);
  }
}

// Dashboard screen for student dashboard
// Add this to the DashboardScreen section
class DashboardScreen extends StatefulWidget {
  final double practical;
  final double theory;
  final double overall;

  const DashboardScreen({
    super.key,
    required this.practical,
    required this.theory,
    required this.overall,
  });

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0; // Track which view is active

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  AttendanceCard(
                    practicalPercentage: widget.practical,
                    theoryPercentage: widget.theory,
                    overallPercentage: widget.overall,
                  ),

                  IndexedStack(
                    index: _currentIndex, // Switches views based on index
                    children: const [
                      Schedule(),
                      Schedule2(),
                      Schedule3(),
                      Schedule4(),
                      Schedule5(),
                      Schedule6(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // Floating Action Button to Switch Between Views
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            backgroundColor: const Color(0xff9a1b1b),
            onPressed: () {
              setState(() {
                _currentIndex =
                    (_currentIndex + 1) % 6; // Cycles through 0 → 1 → 2 → 0
              });
            },
            child: Icon(
              Icons.swap_horiz, // Shows a swap icon
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class AttendanceCard extends StatelessWidget {
  final double practicalPercentage;
  final double theoryPercentage;
  final double overallPercentage;

  const AttendanceCard({
    super.key,
    required this.practicalPercentage,
    required this.theoryPercentage,
    required this.overallPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff9a1b1b), Colors.blue[800]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Attendance Summary',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCircle('Practical', practicalPercentage, Colors.purple),
                  _buildCircle('Theory', theoryPercentage, Colors.orange),
                  _buildCircle('Overall', overallPercentage, Colors.teal),
                ],
              ),
              SizedBox(height: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircle(String title, double percentage, Color color) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                value: percentage,
                strokeWidth: 8,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
            Text(
              '${(percentage * 100).toStringAsFixed(1)}%',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class AttendanceScreen extends StatefulWidget {
  final String userId;
  final String streamYearRollNo;

  const AttendanceScreen({
    super.key,
    required this.userId,
    required this.streamYearRollNo,
  });

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen>
    with SingleTickerProviderStateMixin {
  bool _isSheetVisible = false;
  DateTime _selectedDate = DateTime.now();
  DateTime _currentMonth = DateTime.now();
  late AnimationController _animationController;
  late Animation<double> _animation;
  List<Lecture> _lectures = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.value = 0.0;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _fetchAttendanceData(DateTime date) async {
    final formattedDate = DateFormat('yyyy-MM-dd').format(date);
    try {
      final snapshot =
          await FirebaseFirestore.instance
              .collection('attendance')
              .doc(widget.streamYearRollNo) // Changed to use UID
              .get();

      if (snapshot.exists) {
        final attendanceData = snapshot.data()?['attendance'] as List?;
        List<Lecture> lectures = []; // Initialize an empty list

        if (attendanceData != null) {
          for (var attendance in attendanceData) {
            final attendanceDate = attendance['date'] as String?;
            if (attendanceDate != null && attendanceDate == formattedDate) {
              final lecturesData = attendance['lectures'] as List?;
              if (lecturesData != null) {
                for (var lectureData in lecturesData) {
                  if (lectureData['time'] != null &&
                      lectureData['type'] != null) {
                    lectures.add(Lecture.fromMap(lectureData));
                  } else {
                    // ignore: avoid_print
                    print('Warning: Missing required lecture info.');
                  }
                }
              }
            }
          }
          setState(() {
            _lectures = lectures;
          });
        } else {
          setState(() {
            _lectures = [];
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('No attendance data found for $formattedDate'),
            ),
          );
        }
      } else {
        setState(() {
          _lectures = [];
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('No attendance document found')));
      }
    } catch (e) {
      setState(() {
        _lectures = [];
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error fetching data: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _buildHeader(),
                _buildCalendar(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ), // Add bottom spacing
              ],
            ),
            if (_isSheetVisible) _buildAttendanceSheet(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat('MMMM yyyy').format(_currentMonth),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left, size: 20),
                onPressed: _previousMonth,
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right, size: 20),
                onPressed: _nextMonth,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(20),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.38,
      ),
      child: Column(
        children: [
          _buildWeekdayHeader(),
          const SizedBox(height: 8),
          Expanded(child: _buildCalendarGrid()),
        ],
      ),
    );
  }

  Widget _buildWeekdayHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:
          ['M', 'T', 'W', 'T', 'F', 'S', 'S']
              .map(
                (day) => Text(
                  day,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildCalendarGrid() {
    final daysInMonth =
        DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
    final firstDayOffset =
        DateTime(_currentMonth.year, _currentMonth.month, 1).weekday - 1;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 42,
      itemBuilder: (context, index) {
        if (index < firstDayOffset || index >= firstDayOffset + daysInMonth) {
          return const SizedBox.shrink();
        }
        final day = index - firstDayOffset + 1;
        final date = DateTime(_currentMonth.year, _currentMonth.month, day);
        final isSelected =
            _selectedDate.year == date.year &&
            _selectedDate.month == date.month &&
            _selectedDate.day == date.day;
        final isToday =
            DateTime.now().year == date.year &&
            DateTime.now().month == date.month &&
            DateTime.now().day == date.day;
        return GestureDetector(
          onTap: () => _selectDate(date),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  isSelected
                      // ignore: deprecated_member_use
                      ? Colors.white.withOpacity(0.2)
                      : Colors.transparent,
            ),
            child: Center(
              child: Text(
                day.toString(),
                style: TextStyle(
                  color: isToday ? Colors.white : Colors.grey[400],
                  fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAttendanceSheet() {
    return Positioned(
      left: 15,
      right: 15,
      bottom: 10,
      top: MediaQuery.of(context).size.height * 0.50,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(_animation),
        child: GestureDetector(
          onTap: () {
            setState(() => _isSheetVisible = false);
            _animationController.reverse();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Attendance for ${DateFormat('dd MMMM yyyy').format(_selectedDate)}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child:
                      _lectures.isEmpty
                          ? Center(
                            child: Text(
                              'No lectures available',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          )
                          : ListView.builder(
                            itemCount: _lectures.length,
                            itemBuilder: (context, index) {
                              return _buildLectureItem(_lectures[index]);
                            },
                          ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLectureItem(Lecture lecture) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: lecture.status ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 10),
          Text(
            '${lecture.time} (${lecture.type})',
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }

  void _selectDate(DateTime date) async {
    setState(() {
      _selectedDate = date;
      _isSheetVisible = true;
    });
    await _fetchAttendanceData(date);
    _animationController.forward(from: 0);
  }

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
      _animationController.reverse();
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
      _animationController.reverse();
    });
  }
}

class Lecture {
  final String time;
  final String type;
  final bool status;

  Lecture({required this.time, required this.type, required this.status});

  factory Lecture.fromMap(Map<String, dynamic> map) {
    return Lecture(
      time: map['time'] as String,
      type: map['type'] as String,
      status: map['status'] as bool,
    );
  }
}

class Student {
  final String name;
  final String rollNo;
  final String stream;
  final List<Map<String, dynamic>> lectures;

  Student({
    required this.name,
    required this.rollNo,
    required this.stream,
    required this.lectures,
  });
}

// Example screen to use for the second and third tabs
class SyllabusOptionsScreen extends StatelessWidget {
  final String userId;

  const SyllabusOptionsScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          _buildOptionCard(
            context: context,
            title: 'Syllabus Tracker',
            subtitle: 'View course structure & progress',
            icon: Icons.auto_graph_rounded,
            colorStart: const Color(0xFF6B4EFF),
            colorEnd: const Color(0xFF905BFF),
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SyllabusScreen(userId: userId),
                  ),
                ),
          ),
          const SizedBox(height: 24),
          _buildOptionCard(
            context: context,
            title: 'Study Materials',
            subtitle: 'Access notes & resources',
            icon: Icons.library_books_rounded,
            colorStart: const Color(0xFF2BC8D9),
            colorEnd: const Color(0xFF26E6A0),
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotesScreen(userId: userId),
                  ),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color colorStart,
    required Color colorEnd,
    required Function() onTap,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 8,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [colorStart, colorEnd],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: colorStart.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          splashColor: Colors.white.withOpacity(0.2),
          highlightColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Stack(
              children: [
                // Background pattern
                Positioned(
                  right: -30,
                  top: -30,
                  child: Icon(
                    icon,
                    size: 150,
                    color: Colors.white.withOpacity(0.08),
                  ),
                ),
                // Content
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Icon(icon, size: 32, color: Colors.white),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          'Explore Now',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 20,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SyllabusScreen extends StatefulWidget {
  final String userId;

  const SyllabusScreen({super.key, required this.userId});

  @override
  // ignore: library_private_types_in_public_api
  _SyllabusScreenState createState() => _SyllabusScreenState();
}

class _SyllabusScreenState extends State<SyllabusScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Subject> _subjects = [];
  bool _isLoading = true;
  late String _stream;
  late String _year;
  final Set<String> _expandedSubjects = {};

  @override
  void initState() {
    super.initState();
    _fetchStudentStreamYear();
    _fetchSyllabusData();
  }

  void _fetchStudentStreamYear() async {
    try {
      final studentDoc =
          await FirebaseFirestore.instance
              .collection('students')
              .doc(widget.userId)
              .get();

      if (studentDoc.exists) {
        final data = studentDoc.data()!;
        setState(() {
          _stream = data['stream'] ?? 'Unknown Stream';
          _year = data['year'] ?? 'Unknown Year';
        });
        _fetchSyllabusData();
      }
    } catch (e) {
      print('Error fetching student stream/year: $e');
    }
  }

  Future<void> _fetchSyllabusData() async {
    if (_stream.isEmpty || _year.isEmpty) {
      // ignore: avoid_print
      print('Invalid stream or year');
      setState(() => _isLoading = false);
      return;
    }

    try {
      final key = '$_stream-$_year'; // Uses hyphen to match Firestore structure
      final doc = await _firestore.collection('Syllabus').doc(key).get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          _subjects =
              (data['subjects'] as List)
                  .map((subject) => Subject.fromMap(subject))
                  .toList();
        });
      } else {
        print('No syllabus found for $key');
      }
    } catch (e) {
      print('Error fetching syllabus: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Syllabus Track')),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _subjects.isEmpty
              ? const Center(child: Text('No syllabus data available'))
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Syllabus ($_stream - Year $_year)',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _subjects.length,
                        itemBuilder:
                            (context, index) =>
                                _buildSubjectCard(_subjects[index]),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }

  Widget _buildSubjectCard(Subject subject) {
    final completedUnits = subject.units.where((unit) => unit.completed).length;
    final totalUnits = subject.units.length;
    final percentage = totalUnits > 0 ? (completedUnits / totalUnits) * 100 : 0;
    final completedParts = (percentage / 10).floor();

    // Generate gradient parameters
    List<Color> gradientColors = [];
    List<double> gradientStops = [];
    for (int i = 0; i < 10; i++) {
      final isCompleted = i < completedParts;
      final start = i / 10;
      final end = (i + 1) / 10;
      gradientColors.add(isCompleted ? Colors.green : Colors.white);
      gradientStops.add(start);
      gradientColors.add(isCompleted ? Colors.green : Colors.white);
      gradientStops.add(end);
    }

    bool isExpanded = _expandedSubjects.contains(subject.name);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        gradient:
            !isExpanded
                ? LinearGradient(
                  colors: gradientColors,
                  stops: gradientStops,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
                : null,
        color: isExpanded ? Colors.white : null,
      ),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ExpansionTile(
          onExpansionChanged: (isExpanded) {
            setState(() {
              if (isExpanded) {
                _expandedSubjects.add(subject.name);
              } else {
                _expandedSubjects.remove(subject.name);
              }
            });
          },
          title: Text(
            '${subject.name} (${subject.type})',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isExpanded ? Colors.black : Colors.black,
            ),
          ),
          subtitle: Text(
            'Completed: ${percentage.toStringAsFixed(0)}%',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isExpanded ? Colors.black54 : Colors.black54,
            ),
          ),
          children:
              subject.units.map((unit) {
                return ListTile(
                  title: Text(
                    unit.content.isEmpty
                        ? 'No content available'
                        : unit.content,
                    style: const TextStyle(fontSize: 14),
                  ),
                  trailing: Icon(
                    unit.completed
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: unit.completed ? Colors.green : Colors.grey,
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}

class NotesScreen extends StatefulWidget {
  final String userId;

  const NotesScreen({super.key, required this.userId});

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  String _stream = '';
  String _year = '';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _fetchStreamYear();
  }

  void _fetchStreamYear() async {
    try {
      final studentDoc =
          await FirebaseFirestore.instance
              .collection('students')
              .doc(widget.userId)
              .get();

      if (studentDoc.exists) {
        final data = studentDoc.data()!;
        setState(() {
          _stream = data['stream'] ?? 'Unknown';
          _year = data['year'] ?? 'Unknown';
        });
      }
    } catch (e) {
      print('Error fetching stream/year: $e');
      setState(() {
        _stream = 'Error';
        _year = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Study Materials',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4B39EF), Color(0xFF2E67F6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            _firestore
                .collection('notes')
                .doc('${_stream}_$_year')
                .collection('messages')
                .orderBy('timestamp', descending: true)
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4B39EF)),
                ),
              ),
            );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.note_add_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'No materials available yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Check back later for updates',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
            );
          }

          final notes = snapshot.data!.docs;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: notes.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final note = notes[index].data() as Map<String, dynamic>;
                return _buildNoteItem(note);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildNoteItem(Map<String, dynamic> note) {
    final timestamp = note['timestamp']?.toDate() ?? DateTime.now();
    final isFile = note['type'] == 'file';
    final fileName = note['fileName'] ?? 'Untitled';
    final fileType = note['fileType']?.toString().toUpperCase() ?? 'FILE';

    return Material(
      borderRadius: BorderRadius.circular(15),
      elevation: 2,
      color: isFile ? Color(0xFFF5F7FB) : Color(0xFFF8F9FC),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: isFile ? () => _downloadFile(note['fileUrl'], fileName) : null,
        splashColor: Color(0xFF4B39EF).withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isFile) ...[
                Row(
                  children: [
                    _FileTypeIcon(fileType: fileType),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fileName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1A1D1F),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$fileType File',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.download_rounded,
                        color: Color(0xFF4B39EF),
                      ),
                      onPressed: () => _downloadFile(note['fileUrl'], fileName),
                    ),
                  ],
                ),
              ] else ...[
                Text(
                  note['text'] ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF1A1D1F),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    size: 16,
                    color: Colors.grey[500],
                  ),
                  const SizedBox(width: 6),
                  Text(
                    DateFormat('MMM dd, yyyy - hh:mm a').format(timestamp),
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _downloadFile(String url, String fileName) async {
    try {
      final directory = await getDownloadsDirectory();
      if (directory == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cannot access download directory')),
        );
        return;
      }
      final savePath = '${directory.path}/$fileName';

      // Check if file already exists
      bool fileExists = await File(savePath).exists();
      if (fileExists) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('File already downloaded')));
        _openFile(savePath);
        return;
      }

      Dio dio = Dio();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text('Downloading $fileName...'),
            ],
          ),
        ),
      );

      await dio.download(url, savePath);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('File saved to Downloads'),
          backgroundColor: Colors.green,
        ),
      );
      _openFile(savePath);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Download failed: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _openFile(String filePath) async {
    try {
      final result = await OpenFile.open(filePath);
      if (result.type != ResultType.done) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cannot open file: ${result.message}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error opening file: ${e.toString()}')),
      );
    }
  }
}

class _FileTypeIcon extends StatelessWidget {
  final String fileType;

  const _FileTypeIcon({required this.fileType});

  @override
  Widget build(BuildContext context) {
    final iconColor = _getFileTypeColor();
    final iconData = _getFileTypeIcon();

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Icon(iconData, color: iconColor, size: 24)),
    );
  }

  Color _getFileTypeColor() {
    switch (fileType.toLowerCase()) {
      case 'pdf':
        return Color(0xFFE74C3C);
      case 'doc':
      case 'docx':
        return Color(0xFF2E67F6);
      case 'xls':
      case 'xlsx':
        return Color(0xFF27AE60);
      case 'ppt':
      case 'pptx':
        return Color(0xFFF39C12);
      default:
        return Color(0xFF4B39EF);
    }
  }

  IconData _getFileTypeIcon() {
    switch (fileType.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf_outlined;
      case 'doc':
      case 'docx':
        return Icons.article_outlined;
      case 'xls':
      case 'xlsx':
        return Icons.table_chart_outlined;
      case 'ppt':
      case 'pptx':
        return Icons.slideshow_outlined;
      default:
        return Icons.insert_drive_file_outlined;
    }
  }
}

// Keep the same Subject and Unit classes from teacher's code
class Subject {
  final String name;
  final String type;
  final List<Unit> units;

  Subject({required this.name, required this.type, required this.units});

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      name: map['name'],
      type: map['type'],
      units: (map['units'] as List).map((unit) => Unit.fromMap(unit)).toList(),
    );
  }
}

class Unit {
  final String content;
  final bool completed;

  Unit({required this.content, required this.completed});

  factory Unit.fromMap(Map<String, dynamic> map) {
    return Unit(content: map['content'], completed: map['completed']);
  }
}

class Profile extends StatefulWidget {
  final String userId;

  const Profile({super.key, required this.userId});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _stream = '';
  String _year = '';
  String _rollNo = '';
  // ignore: unused_field
  String _email = '';
  bool _isLoading = true;
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchStudentDetails();
  }

  Future<void> _fetchStudentDetails() async {
    try {
      setState(() => _isLoading = true);
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      DocumentSnapshot studentDoc =
          await FirebaseFirestore.instance
              .collection('students')
              .doc(user.uid) // Changed from user.email to user.uid
              .get();

      if (studentDoc.exists) {
        final data = studentDoc.data() as Map<String, dynamic>;
        setState(() {
          _stream = data['stream'] ?? 'Not Available';
          _year = data['year'] ?? 'Not Available';
          _rollNo = data['rollNo']?.toString() ?? 'Not Available';
          _email = data['email'] ?? '';
          _nameController.text = data['name'] ?? '';
          _emailController.text = data['email'] ?? '';
          _dobController.text = data['dob'] ?? '';
          _addressController.text = data['address'] ?? '';
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching student details: $e');
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      try {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null) return;

        await FirebaseFirestore.instance
            .collection('students')
            .doc(user.uid)
            .update({
              'dob': _dobController.text,
              'address': _addressController.text,
            });

        setState(() => _isEditing = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error updating profile: $e')));
      }
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Edit/Save button moved to top-left
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 1,
                              ),
                            ),
                            onPressed: () {
                              if (_isEditing) {
                                _saveProfile();
                              } else {
                                setState(() => _isEditing = true);
                              }
                            },
                            child: Text(
                              _isEditing ? 'SAVE CHANGES' : 'EDIT PROFILE',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildProfileHeader(),
                      const SizedBox(height: 24),
                      _buildPersonalInfoSection(),
                      const SizedBox(height: 24),
                      _buildAcademicInfoSection(),
                    ],
                  ),
                ),
              ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset('assets/rmc_logo.png', fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          _nameController.text,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalInfoSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildInfoTile(
              icon: Icons.person,
              label: 'Full Name',
              value: _nameController.text,
            ),
            const Divider(height: 24),
            _buildInfoTile(
              icon: Icons.email,
              label: 'Email',
              value: _emailController.text,
            ),
            const Divider(height: 24),
            _buildDatePickerField(),
            const Divider(height: 24),
            _buildEditableField(
              label: 'Address',
              icon: Icons.location_on,
              controller: _addressController,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildDatePickerField() {
    return ListTile(
      leading: const Icon(Icons.calendar_today, color: Colors.blue),
      title: const Text(
        'Date of Birth',
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: GestureDetector(
        onTap: _isEditing ? _selectDate : null,
        child: AbsorbPointer(
          absorbing: true,
          child: TextFormField(
            controller: _dobController,
            decoration: InputDecoration(
              hintText: 'Select Date of Birth',
              border: InputBorder.none,
              suffixIcon:
                  _isEditing
                      ? const Icon(Icons.calendar_month, color: Colors.blue)
                      : null,
            ),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            validator: (value) {
              if (_isEditing && (value == null || value.isEmpty)) {
                return 'Please select date of birth';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextFormField(
            controller: controller,
            enabled: _isEditing,
            maxLines: maxLines,
            decoration: const InputDecoration(border: InputBorder.none),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            validator: (value) {
              if (_isEditing && (value == null || value.isEmpty)) {
                return 'This field is required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAcademicInfoSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildAcademicInfoTile('Stream', _stream),
            const Divider(height: 24),
            _buildAcademicInfoTile('Academic Year', _year),
            const Divider(height: 24),
            _buildAcademicInfoTile('Roll Number', _rollNo),
          ],
        ),
      ),
    );
  }

  Widget _buildAcademicInfoTile(String title, String value) {
    return ListTile(
      leading: const Icon(Icons.school, color: Colors.blue),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
