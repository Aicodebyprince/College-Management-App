import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:princeproject/forget_pass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'admindashboard.dart';
import 'teacherpage.dart';
import 'studentdashboard.dart';

class FFButtonOptions {
  final double width;
  final double height;
  final Color color;
  final TextStyle textStyle;
  final BorderRadius borderRadius;

  FFButtonOptions({
    required this.width,
    required this.height,
    required this.color,
    required this.textStyle,
    required this.borderRadius,
  });
}

class FFButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final FFButtonOptions options;

  const FFButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: options.width, // Force the specified width
      height: options.height, // Force the specified height
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: options.color,
          padding: EdgeInsets.zero, // Remove internal padding
          textStyle: options.textStyle,
          shape: RoundedRectangleBorder(borderRadius: options.borderRadius),
        ),
        child: Text(text),
      ),
    );
  }
}

class FlutterFlowDropDown<T> extends StatefulWidget {
  final T? value;
  final List<T> options;
  final ValueChanged<T?> onChanged;
  final double width;
  final double height;
  final TextStyle textStyle;
  final String hintText;
  final Icon icon;
  final Color fillColor;
  final int elevation;
  final Color borderColor;
  final double borderRadius;

  const FlutterFlowDropDown({
    super.key,
    this.value,
    required this.options,
    required this.onChanged,
    required this.width,
    required this.height,
    required this.textStyle,
    required this.hintText,
    required this.icon,
    required this.fillColor,
    required this.elevation,
    required this.borderColor,
    required this.borderRadius,
  });

  @override
  // ignore: library_private_types_in_public_api
  _FlutterFlowDropDownState<T> createState() => _FlutterFlowDropDownState<T>();
}

class _FlutterFlowDropDownState<T> extends State<FlutterFlowDropDown<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.fillColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(color: widget.borderColor),
      ),
      child: DropdownButtonFormField<T>(
        value: widget.value,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: widget.textStyle,
          prefixIcon: widget.icon,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
        ),
        items:
            widget.options.map((T option) {
              return DropdownMenuItem<T>(
                value: option,
                child: Text(option.toString(), style: widget.textStyle),
              );
            }).toList(),
        onChanged: widget.onChanged,
      ),
    );
  }
}

class FlutterFlowTheme {
  // ignore: library_private_types_in_public_api
  static _FlutterFlowTheme of(BuildContext context) => _FlutterFlowTheme();
}

class _FlutterFlowTheme {
  final Color primary = Colors.blue;
  final Color primaryBackground = Colors.white;
  final Color primaryText = Colors.black;

  TextStyle get bodyMedium => const TextStyle(fontSize: 16);
  TextStyle get bodyLarge => const TextStyle(fontSize: 18);
  TextStyle get labelMedium =>
      const TextStyle(fontSize: 14, color: Colors.grey);
  TextStyle get titleSmall =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rollNoController = TextEditingController();

  bool _passwordVisibility = false;
  String? _selectedRole = 'Student';
  String? _selectedStream = 'BSC Data Science';
  String? _selectedYear = 'FY';

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  Future<void> _registerAdmin() async {
    try {
      final email = _emailController.text;
      final password = _passwordController.text;

      final adminDoc =
          await FirebaseFirestore.instance
              .collection('admin')
              .doc('uniqueAdmin')
              .get();

      if (adminDoc.exists) {
        _showErrorDialog('Admin already registered.');
        return;
      }

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseFirestore.instance
          .collection('admin')
          .doc('uniqueAdmin')
          .set({'email': email, 'uid': userCredential.user!.uid});

      // Show success dialog
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Success'),
              content: const Text('Admin registered successfully.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    } catch (e) {
      String errorMessage = 'Failed to register admin.';
      if (e is FirebaseAuthException) {
        errorMessage = e.message ?? errorMessage;
      }
      _showErrorDialog(errorMessage);
    }
  }

  Future<void> _handleSuccessfulLogin(String userType) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userType', userType);
    await prefs.setString('lastLogin', DateTime.now().toString());
  }

  Future<void> _login() async {
    final emailInput = _emailController.text;
    final password = _passwordController.text;

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailInput, password: password);

      final user = userCredential.user!;
      final email = user.email!;

