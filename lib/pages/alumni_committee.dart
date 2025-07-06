// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/small_text.dart';

class AlumniCommittee extends StatelessWidget {
  const AlumniCommittee({super.key});

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
                  height: 225,
                  width: screenWidth * 0.95,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/alumni_committee.png',
                      ), // Ensure this path is correct
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 545, // Make height responsive
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Alumni Committee Members',
                        fontSize: 28,
                        underlineHeight: 4,
                        underlineTop: 38,
                        underlineWidth: 240,
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
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Mrs. Urmila Chauhan',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Convenor',
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
                                  text: 'Member',
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
                                  text: 'Member',
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
                                  text: 'Mr. Nilesh Dubey',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Member',
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
                                  text: 'Member',
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
                                  text: 'Mr. Yash Sharma',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Alumni',
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
                                  text: 'Mr. Devendra Tingale',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Alumni',
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
                                  text: 'Mr. Abhijot Singh Chadha',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: SmallText(
                                  text: 'Alumni',
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
                                  text: 'Ms. Nishi kapoor',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Alumni',
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
                                  text: 'Mr. Kamal Mathur',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Alumni',
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
