// ignore_for_file: unused_local_variable, use_full_hex_values_for_flutter_colors
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/button.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/small_container.dart';
import 'package:princeproject/components/small_text.dart';
import 'package:princeproject/pages/abc.dart';
import 'package:princeproject/pages/examination_scheme.dart';
import 'package:princeproject/pages/placement.dart';
import 'package:flutter/material.dart';

class StudentsCorner extends StatelessWidget {
  const StudentsCorner({super.key});

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
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Container(
                height: 225,
                width: screenWidth * 0.95,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/students_corner/students_corner.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              BigContainer(
                height: screenHeight * 2.3,
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Explore The Student’s Corner',
                        fontSize: 28,
                        underlineTop: 38,
                        underlineHeight: 4,
                        underlineWidth: screenWidth * 0.76,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      child: SmallText(
                        text:
                            'The Student’s Corner is a dedicated section designed to cater to the academic, administrative, and career needs of students. This hub provides easy access to essential resources such as examination details, schedules, grievance redressal, placement opportunities, and academic credit information.',
                        textSize: 13,
                        textAlign: TextAlign.left,
                        textColor: Colors.black,
                      ),
                    ),
                    SmallContainer(
                      height: screenHeight * 0.3,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                const SmallText(
                                  text: 'Examination Scheme',
                                  textSize: 24,
                                  textColor: Colors.black,
                                  textDecoration: TextDecoration.none,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: screenHeight * 0.13,
                                      width: screenWidth * 0.42,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/students_corner/examination_scheme.png',
                                          ), // replace with your image path
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.42,
                                      child: const SmallText(
                                        text:
                                            'Get detailed insights into exam patterns, schedules, and guidelines.',
                                        textSize: 15,
                                        textAlign: TextAlign.center,
                                        textColor: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Button(
                              onPressed:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const ExaminationScheme(),
                                    ),
                                  ),
                              text: 'View Details',
                              fontSize: 18,
                              textColor: const Color(0xFFD9D9D9),
                              borderRadius: 10,
                              buttonWidth: double.nan,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: screenHeight * 0.31,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                const SmallText(
                                  text: 'Prospectus',
                                  textSize: 24,
                                  textColor: Colors.black,
                                  textDecoration: TextDecoration.none,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: screenHeight * 0.13,
                                      width: screenWidth * 0.42,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/students_corner/prospectus.png',
                                          ), // replace with your image path
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.42,
                                      child: const SmallText(
                                        text:
                                            'Explore courses, facilities, and policies in the 2023-2024 prospectus.',
                                        textSize: 15,
                                        textAlign: TextAlign.center,
                                        textColor: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Button(
                              url:
                                  'http://rmc.edu.in/wp-content/uploads/2023/06/RMC-Prospectus_New_compressed.pdf',
                              text: 'View Prospectus',
                              fontSize: 18,
                              textColor: Color(0xFFD9D9D9),
                              borderRadius: 10,
                              buttonWidth: double.nan,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: screenHeight * 0.3,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                const SmallText(
                                  text: 'Student’s Grievances',
                                  textSize: 24,
                                  textColor: Colors.black,
                                  textDecoration: TextDecoration.none,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: screenHeight * 0.13,
                                      width: screenWidth * 0.42,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/students_corner/students_grievances.png',
                                          ), // replace with your image path
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.42,
                                      child: const SmallText(
                                        text:
                                            'Raise concerns and resolve issues for a better learning experience.',
                                        textSize: 15,
                                        textAlign: TextAlign.center,
                                        textColor: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Button(
                              url:
                                  'http://rmc.edu.in/wp-content/uploads/2019/08/Circular-for-CGRC-grievances.pdf',
                              text: 'View Document',
                              fontSize: 18,
                              textColor: Color(0xFFD9D9D9),
                              borderRadius: 10,
                              buttonWidth: double.nan,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: screenHeight * 0.3,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                const SmallText(
                                  text: 'Time-Table',
                                  textSize: 24,
                                  textColor: Colors.black,
                                  textDecoration: TextDecoration.none,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: screenHeight * 0.13,
                                      width: screenWidth * 0.42,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/students_corner/time_table.png',
                                          ), // replace with your image path
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.42,
                                      child: const SmallText(
                                        text:
                                            'Stay updated with your latest class schedule and timings.',
                                        textSize: 15,
                                        textAlign: TextAlign.center,
                                        textColor: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Button(
                              url:
                                  'http://rmc.edu.in/wp-content/uploads/2019/08/Circular-for-CGRC-grievances.pdf',
                              text: 'View Time-Table',
                              fontSize: 18,
                              textColor: Color(0xFFD9D9D9),
                              borderRadius: 10,
                              buttonWidth: double.nan,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: screenHeight * 0.34,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                const SmallText(
                                  text: 'Placement',
                                  textSize: 24,
                                  textColor: Colors.black,
                                  textDecoration: TextDecoration.none,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: screenHeight * 0.13,
                                      width: screenWidth * 0.42,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/students_corner/placement.png',
                                          ), // replace with your image path
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.42,
                                      child: const SmallText(
                                        text:
                                            'See placement reports highlighting student achievements through college efforts',
                                        textSize: 15,
                                        textAlign: TextAlign.center,
                                        textColor: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Button(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const Placement(),
                                  ),
                                );
                              },
                              text: 'Placement Details',
                              fontSize: 18,
                              textColor: const Color(0xFFD9D9D9),
                              borderRadius: 10,
                              buttonWidth: double.nan,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: screenHeight * 0.34,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                const SmallText(
                                  text: 'Academic Bank Of Credit (ABC)',
                                  textSize: 24,
                                  textColor: Colors.black,
                                  textDecoration: TextDecoration.none,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: screenHeight * 0.13,
                                      width: screenWidth * 0.42,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/students_corner/abc.png',
                                          ), // replace with your image path
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.42,
                                      child: const SmallText(
                                        text:
                                            'Access resources and guidance on the Academic Bank of Credit (ABC).',
                                        textSize: 15,
                                        textAlign: TextAlign.center,
                                        textColor: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Button(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ABC(),
                                  ),
                                );
                              },
                              text: 'Learn More',
                              fontSize: 18,
                              textColor: const Color(0xFFD9D9D9),
                              borderRadius: 10,
                              buttonWidth: double.nan,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 15)),
            ],
          ),
        ),
      ),
    );
  }
}
