import 'package:flutter/material.dart';
import 'package:princeproject/academic_calendar.dart';
import 'package:princeproject/landing_page.dart';
import 'package:princeproject/student.dart';
import 'loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'College Events',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color.fromARGB(255, 241, 241, 241),
      ),
      home: const AdminDashboard(),
    );
  }
}

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Events deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting events: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            _isDeleting ? "Select Events" : "College Events",
            key: ValueKey<bool>(_isDeleting),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFB71C1C), Color(0xFFD32F2F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.3),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child:
                _isDeleting
                    ? Row(
                      key: const ValueKey<bool>(true),
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.white),
                          onPressed: _deleteSelectedEvents,
                        ),
                        IconButton(
                          icon: const Icon(Icons.cancel, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              _isDeleting = false;
                              _selectedEvents.clear();
                            });
                          },
                        ),
                      ],
                    )
                    : const SizedBox(),
          ),
        ],
      ),

      drawer: _buildDrawer(context),
      floatingActionButton:
          _isDeleting
              ? null
              : FloatingActionButton(
                onPressed: () => _navigateToAddEvent(context),
                backgroundColor: const Color.fromARGB(255, 212, 13, 13),
                child: const Icon(Icons.add, color: Colors.white),
              ),
      body: EventList(
        isDeleting: _isDeleting,
        selectedEvents: _selectedEvents,
        toggleSelection: _toggleSelection,
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
                  child: const Text(
                    'A',
                    style: TextStyle(fontSize: 28, color: Color(0xFF2E4053)),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Admin Account',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          ExpansionTile(
            leading: const Icon(Icons.computer, color: Color(0xFF2E4053)),
            title: const Text(
              'BSC IT',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFF2E4053),
              ),
            ),
            children:
                ['FY', 'SY', 'TY'].map((year) {
                  return ListTile(
                    leading: const Icon(Icons.school_outlined),
                    title: Text(year),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  StudentListPage(stream: 'BSC IT', year: year),
                        ),
                      );
                    },
                  );
                }).toList(),
          ),
          ExpansionTile(
            leading: const Icon(Icons.data_usage, color: Color(0xFF2E4053)),
            title: const Text(
              'BSC Data Science',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFF2E4053),
              ),
            ),
            children:
                ['FY', 'SY', 'TY'].map((year) {
                  return ListTile(
                    leading: const Icon(Icons.school_outlined),
                    title: Text(year),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => StudentListPage(
                                stream: 'BSC Data Science',
                                year: year,
                              ),
                        ),
                      );
                    },
                  );
                }).toList(),
          ),
          const Divider(thickness: 1),
          _buildListTile(
            icon: Icons.person_add,
            title: 'Add Teacher',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddTeacherScreen(),
                ),
              );
            },
          ),
          _buildListTile(
            icon: Icons.event,
            title: 'Academic Calendar',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AcademicCalendar()),
              );
            },
          ),
          _buildListTile(
            icon: Icons.event,
            title: 'Events',
            onTap: () => Navigator.pop(context),
          ),
          _buildListTile(
            icon: Icons.delete,
            title: 'Delete Events',
            onTap: () {
              setState(() {
                _isDeleting = true;
              });
              Navigator.pop(context);
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
                MaterialPageRoute(builder: (context) => LandingPage()),
              );
            },
          ),
        ],
      ),
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

  void _navigateToAddEvent(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddEventScreen()),
    );
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

// Rest of the code remains the same (EventList, EventCard, AddEventScreen, AddTeacherScreen)

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
      // Show error dialog instead of SnackBar
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Error'),
              content: const Text('Please select an image'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
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

      // Show success dialog before navigating back
      if (!mounted) return;
      await showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Success'),
              content: const Text('Event added successfully!'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
      Navigator.pop(context);
    } catch (e) {
      // Show error dialog instead of SnackBar
      if (!mounted) return;
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Error'),
              content: Text('Error submitting event: ${e.toString()}'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    } finally {
      setState(() => _isUploading = false);
    }
  }
}

// AddTeacherScreen remains the same as in previous code

class AddTeacherScreen extends StatefulWidget {
  const AddTeacherScreen({super.key});

