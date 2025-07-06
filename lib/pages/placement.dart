// ignore_for_file: unused_local_variable
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/button.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/small_container.dart';
import 'package:princeproject/components/small_text.dart';
import 'package:flutter/material.dart';

class Placement extends StatelessWidget {
  const Placement({super.key});

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
                        'assets/placement.png',
                      ), // replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 640,
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Placement Success',
                        fontSize: 28,
                        underlineHeight: 4,
                        underlineTop: 35,
                        underlineWidth: 250,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: SmallText(
                        text:
                            'The Placement page highlights the remarkable achievements of our students who have successfully secured placements through the college’s dedicated efforts. It provides detailed placement reports showcasing the industries, companies, and roles where our students have excelled.',
                        textSize: 14,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Explore Our Placement Reports',
                        fontSize: 28,
                        underlineHeight: 4,
                        underlineTop: 40,
                        underlineWidth: screenWidth * 0.82,
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
                                text: 'Report 2021-2022',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Button(
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2022/07/placement-annual-report.pdf',
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
                                text: 'Report 2019-2020',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Button(
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2021/07/Placement-Report-2019-2020.pdf',
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
                                text: 'Report 2018-2019',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Button(
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2021/07/Placement-Report-2018-2019.pdf',
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
                                text: 'Report 2017-2018',
                                textSize: 20,
                                textColor: Colors.black,
                              ),
                            ),
                            Button(
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2021/07/PLACEMENT-Report-2017-2018.pdf',
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