      // Admin check
      if (_selectedRole == 'Admin') {
        final adminDocs =
            await FirebaseFirestore.instance
                .collection('admin')
                .where('email', isEqualTo: email)
                .get();

        if (adminDocs.docs.isNotEmpty) {
          await _handleSuccessfulLogin('admin');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AdminDashboard()),
          );
          return;
        }
      }

      // Teacher check
      if (_selectedRole == 'Teacher') {
        final teacherDocs =
            await FirebaseFirestore.instance
                .collection('teachers')
                .where('email', isEqualTo: email)
                .get();

        if (teacherDocs.docs.isNotEmpty) {
          await _handleSuccessfulLogin('teacher');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
          return;
        }
      }

      // Student check
      if (_selectedRole == 'Student') {
        try {
          final studentDoc =
              await FirebaseFirestore.instance
                  .collection('students')
                  .doc(user.uid)
                  .get();

          if (studentDoc.exists) {
            final studentData = studentDoc.data()!;
            final inputRollNo = int.tryParse(_rollNoController.text) ?? -1;

            if (studentData['email'] == email &&
                studentData['stream'] == _selectedStream &&
                studentData['year'] == _selectedYear &&
                studentData['rollNo'] == inputRollNo) {
              final prefs = await SharedPreferences.getInstance();
              final streamYearRollNo =
                  '${_selectedStream}_${_selectedYear}_${_rollNoController.text}';
              await prefs.setString('studentId', streamYearRollNo);

              await _handleSuccessfulLogin('student');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          StudentDashboard(streamYearRollNo: streamYearRollNo),
                ),
              );
              return;
            } else {
              _showErrorDialog('Student data does not match our records.');
            }
          } else {
            _showErrorDialog('Student record not found.');
          }
        } catch (e) {
          String errorMessage = 'Student login error.';
          if (e is FirebaseException) {
            errorMessage = e.message ?? errorMessage;
          }
          _showErrorDialog(errorMessage);
        }
        return;
      }

      _showErrorDialog('Invalid credentials for selected role.');
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Login failed.';
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email format.';
          break;
        default:
          errorMessage = e.message ?? errorMessage;
      }
      _showErrorDialog(errorMessage);
    } catch (e) {
      _showErrorDialog('An unexpected error occurred. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                      10,
                      10,
                      10,
                      10,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/rmc_logo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              0,
                              10,
                              0,
                              0,
                            ),
                            child: Text(
                              'Welcome Back',
                              style: FlutterFlowTheme.of(
                                context,
                              ).bodyMedium.copyWith(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              0,
                              10,
                              0,
                              0,
                            ),
                            child: Text(
                              'Please Enter Your Login details',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              0,
                              20,
                              0,
                              0,
                            ),
                            child: Icon(Icons.person_sharp, size: 35),
                          ),
                          Text(
                            'LOGIN',
                            style: FlutterFlowTheme.of(
                              context,
                            ).bodyMedium.copyWith(
                              fontSize: 20,
                              letterSpacing: 3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              20,
                              15,
                              20,
                              0,
                            ),
                            child: FlutterFlowDropDown<String>(
                              value: _selectedRole,
                              options: const ['Admin', 'Teacher', 'Student'],
                              onChanged:
                                  (val) => setState(() => _selectedRole = val),
                              width:
                                  double
                                      .infinity, // Make full width to match the second dropdown
                              height:
                                  50, // Match height with the second dropdown (50)
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Role',
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                              ),
                              fillColor:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).primaryBackground,
                              elevation: 2,
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: 8,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              20,
                              15,
                              20,
                              0,
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).primaryText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                suffixIcon: const Icon(Icons.email_sharp),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              20,
                              15,
                              20,
                              0,
                            ),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: !_passwordVisibility,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).primaryText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                suffixIcon: InkWell(
                                  onTap:
                                      () => setState(
                                        () =>
                                            _passwordVisibility =
                                                !_passwordVisibility,
                                      ),
                                  child: Icon(
                                    _passwordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (_selectedRole == 'Student') ...[
                            Container(
                              width: double.infinity, // Ensures full width
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ), // Added padding
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start, // Align to start
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: FlutterFlowDropDown<String>(
                                      value: _selectedStream,
                                      options: const [
                                        'BSC Data Science',
                                        'BSC IT',
                                      ],
                                      onChanged:
                                          (val) => setState(
                                            () => _selectedStream = val,
                                          ),
                                      width: double.infinity, // Make full width
                                      height: 50,
                                      textStyle:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium,
                                      hintText: 'Select Stream',
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                      ),
                                      fillColor:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).primaryBackground,
                                      elevation: 2,
                                      borderColor:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).primaryText,
                                      borderRadius: 8,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: FlutterFlowDropDown<String>(
                                      value: _selectedYear,
                                      options: const ['FY', 'SY', 'TY'],
                                      onChanged:
                                          (val) => setState(
                                            () => _selectedYear = val,
                                          ),
                                      width: double.infinity, // Make full width
                                      height: 50,
                                      textStyle:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium,
                                      hintText: 'Select Year',
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                      ),
                                      fillColor:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).primaryBackground,
                                      elevation: 2,
                                      borderColor:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).primaryText,
                                      borderRadius: 8,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: TextFormField(
                                      controller: _rollNoController,
                                      decoration: InputDecoration(
                                        labelText: 'Roll No',
                                        labelStyle:
                                            FlutterFlowTheme.of(
                                              context,
                                            ).bodyMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).primaryText,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).primary,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              180,
                              8,
                              0,
                              0,
                            ),
                            child: InkWell(
                              onTap:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const ForgotPasswordPage(),
                                    ),
                                  ),
                              child: const Text(
                                'Forgot Password ?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          // Login Button
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              0,
                              14,
                              0,
                              0,
                            ),
                            child: FFButtonWidget(
                              onPressed: _login,
                              text: 'LOGIN',
                              options: FFButtonOptions(
                                width:
                                    MediaQuery.of(context).size.width -
                                    60, // Dynamic width
                                height: 40,
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(
                                  context,
                                ).titleSmall.copyWith(
                                  color: Colors.white,
                                  letterSpacing: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),

                          // Register Button (for Admin)
                          if (_selectedRole == 'Admin')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                0,
                                14,
                                0,
                                0,
                              ),
                              child: FFButtonWidget(
                                onPressed: _registerAdmin,
                                text: 'REGISTER',
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.of(context).size.width -
                                      60, // Dynamic width
                                  height: 40,
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(
                                    context,
                                  ).titleSmall.copyWith(
                                    color: Colors.white,
                                    letterSpacing: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
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
