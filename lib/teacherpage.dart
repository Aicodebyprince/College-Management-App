import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:princeproject/addstudent.dart';
import 'package:princeproject/academic_calendar.dart';
import 'package:princeproject/landing_page.dart';
import 'package:princeproject/timetable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'loginpage.dart';
import 'package:princeproject/syllabus.dart';
import 'package:princeproject/teachernotes.dart';
import 'student.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  bool _isFABOpen = false;
  late AnimationController _animationController;
  late Animation<double> _fabAnimation;
  final List<Widget> _widgetOptions = [Schedule(), ProfileScreen()];
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fabAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  void _toggleFAB() {
    setState(() {
      _isFABOpen = !_isFABOpen;
      _isFABOpen
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedIndex == 0 ? 'Teacher Panel' : 'Profile',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2E4053),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: _buildDrawer(context),
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          if (_isFABOpen) ...[
            // Left FAB
            Positioned(
              bottom: 90,
              left: MediaQuery.of(context).size.width * 0.20,
              child: _buildSubFAB(
                icon: Icons.assignment,
                label: 'Add Attendance',
                onPressed: () => _navigateTo(AddAttendancePage()),
              ),
            ),
            // Center FAB
            Positioned(
              bottom: 120,
              child: _buildSubFAB(
                icon: Icons.note_add,
                label: 'Add Notes',
                onPressed: () => _navigateTo(StreamSelectionPage()),
              ),
            ),
            // Right FAB
            Positioned(
              bottom: 90,
              right: MediaQuery.of(context).size.width * 0.22,
              child: _buildSubFAB(
                icon: Icons.library_books,
                label: 'Add Syllabus',
                onPressed: () => _navigateTo(TeacherPage()),
              ),
            ),
          ],
          // Main FAB (Moved Slightly Up)
          Positioned(
            bottom: 40,
            child: FloatingActionButton(
              heroTag: "mainFAB",
              onPressed: _toggleFAB,
              backgroundColor: const Color(0xFF2980B9),
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: _fabAnimation,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  Widget _buildSubFAB({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ScaleTransition(
      scale: _fabAnimation,
      child: Column(
        children: [
          FloatingActionButton.small(
            heroTag: label,
            onPressed: onPressed,
            backgroundColor: Colors.white,
            child: Icon(icon, color: const Color(0xFF2980B9)),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF2E4053),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
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
                    user?.email?.substring(0, 1) ?? 'T',
                    style: const TextStyle(
                      fontSize: 28,
                      color: Color(0xFF2E4053),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  user?.email ?? 'Teacher Account',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          _buildExpansionTile(
            title: 'BSC IT',
            icon: Icons.computer,
            years: ['FY', 'SY', 'TY'],
          ),
          _buildExpansionTile(
            title: 'BSC Data Science',
            icon: Icons.data_usage,
            years: ['FY', 'SY', 'TY'],
          ),
          const Divider(thickness: 1),
          _buildListTile(
            icon: Icons.event,
            title: 'College Events',
            onTap: () => _navigateTo(TeacherDashboard()),
          ),
          _buildListTile(
            icon: Icons.person_add,
            title: 'Add Student',
            onTap:
                () => _navigateTo(AddStudentPage(onStudentAdded: (student) {})),
          ),
          _buildListTile(
            icon: Icons.event,
            title: 'Academic Calendar',
            onTap: () => _navigateTo(AcademicCalendar()),
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
                MaterialPageRoute(builder: (context) => LandingPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  ExpansionTile _buildExpansionTile({
    required String title,
    required IconData icon,
    required List<String> years,
  }) {
    return ExpansionTile(
      leading: Icon(icon, color: const Color(0xFF2E4053)),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color(0xFF2E4053),
        ),
      ),
      children:
          years
              .map(
                (year) => ListTile(
                  leading: const Icon(Icons.school_outlined),
                  title: Text(year),
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  StudentListPage(stream: title, year: year),
                        ),
                      ),
                ),
              )
              .toList(),
    );
  }

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

  BottomAppBar _buildBottomAppBar() {
    return BottomAppBar(
      color: Colors.transparent, // Makes background transparent
      elevation: 0, // Removes unwanted shadow if needed
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Container(
        height: kBottomNavigationBarHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2980B9), Color(0xFF2E4053)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: IconButton(
                icon: Icon(
                  _selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () => _onItemTapped(0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: IconButton(
                icon: Icon(
                  _selectedIndex == 1 ? Icons.person : Icons.person_outline,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () => _onItemTapped(1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateTo(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class StudentListPage extends StatefulWidget {
  final String stream;
  final String year;

  const StudentListPage({super.key, required this.stream, required this.year});

  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  final TextEditingController _searchController = TextEditingController();
  late Stream<QuerySnapshot> _studentsStream;

  @override
  void initState() {
    super.initState();
    _studentsStream =
        FirebaseFirestore.instance
            .collection('students')
            .where('stream', isEqualTo: widget.stream)
            .where('year', isEqualTo: widget.year)
            .where('email', isNotEqualTo: '') // Add email validation
            .orderBy('rollNo')
            .snapshots();
  }

  void _showStudentDetails(Student student) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(student.name),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Roll No:', student.rollNo.toString()),
                  _buildDetailRow('Email:', student.email),
                  _buildDetailRow('Stream:', student.stream),
                  _buildDetailRow('Year:', student.year),
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
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.stream} - ${widget.year} Students'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed:
                () => showSearch(
                  context: context,
                  delegate: StudentSearchDelegate(
                    studentsStream: _studentsStream,
                  ),
                ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _studentsStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final students =
              snapshot.data!.docs.map((doc) {
                final data = doc.data() as Map<String, dynamic>;
                return Student(
                  name: data['name'] ?? 'Unknown',
                  rollNo: data['rollNo'] ?? 0,
                  year: data['year'] ?? 'N/A',
                  email: data['email'] ?? '',
                  stream: data['stream'] ?? 'N/A',
                );
              }).toList();

          if (students.isEmpty) {
            return const Center(child: Text('No students found'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    child: Text(
                      student.rollNo.toString(),
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                  title: Text(
                    student.name,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('Roll No: ${student.rollNo}'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showStudentDetails(student),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class StudentSearchDelegate extends SearchDelegate {
  final Stream<QuerySnapshot> studentsStream;

  StudentSearchDelegate({required this.studentsStream});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    return StreamBuilder<QuerySnapshot>(
      stream: studentsStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return const Center(child: CircularProgressIndicator());

        final students =
            snapshot.data!.docs
                .map(
                  (doc) => Student.fromMap(doc.data() as Map<String, dynamic>),
                )
                .where(
                  (student) =>
                      student.name.toLowerCase().contains(query.toLowerCase()),
                )
                .toList();

        return ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            final student = students[index];
            return ListTile(
              title: Text(student.name),
              subtitle: Text('Roll No: ${student.rollNo}'),
              onTap: () {
                close(context, null);
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: Text(student.name),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Roll No: ${student.rollNo}'),
                            Text('Email: ${student.email}'),
                            Text('Stream: ${student.stream}'),
                            Text('Year: ${student.year}'),
                          ],
                        ),
                      ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class TeacherDashboard extends StatefulWidget {
  const TeacherDashboard({super.key});

  @override
  _TeacherDashboardState createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  bool _isDeleting = false;
  Set<String> _selectedEvents = Set<String>();

  void _toggleSelection(String docId) {
    setState(() {
      if (_selectedEvents.contains(docId)) {
        _selectedEvents.remove(docId);
      } else {
        _selectedEvents.add(docId);
      }
    });
  }

  Future<void> _deleteSelectedEvents() async {
    try {
      for (String docId in _selectedEvents) {
        await FirebaseFirestore.instance
            .collection('events')
            .doc(docId)
            .delete();
      }
      setState(() {
        _selectedEvents.clear();
        _isDeleting = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Events deleted successfully')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting events: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('College Events'),
          backgroundColor: const Color.fromARGB(255, 188, 36, 36),
          bottom: const TabBar(
            tabs: [Tab(text: 'Events'), Tab(text: 'Schedule')],
          ),
          actions: [
            IconButton(
              icon: Icon(_isDeleting ? Icons.cancel : Icons.delete),
              onPressed: () {
                setState(() {
                  _isDeleting = !_isDeleting;
                  if (!_isDeleting) _selectedEvents.clear();
                });
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            EventList(
              isDeleting: _isDeleting,
              selectedEvents: _selectedEvents,
              toggleSelection: _toggleSelection,
            ),
            const Schedule(), // Use the refactored Schedule widget
          ],
        ),
        floatingActionButton:
            _isDeleting
                ? FloatingActionButton(
                  onPressed: _deleteSelectedEvents,
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.delete, color: Colors.white),
                )
                : FloatingActionButton(
                  onPressed:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddEventScreen(),
                        ),
                      ),
                  backgroundColor: const Color.fromARGB(255, 212, 13, 13),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
      ),
    );
  }
}

class EventList extends StatelessWidget {
  final bool isDeleting;
  final Set<String> selectedEvents;
  final Function(String) toggleSelection;

  const EventList({
    super.key,
    required this.isDeleting,
    required this.selectedEvents,
    required this.toggleSelection,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  return GestureDetector(
                    onTap: () => isDeleting ? toggleSelection(doc.id) : null,
                    child: EventCard(
                      imageUrl: data['imageUrl'] as String?,
                      title: data['title'] as String?,
                      date: data['date'] as String?,
                      description: data['description'] as String?,
                      link: data['link'] as String?,
                      documentId: doc.id,
                      isSelected: selectedEvents.contains(doc.id),
                      isDeleting: isDeleting,
                    ),
                  );
                }).toList(),
          );
        },
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
  final String documentId;
  final bool isSelected;
  final bool isDeleting;

  const EventCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.description,
    required this.link,
    required this.documentId,
    required this.isSelected,
    required this.isDeleting,
  });

  void _showDescriptionDialog(BuildContext context) {
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
                        onTap: () => _launchURL(context, link!),
                        child: Text(
                          link!,
                          style: TextStyle(
                            color: Colors.blue.shade400,
                            decoration: TextDecoration.underline,
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
  }

  void _launchURL(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (!context.mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Could not launch URL')));
      }
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey[300] : const Color(0x9BC5C6CA),
        borderRadius: BorderRadius.circular(30),
        border: isDeleting ? Border.all(color: Colors.grey, width: 2) : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // In EventCard class - Update the image section
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () {
                      if (!isDeleting) {
                        showDialog(
                          context: context,
                          builder:
                              (context) => Dialog(
                                child: InteractiveViewer(
                                  panEnabled: true,
                                  minScale: 0.5,
                                  maxScale: 4.0,
                                  child: Image.network(
                                    imageUrl ??
                                        'https://via.placeholder.com/400x200',
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                        );
                      }
                    },
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
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        description != null && description!.length > 100
                            ? '${description!.substring(0, 100)}...'
                            : description ?? 'No Description',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () => _showDescriptionDialog(context),
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
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('No link available'),
                              ),
                            );
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
            if (isDeleting)
              Positioned(
                top: 10,
                left: 10,
                child: Checkbox(value: isSelected, onChanged: (value) {}),
              ),
          ],
        ),
      ),
    );
  }
}

// AddEventScreen and AddTeacherScreen remain the same as in previous code

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  File? _imageFile;
  bool _isUploading = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Event')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildImagePicker(),
              const SizedBox(height: 20),
              _buildTitleField(),
              const SizedBox(height: 16),
              _buildDateField(),
              const SizedBox(height: 16),
              _buildDescriptionField(),
              const SizedBox(height: 16),
              _buildLinkField(),
              const SizedBox(height: 24),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleField() {
    return TextFormField(
      controller: _titleController,
      decoration: const InputDecoration(
        labelText: 'Event Title',
        border: OutlineInputBorder(),
      ),
      validator: (value) => value!.isEmpty ? 'Please enter a title' : null,
    );
  }

  Widget _buildDateField() {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: TextFormField(
          controller: _dateController,
          decoration: InputDecoration(
            labelText: 'Event Date',
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () => _selectDate(context),
            ),
          ),
          readOnly: true,
          validator: (value) => value!.isEmpty ? 'Please select a date' : null,
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child:
            _imageFile != null
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(_imageFile!, fit: BoxFit.cover),
                )
                : const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
                    SizedBox(height: 8),
                    Text(
                      'Add Event Image',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
      ),
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      controller: _descriptionController,
      decoration: const InputDecoration(
        labelText: 'Event Description',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      maxLines: 3,
      validator:
          (value) => value!.isEmpty ? 'Please enter a description' : null,
    );
  }

  Widget _buildLinkField() {
    return TextFormField(
      controller: _linkController,
      decoration: const InputDecoration(
        labelText: 'Registration Link (optional)',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      keyboardType: TextInputType.url,
    );
  }

  Widget _buildSubmitButton() {
    return _isUploading
        ? const CircularProgressIndicator()
        : ElevatedButton(
          onPressed: _submitEvent,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Publish Event'),
        );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _imageFile = File(pickedFile.path));
    }
  }

  Future<void> _submitEvent() async {
    if (!_formKey.currentState!.validate()) return;
    if (_imageFile == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select an image')));
      return;
    }

    setState(() => _isUploading = true);

    try {
      final storageRef = FirebaseStorage.instance.ref().child(
        'event_images/${DateTime.now().millisecondsSinceEpoch}',
      );
      await storageRef.putFile(_imageFile!);
      final imageUrl = await storageRef.getDownloadURL();

      await FirebaseFirestore.instance.collection('events').add({
        'imageUrl': imageUrl,
        'title': _titleController.text,
        'date': _dateController.text,
        'description': _descriptionController.text,
        'link': _linkController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error submitting event: ${e.toString()}')),
      );
    } finally {
      setState(() => _isUploading = false);
    }
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<Map<String, dynamic>> _teacherDataFuture;

  @override
  void initState() {
    super.initState();
    _teacherDataFuture = _fetchTeacherData();
  }

  Future<Map<String, dynamic>> _fetchTeacherData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('User not authenticated');

    final doc =
        await FirebaseFirestore.instance
            .collection('teachers')
            .doc(user.uid)
            .get();

    if (!doc.exists) throw Exception('Teacher data not found');
    return doc.data()!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: _teacherDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final teacherData = snapshot.data!;
          final name = teacherData['name'] ?? 'No Name';
          final email = teacherData['email'] ?? 'No Email';
          final createdAt = teacherData['createdAt']; // This is a Timestamp

          // Convert Timestamp to a formatted date string
          String formattedDate = 'N/A';
          if (createdAt != null && createdAt is Timestamp) {
            formattedDate = DateFormat('yyyy-MM-dd').format(createdAt.toDate());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300, width: 3),
                  ),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey.shade100,
                    backgroundImage: AssetImage(
                      'assets/rmc_logo.png',
                    ), // Replace with your actual path
                  ),
                ),

                const SizedBox(height: 40),
                // Teacher Name - Moved Down
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                // Teacher Email - Moved Down
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email, size: 20, color: Colors.grey.shade600),
                    const SizedBox(width: 8),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Additional Info Card
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _buildInfoRow(
                          icon: Icons.calendar_today,
                          label: 'Joined Date',
                          value: formattedDate, // Use the formatted date string
                        ),
                        const Divider(height: 30),
                        _buildInfoRow(
                          icon: Icons.work,
                          label: 'Role',
                          value: teacherData['role'] ?? 'N/A',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue.shade600),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}

class AddAttendancePage extends StatefulWidget {
  const AddAttendancePage({super.key});

  @override
  _AddAttendancePageState createState() => _AddAttendancePageState();
}

class _AddAttendancePageState extends State<AddAttendancePage> {
  List<Student> students = [];
  Map<int, bool> studentStatus = {};
  String _selectedStream = 'Select Stream';
  String _selectedYear = 'Select Degree Year';
  DateTime _selectedDate = DateTime.now();
  String _selectedTime = '7:30 - 8:30 AM';
  bool _showList = false;
  bool _isStreamValid = true;
  bool _isYearValid = true;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _studentListKey = GlobalKey();

  List<String> timeOptions = [
    '7:30 - 8:30 AM',
    '8:30 - 9:30 AM',
    '9:30 - 10:30 AM',
    '11:00 - 12:00 PM',
  ];
  String _selectedSessionType = 'Theory';

  Future<void> _fetchStudents() async {
    if (_selectedStream == 'Select Stream' ||
        _selectedYear == 'Select Degree Year') {
      setState(() {
        _isStreamValid = _selectedStream != 'Select Stream';
        _isYearValid = _selectedYear != 'Select Degree Year';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select Stream and Year first')),
      );
      return;
    }

    try {
      final querySnapshot =
          await FirebaseFirestore.instance
              .collection('students')
              .where('stream', isEqualTo: _selectedStream)
              .where('year', isEqualTo: _selectedYear)
              .where('email', isNotEqualTo: '') // Add email validation
              .orderBy('rollNo') // Add ordering by roll number
              .get();

      setState(() {
        students =
            querySnapshot.docs.map((doc) {
              final data = doc.data();
              return Student(
                name: data['name'],
                rollNo: data['rollNo'],
                year: data['year'],
                stream: data['stream'],
                email: data['email'] ?? '', // Ensure email field exists
              );
            }).toList();

        // Sort students by roll number (ascending)
        students.sort((a, b) => a.rollNo.compareTo(b.rollNo));

        _showList = true;
        studentStatus = {for (var student in students) student.rollNo: true};
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Scrollable.ensureVisible(
          _studentListKey.currentContext!,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          alignment: 0.1,
        );
      });
    } catch (e) {
      print('Error fetching students: $e');
    }
  }

  Future<void> _addStudent(Student student) async {
    try {
      // Create composite key for existence check
      final uniqueKey = '${student.rollNo}_${student.stream}_${student.year}';

      if (students.any(
        (s) => '${s.rollNo}_${s.stream}_${s.year}' == uniqueKey,
      )) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Student already exists in this stream/year')),
        );
        return;
      }

      await FirebaseFirestore.instance.collection('students').add({
        'name': student.name,
        'rollNo': student.rollNo,
        'year': student.year,
        'stream': student.stream,
      });

      _fetchStudents();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Student added successfully!')));
    } catch (e) {
      print('Error adding student: $e');
    }
  }

  void _toggleStatus(int rollNo) {
    setState(() {
      studentStatus[rollNo] = !(studentStatus[rollNo] ?? false);
    });
  }

  Future<void> _markAttendance() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String currentDate = DateFormat('yyyy-MM-dd').format(_selectedDate);
        String currentTime = _selectedTime;

        List<Student> filteredStudentsForAttendance =
            students.where((student) {
              return student.stream == _selectedStream &&
                  student.year == _selectedYear;
            }).toList();

        for (var student in filteredStudentsForAttendance) {
          String docId = '${student.stream}_${student.year}_${student.rollNo}';

          final existingAttendance =
              await FirebaseFirestore.instance
                  .collection('attendance')
                  .doc(docId)
                  .get();

          if (existingAttendance.exists) {
            final attendanceData = existingAttendance.data();
            final attendanceRecords = attendanceData?['attendance'] ?? [];

            bool alreadyMarked = attendanceRecords.any((record) {
              return record['date'] == currentDate &&
                  record['lectures'].any(
                    (lecture) =>
                        lecture['time'] == currentTime &&
                        lecture['type'] == _selectedSessionType,
                  );
            });

            if (alreadyMarked) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Attendance already marked for ${student.name} at $currentTime.',
                  ),
                ),
              );
              continue;
            }

            await FirebaseFirestore.instance
                .collection('attendance')
                .doc(docId)
                .update({
                  'attendance': FieldValue.arrayUnion([
                    {
                      'date': currentDate,
                      'lectures': [
                        {
                          'time': currentTime,
                          'status': studentStatus[student.rollNo] ?? false,
                          'type': _selectedSessionType,
                        },
                      ],
                    },
                  ]),
                });
          } else {
            await FirebaseFirestore.instance
                .collection('attendance')
                .doc(docId)
                .set({
                  'studentName': student.name,
                  'rollNo': student.rollNo,
                  'year': student.year,
                  'stream': student.stream,
                  'attendance': [
                    {
                      'date': currentDate,
                      'lectures': [
                        {
                          'time': currentTime,
                          'status': studentStatus[student.rollNo] ?? false,
                          'type': _selectedSessionType,
                        },
                      ],
                    },
                  ],
                  'userId': user.uid,
                  'timestamp': FieldValue.serverTimestamp(),
                });
          }
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Attendance marked successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please log in to mark attendance.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  List<Student> _filterStudents() {
    if (_selectedStream == 'Select Stream' ||
        _selectedYear == 'Select Degree Year') {
      return [];
    }
    return students.where((student) {
      return student.stream == _selectedStream && student.year == _selectedYear;
    }).toList();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked =
        await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        ) ??
        _selectedDate;

    setState(() {
      _selectedDate = picked;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Attendance Management',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // White title color
          ),
        ),
        centerTitle: true, // Centers the title
        backgroundColor: const Color(0xff9a1b1b),
        elevation: 4, // Adds slight shadow for depth
        shadowColor: const Color.fromARGB(255, 156, 66, 66).withOpacity(0.2),
        iconTheme: const IconThemeData(
          color: Colors.white, // Ensures back arrow is white
        ),
      ),
      floatingActionButton:
          _showList
              ? FloatingActionButton(
                backgroundColor: const Color(0xff9a1b1b),
                onPressed: _markAttendance,
                child: const Icon(Icons.save, color: Colors.white),
              )
              : null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoCard(),
            const SizedBox(height: 20),
            _buildControlsSection(),
            const SizedBox(height: 20),
            if (_showList) _buildStudentListSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoRow('Selected Stream', _selectedStream),
            _buildInfoRow('Selected Year', _selectedYear),
            _buildInfoRow(
              'Date',
              DateFormat('dd MMM yyyy').format(_selectedDate),
            ),
            _buildInfoRow('Time Slot', _selectedTime),
            _buildInfoRow('Session Type', _selectedSessionType),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildControlsSection() {
    return Column(
      children: [
        // Date Picker
        _buildDatePicker(),
        const SizedBox(height: 16),

        // Stream Dropdown
        _buildDropdown(
          'Stream',
          _selectedStream,
          ['Select Stream', 'BSC IT', 'BSC Data Science'],
          (value) => setState(() {
            _selectedStream = value ?? _selectedStream;
            _isStreamValid = true;
            _showList = false;
          }),
          isValid: _isStreamValid,
        ),

        // Year Dropdown
        _buildDropdown(
          'Degree Year',
          _selectedYear,
          ['Select Degree Year', 'FY', 'SY', 'TY'],
          (value) => setState(() {
            _selectedYear = value ?? _selectedYear;
            _isYearValid = true;
            _showList = false;
          }),
          isValid: _isYearValid,
        ),

        // Time Slot Dropdown
        _buildDropdown(
          'Time Slot',
          _selectedTime,
          timeOptions,
          (value) => setState(() => _selectedTime = value ?? _selectedTime),
        ),

        // Session Type Selector
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSessionTypeButton('Theory'),
              _buildSessionTypeButton('Practical'),
            ],
          ),
        ),

        // Attendance List Button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff9a1b1b),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: _fetchStudents,
          child: const Text(
            'Show Attendance List',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildStudentListSection() {
    return Column(
      key: _studentListKey,
      children: [
        const SizedBox(height: 20),
        const Text(
          'Student Attendance List',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...students.map((student) => _buildStudentCard(student)).toList(),
      ],
    );
  }

  Widget _buildSessionTypeButton(String type) {
    final isSelected = _selectedSessionType == type;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? const Color(0xff9a1b1b) : Colors.grey[300],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () => setState(() => _selectedSessionType = type),
      child: Text(
        type,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }

  Widget _buildDatePicker() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      leading: const Icon(Icons.calendar_today),
      title: Text(DateFormat('dd MMMM yyyy').format(_selectedDate)),
      trailing: const Icon(Icons.arrow_drop_down),
      onTap: () => _selectDate(context),
    );
  }

  Widget _buildDropdown(
    String label,
    String value,
    List<String> items,
    ValueChanged<String?> onChanged, {
    bool isValid = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
          errorText:
              isValid
                  ? null
                  : 'Please select a valid option', // Proper error handling
          errorStyle: const TextStyle(color: Colors.red, fontSize: 14),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: isValid ? Colors.grey : Colors.red),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: isValid ? Colors.blue : Colors.red),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value.isNotEmpty ? value : null, // Avoid empty selections
            isExpanded: true, // Ensures proper alignment
            onChanged: onChanged,
            itemHeight: 50, // Optimal spacing
            menuMaxHeight: 250, // Prevents excessive dropdown height
            style: const TextStyle(fontSize: 16, color: Colors.black),
            items:
                items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(item, style: const TextStyle(fontSize: 16)),
                    ),
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildStudentCard(Student student) {
    final isPresent = studentStatus[student.rollNo] ?? false;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Text(
            student.rollNo.toString(),
            style: TextStyle(
              color: Colors.blue.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          student.name,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text('${student.stream} - ${student.year}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildStatusButton('P', isPresent, Colors.green),
            const SizedBox(width: 8),
            _buildStatusButton('A', !isPresent, Colors.red),
          ],
        ),
        onTap: () => _toggleStatus(student.rollNo),
      ),
    );
  }

  Widget _buildStatusButton(String label, bool isActive, Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isActive ? color : color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isActive ? color : Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