  @override
  _AddTeacherScreenState createState() => _AddTeacherScreenState();
}

class _AddTeacherScreenState extends State<AddTeacherScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final List<Map<String, String>> _teachers = [];
  bool _isAdding = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _fetchTeachers();
  }

  Future<void> _fetchTeachers() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('teachers').get();

      setState(() {
        _teachers.clear();
        for (var doc in querySnapshot.docs) {
          final data = doc.data() as Map<String, dynamic>;
          _teachers.add({
            'email': data['email']?.toString() ?? 'No Email',
            'name': data['name']?.toString() ?? 'Unnamed Teacher',
            'uid': doc.id,
          });
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to fetch teachers: ${e.toString()}")),
      );
    }
  }

  Future<void> _addTeacher() async {
    if (!_formKey.currentState!.validate()) return;

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final name = _nameController.text.trim();

    setState(() => _isAdding = true);

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseFirestore.instance
          .collection('teachers')
          .doc(userCredential.user!.uid)
          .set({
            'email': email,
            'name': name,
            'role': 'teacher',
            'createdAt': FieldValue.serverTimestamp(),
          });

      setState(() {
        _teachers.add({
          'email': email,
          'name': name,
          'uid': userCredential.user!.uid,
        });
      });

      _clearForm();

      // Show success dialog
      if (!mounted) return;
      await showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Success'),
              content: const Text('Teacher added successfully!'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    } catch (e) {
      // Show error dialog
      if (!mounted) return;
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Error'),
              content: Text('Failed to add teacher: ${e.toString()}'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    } finally {
      setState(() => _isAdding = false);
    }
  }

  Future<void> _deleteTeacher(String uid, int index) async {
    bool confirm = await showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirm Delete'),
            content: Text('Remove ${_teachers[index]['name']} from teachers?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );

    if (confirm) {
      try {
        // Delete from Firestore
        await FirebaseFirestore.instance
            .collection('teachers')
            .doc(uid)
            .delete();

        // Remove from local list
        setState(() {
          _teachers.removeAt(index);
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Teacher deleted successfully!")),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to delete teacher: ${e.toString()}")),
        );
      }
    }
  }

  void _clearForm() {
    _emailController.clear();
    _passwordController.clear();
    _nameController.clear();
  }

  void _showSuccess() {
    // Changed from _showSuccessAnimation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Teacher added successfully!"),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage Teachers',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          prefixIcon: const Icon(Icons.person_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                        ),
                        validator:
                            (value) =>
                                value!.isEmpty
                                    ? 'Please enter teacher name'
                                    : null,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator:
                            (value) =>
                                !value!.contains('@')
                                    ? 'Enter a valid email'
                                    : null,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                        ),
                        obscureText: true,
                        validator:
                            (value) =>
                                value!.length < 6
                                    ? 'Minimum 6 characters'
                                    : null,
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _isAdding ? null : _addTeacher,

                          label:
                              _isAdding
                                  ? CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  )
                                  : const Text(
                                    'ADD TEACHER',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white, // White text
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 3,
                            shadowColor: Colors.purple[100],
                            backgroundColor: Colors.purple, // Purple background
                            foregroundColor:
                                Colors.white, // White icon and text
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child:
                  _teachers.isEmpty
                      ? Center(
                        child: Text(
                          'No Teachers Added Yet',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                      : ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _teachers.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final teacher = _teachers[index];
                          return Dismissible(
                            key: Key(teacher['uid']!),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20),
                              color: Colors.redAccent,
                              child: const Icon(
                                Icons.delete_forever,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            onDismissed:
                                (_) => _deleteTeacher(teacher['uid']!, index),
                            child: TeacherCard(
                              name: teacher['name']!,
                              email: teacher['email']!,
                              onDelete:
                                  () => _deleteTeacher(teacher['uid']!, index),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeacherCard extends StatelessWidget {
  final String name;
  final String email;
  final VoidCallback onDelete;

  const TeacherCard({
    required this.name,
    required this.email,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.blue[50],
          child: Icon(Icons.person, color: Theme.of(context).primaryColor),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(email, style: TextStyle(color: Colors.grey[600])),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
