// ignore_for_file: unused_local_variable

import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/button.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/small_container.dart';
import 'package:princeproject/components/small_text.dart';
import 'package:flutter/material.dart';

class ABC extends StatelessWidget {
  const ABC({super.key});

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
                  height: 200,
                  width: screenWidth * 0.95,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/abc.png',
                      ), // replace with your image path
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 800,
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Empowering Learning Through The ABC',
                        fontSize: 28,
                        underlineHeight: 4,
                        underlineTop: 40,
                        underlineWidth: screenWidth * 0.76,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: SmallText(
                        text:
                            'The Academic Bank of Credits (ABC) is a digital platform designed to promote flexible and student-centric learning by enabling students to store, transfer, and redeem their academic credits. This initiative aligns with the National Education Policy (NEP) to support lifelong learning and ease mobility across institutions. At Reena Mehta College, the ABC page provides essential resources to guide students and Higher Education Institutions (HEIs) on utilizing the platform, including notices, banners, and detailed flyers for seamless registration and credit management.',
                        textSize: 14,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Essential Guides & Notices',
                        fontSize: 28,
                        underlineHeight: 4,
                        underlineTop: 35,
                        underlineWidth: screenWidth * 0.66,
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: SmallText(
                                text: 'ABC Notice',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Button(
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2023/10/ABC-Notice-10-10-2023.pdf',
                              text: 'View',
                              fontSize: 20,
                              buttonWidth: double.nan,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: SmallText(
                                text: 'NAD Banner',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Button(
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2023/04/NAD-Banner-1.pdf',
                              text: 'View',
                              fontSize: 20,
                              buttonWidth: double.nan,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: SmallText(
                                text: 'ABC Banner For\nStudent & HEIs',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Button(
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2023/04/ABC-Banner-for-student-and-HEIs-1.pdf',
                              text: 'View',
                              fontSize: 20,
                              buttonWidth: double.nan,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: SmallText(
                                text: 'ABC Flyer For Student',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Button(
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2023/04/ABC-Flyer-for-Student-1.pdf',
                              text: 'View',
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
