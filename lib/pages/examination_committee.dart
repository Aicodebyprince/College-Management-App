// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/small_text.dart';

class ExaminationCommittee extends StatelessWidget {
  const ExaminationCommittee({super.key});

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
                        'assets/examination_committee.png',
                      ), // Ensure this path is correct
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 585, // Make height responsive
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Examination Committee Members',
                        fontSize: 28,
                        underlineHeight: 4,
                        underlineTop: 38,
                        underlineWidth: 305,
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
                                  text: 'Chairperson In-Charge',
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
                                  text: 'Mr. Amit Gupta',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Examination In-charge',
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
                                  text: 'Ms. Abeda Shaikh',
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
                                  text: 'Mr. Vivek Raut',
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
                                  text: 'Dr. Vijay Gangan',
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
                                  text: 'Mrs. Tamanna Agrawal',
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
                                  text: 'Mr. Shailesh Nigwale',
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
                                  text: 'Ms. Pooja Waghela',
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
                                  text: 'Mrs. Jayeshree Parmar',
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
                                  text: 'Mr. Premkumar Narayanan',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Member (Non-Teaching)',
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
