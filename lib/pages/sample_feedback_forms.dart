// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/button.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/small_container.dart';
import 'package:princeproject/components/small_text.dart';

class SampleFeedbackForms extends StatelessWidget {
  const SampleFeedbackForms({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appBar: const MyAppBar(),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: 180,
                  width: screenWidth * 0.95,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/feedback/sample.png',
                      ), // replace with your image path
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 1095,
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Sample Feedback Forms',
                        fontSize: 28,
                        underlineHeight: 4,
                        underlineTop: 35,
                        underlineWidth: 330,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: SmallText(
                        text:
                            'The Sample Feedback Forms page provides frequently asked questions for students, teachers, alumni, and employers. It includes five forms for each group to gather feedback for improving academic quality, teaching, facilities, and overall experiences, promoting continuous enhancement within the institution.',
                        textSize: 14,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SmallContainer(
                      height: 205,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 15),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: SmallText(
                                text: 'Student’s Sample Feedback',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2023/03/Student-Feedback-Form-1.pdf',
                                  text: 'Form - 1',
                                  fontSize: 16,
                                  buttonWidth: double.nan,
                                ),
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2023/03/Student-Feedback-Form-2.pdf',
                                  text: 'Form - 2',
                                  fontSize: 16,
                                  buttonWidth: double.nan,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2023/03/Student-Feedback-Form-3.pdf',
                                  text: 'Form - 3',
                                  fontSize: 16,
                                  buttonWidth: double.nan,
                                ),
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2023/03/Student-Feedback-Form-4.pdf',
                                  text: 'Form - 4',
                                  fontSize: 16,
                                  buttonWidth: double.nan,
                                ),
                              ],
                            ),
                            Button(
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2023/03/Student-Feedback-Form-5.pdf',
                              text: 'Form - 5',
                              fontSize: 16,
                              buttonWidth: double.nan,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SmallContainer(
                      height: 205,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 15),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: SmallText(
                                text: 'Teacher’s Sample Feedback',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2023/03/1-Faculty-feedback.pdf',
                                  text: 'Form - 1',
                                  fontSize: 16,
                                  buttonWidth: double.nan,
                                ),
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2023/03/2-Faculty-feedback.pdf',
                                  text: 'Form - 2',
                                  fontSize: 16,
                                  buttonWidth: double.nan,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2023/03/3-Faculty-feedback.pdf',
                                  text: 'Form - 3',
                                  fontSize: 16,
                                  buttonWidth: double.nan,
                                ),
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2023/03/4-Faculty-feedback.pdf',
                                  text: 'Form - 4',
                                  fontSize: 16,
                                  buttonWidth: double.nan,
                                ),
                              ],
                            ),
                            Button(
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2023/03/5-Faculty-feedback.pdf',
                              text: 'Form - 5',
                              fontSize: 16,
                              buttonWidth: double.nan,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SmallContainer(
                      height: 205,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 15),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: SmallText(
                                text: 'Alumni’s Sample Feedback',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2023/03/1_Alumni.pdf',
                                  text: 'Form - 1',
                                  fontSize: 16,
                                  buttonWidth: double.nan,
                                ),
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2023/03/2_Alumni.pdf',
                                  text: 'Form - 2',
                                  fontSize: 16,
                                  buttonWidth: double.nan,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2023/03/3_Alumni.pdf',
                                  text: 'Form - 3',
                                  fontSize: 16,
                                  buttonWidth: double.nan,
                                ),
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2023/03/4_Alumni.pdf',
                                  text: 'Form - 4',
                                  fontSize: 16,
                                  buttonWidth: double.nan,
                                ),
                              ],
                            ),
                            Button(
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2023/03/5_Alumni.pdf',
                              text: 'Form - 5',
                              fontSize: 16,
                              buttonWidth: double.nan,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SmallContainer(
                      height: 205,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 15),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: SmallText(
                                text: 'Employer’s Sample Feedback',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2023/03/1-MK-Group_Employer-feedback.pdf',
                                  text: 'Form - 1',
                                  fontSize: 16,
                                  buttonWidth: double.nan,
                                ),
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2023/03/2-Origin-HR_Employer-feedback.pdf',
                                  text: 'Form - 2',
                                  fontSize: 16,
                                  buttonWidth: double.nan,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2023/03/3-Sarvajan-Kalyan-Trust_Employer-feedback.pdf',
                                  text: 'Form - 3',
                                  fontSize: 16,
                                  buttonWidth: double.nan,
                                ),
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2023/03/4-Speakwell-Skills-Academy_Employer-feedback.pdf',
                                  text: 'Form - 4',
                                  fontSize: 16,
                                  buttonWidth: double.nan,
                                ),
                              ],
                            ),
                            Button(
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2023/03/5-Sutherland_Employer-feedback.pdf',
                              text: 'Form - 5',
                              fontSize: 16,
                              buttonWidth: double.nan,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 15.0)),
            ],
          ),
        ),
      ),
    );
  }
}
