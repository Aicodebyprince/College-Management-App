import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:princeproject/admindashboard.dart';
import 'package:princeproject/landing_page.dart';
import 'package:princeproject/studentdashboard.dart';
import 'package:princeproject/teacherpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:princeproject/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(), // Set SplashScreen as the home
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    if (!mounted) return;

    final prefs = await SharedPreferences.getInstance();
    final String? userType = prefs.getString('userType');
    final String? lastLogin = prefs.getString('lastLogin');
    final String? studentId = prefs.getString('studentId'); // Get student ID

    if (userType != null && lastLogin != null) {
      final lastLoginDate = DateTime.parse(lastLogin);
      final difference = DateTime.now().difference(lastLoginDate).inDays;

      if (difference <= 5) {
        _redirectToDashboard(userType, context, studentId); // Pass studentId
        return;
      } else {
        await prefs.remove('userType');
        await prefs.remove('lastLogin');
        await prefs.remove('studentId'); // Clear student ID
      }
    }

    _redirectToLogin(context);
  }

  void _redirectToDashboard(
    String userType,
    BuildContext context,
    String? studentId,
  ) {
    Widget targetScreen;

    switch (userType.toLowerCase()) {
      case 'admin':
        targetScreen = MyApp();
        break;
      case 'teacher':
        targetScreen = HomePage();
        break;
      case 'student':
        targetScreen = StudentDashboard(
          streamYearRollNo: studentId ?? 'default_id', // Use actual student ID
        );
        break;
      default:
        targetScreen = StudentDashboard(streamYearRollNo: "unknown");
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => targetScreen),
    );
  }

  void _redirectToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LandingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/splashvideo.gif',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}

// Updated Dashboard Classes with Navigation
class StudentDashboard1 extends StatelessWidget {
  get streamYearRollNo => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome Student!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => StudentDashboard(
                            streamYearRollNo: streamYearRollNo,
                          ),
                    ),
                  ),
              child: Text('Home page'),
            ),
          ],
        ),
      ),
    );
  }
}

class TeacherDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Teacher Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome Teacher!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  ),
              child: Text('Hello Teacher'),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome Admin!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  ),
              child: Text('Hello Teacher'),
            ),
          ],
        ),
      ),
    );
  }
}
