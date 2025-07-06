// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/button.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/small_container.dart';
import 'package:princeproject/components/small_text.dart';
import 'package:princeproject/pages/sample_feedback_forms.dart';
import 'package:princeproject/pages/student_satisfaction_survey.dart';

class FeedbackForms extends StatelessWidget {
  const FeedbackForms({super.key});

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
                  height: 225,
                  width: screenWidth * 0.95,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/feedback/time_for_feedback.png',
                      ), // replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 1025,
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/feedback/feedback.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: SmallText(
                        text:
                            'This Feedback page provides various feedback forms for teachers, students, alumni, and employees. It includes a student satisfaction survey with downloadable PDF reports and analysis. Users can access the feedback forms by logging in, after which they can fill out the respective surveys. Additionally, there are sample feedback forms available in PDF format to guide users on the layout and types of questions asked in each form.',
                        textSize: 14,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SmallContainer(
                      height: 110,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 20),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: SmallText(
                                text: 'Student Feedback',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Button(
                              url:
                                  'http://rmc.edu.in/college-feedback-system/student/',
                              text: 'Start Student Survey',
                              fontSize: 20,
                              buttonWidth: double.nan,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SmallContainer(
                      height: 110,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: SmallText(
                                text: 'Teacher Feedback',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Button(
                              url:
                                  'http://rmc.edu.in/college-feedback-system/teacher/',
                              text: 'Provide Teacher Feedback',
                              fontSize: 20,
                              buttonWidth: double.nan,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SmallContainer(
                      height: 110,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: SmallText(
                                text: 'Employee Feedback',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Button(
                              url:
                                  'http://rmc.edu.in/college-feedback-system/employer/',
                              text: 'Share Your Experience',
                              fontSize: 20,
                              buttonWidth: double.nan,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SmallContainer(
                      height: 110,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: SmallText(
                                text: 'Alumni Feedback',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Button(
                              url:
                                  'http://rmc.edu.in/college-feedback-system/alumni/',
                              text: 'Contribute Alumni Insights',
                              fontSize: 20,
                              buttonWidth: double.nan,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SmallContainer(
                      height: 110,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Center(
                              child: SmallText(
                                text: 'Student Satisfaction Survey',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Button(
                              onPressed:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const StudentSatisfactionSurvey(),
                                    ),
                                  ),
                              text: 'View Satisfaction Reports',
                              fontSize: 20,
                              buttonWidth: double.nan,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SmallContainer(
                      height: 110,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Center(
                              child: SmallText(
                                text: 'Sample Feedback Forms',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Button(
                              onPressed:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const SampleFeedbackForms(),
                                    ),
                                  ),
                              text: 'Explore Sample Forms',
                              fontSize: 20,
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
