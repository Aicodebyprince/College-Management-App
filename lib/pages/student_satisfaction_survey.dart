// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/button.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/small_container.dart';
import 'package:princeproject/components/small_text.dart';

class StudentSatisfactionSurvey extends StatelessWidget {
  const StudentSatisfactionSurvey({super.key});

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
                        'assets/feedback/student_satisfaction_survey.png',
                      ), // replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 1035,
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Student Satisfaction Survey',
                        fontSize: 28,
                        underlineHeight: 4,
                        underlineTop: 35,
                        underlineWidth: 270,
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
                            'The student satisfaction survey includes both the latest and previous survey reports, offering valuable insights and analysis. These reports help track trends over time and provide a comprehensive overview of student feedback and satisfaction levels.',
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
                                text: 'Our Latest Survey Reports',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2022/09/SSS_2021-22.pdf',
                                  text: 'Analysis',
                                  fontSize: 20,
                                  buttonWidth: double.nan,
                                ),
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2022/09/Feedback_ATR-2021-22.pdf',
                                  text: 'ATR',
                                  fontSize: 20,
                                  buttonWidth: double.nan,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Old Survey Reports',
                        fontSize: 28,
                        underlineHeight: 4,
                        underlineTop: 35,
                        underlineWidth: 270,
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
                                text: 'Student Satisfaction Survey 2021-2022',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2022/09/SSS_2021-22.pdf',
                                  text: 'Analysis',
                                  fontSize: 20,
                                  buttonWidth: double.nan,
                                ),
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2022/09/Feedback_ATR-2021-22.pdf',
                                  text: 'ATR',
                                  fontSize: 20,
                                  buttonWidth: double.nan,
                                ),
                              ],
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
                                text: 'Student Satisfaction Survey 2020-2021',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2022/03/SSS_feedback.pdf',
                                  text: 'Analysis',
                                  fontSize: 20,
                                  buttonWidth: double.nan,
                                ),
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2022/09/Feedback_ATR-2020-21.pdf',
                                  text: 'ATR',
                                  fontSize: 20,
                                  buttonWidth: double.nan,
                                ),
                              ],
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
                                text: 'Student Satisfaction Survey 2019-2020',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2022/08/student_infrastructure_feedback-2019-20.pdf',
                                  text: 'Analysis',
                                  fontSize: 20,
                                  buttonWidth: double.nan,
                                ),
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2022/09/Feedback_ATR-2019-20.pdf',
                                  text: 'ATR',
                                  fontSize: 20,
                                  buttonWidth: double.nan,
                                ),
                              ],
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
                                text: 'Student Satisfaction Survey 2018-2019',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2022/08/student_infrastructure_feedback-2018-19.pdf',
                                  text: 'Analysis',
                                  fontSize: 20,
                                  buttonWidth: double.nan,
                                ),
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2022/09/Feedback_ATR-2018-19.pdf',
                                  text: 'ATR',
                                  fontSize: 20,
                                  buttonWidth: double.nan,
                                ),
                              ],
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
                                text: 'Student Satisfaction Survey 2017-2018',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2022/08/student_infrastructure_feedback-2017-18.pdf',
                                  text: 'Analysis',
                                  fontSize: 20,
                                  buttonWidth: double.nan,
                                ),
                                Button(
                                  url:
                                      'https://rmc.edu.in/wp-content/uploads/2022/09/Feedback_ATR-2017-18.pdf',
                                  text: 'ATR',
                                  fontSize: 20,
                                  buttonWidth: double.nan,
                                ),
                              ],
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
