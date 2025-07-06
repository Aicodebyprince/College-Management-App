// ignore_for_file: unused_local_variable

import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/small_text.dart';
import 'package:flutter/material.dart';

class IQACCommittee extends StatelessWidget {
  const IQACCommittee({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
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
                  height: 120,
                  width: screenWidth * 0.95,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/iqac_committee.png',
                      ), // Ensure this path is correct
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 940, // Make height responsive
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'IQAC Committee Members',
                        fontSize: 28,
                        underlineHeight: 4,
                        underlineTop: 38,
                        underlineWidth: 210,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                      ),
                      child: Table(
                        border: TableBorder.all(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          width: 3,
                        ),
                        columnWidths: const {
                          0: FixedColumnWidth(
                            170,
                          ), // Wider width for Particulars
                          1: FixedColumnWidth(
                            150,
                          ), // Wider width for Particulars
                        },
                        children: [
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: SmallText(
                                  text: 'Committee Members',
                                  textSize: 16,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Designation',
                                  textSize: 16,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: SmallText(
                                  text: 'Dr. Satinder Kaur Gujral',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Principal / Chairperson of IQAC',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Dr. Vaishali Kothiya',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'IQAC Co-Ordinator',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: SmallText(
                                  text: 'Mrs. Urmila Chauhan',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'IQAC Co-Coordinator',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 28.0),
                                child: SmallText(
                                  text: 'Mr. Narendra Mehta',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Secretary / Management Representative',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Mrs. Rinkle Solanki',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Teacher / Member',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Mr. Amit Gupta',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Teacher / Member',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Ms. Sonal Jain',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Teacher / Member',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: SmallText(
                                  text: 'Mr. Durgesh Gupta',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Teacher / Member',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Mr. Darshan Joshi',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Teacher / Member',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: SmallText(
                                  text: 'Mr. Premkumar Narayanan',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Senior Administrative Member',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: SmallText(
                                  text: 'Mr. Narendra Sharma',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Administrative Member',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: SmallText(
                                  text: 'Mrs. Nirmala Vohra',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Nominee From Local Society',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: SmallText(
                                  text: 'Mr. Kamal Mathur',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Alumni Representative',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: SmallText(
                                  text: 'Ms. Nishi Kapoor',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Student Representative',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Prof. K. Venkataramani',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Educationalist',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Mr. Rakesh Kapoor',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Industrialist',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
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
