// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/small_text.dart';

class CollegeDevelopment extends StatelessWidget {
  const CollegeDevelopment({super.key});

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
                        'assets/slider/slider10.png',
                      ), // Ensure this path is correct
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 1225, // Make height responsive
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'College Development Committee Members',
                        fontSize: 28,
                        underlineHeight: 4,
                        underlineTop: 40,
                        underlineWidth: 270,
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
                                padding: const EdgeInsets.only(top: 38.0),
                                child: SmallText(
                                  text: 'Mrs. Reena N. Mehta',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text:
                                      'Chairperson of the Management or his nominee ex-officer Chairperson',
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
                                  text:
                                      'Secretary of the Management or his nominee',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 38.0),
                                child: SmallText(
                                  text: 'Mr. Amit Gupta',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text:
                                      'On head of department nominated by the principal',
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
                                  text:
                                      'Ms. Sonal Jain\n\nMs. Rinkle Solanki\n\nMr. Darshan Joshi\n\nMrs. Urmila Chauhan',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 45.0,
                                  left: 8.0,
                                  right: 8.0,
                                ),
                                child: SmallText(
                                  text:
                                      'Four teachers in the College, elected by the full-time teachers',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 26.0),
                                child: SmallText(
                                  text: 'Mr. Premkumar T. Narayanan',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text:
                                      'One non-teaching employee, elected by regular non-teaching staff',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: SmallText(
                                  text:
                                      'Mr. Rakesh Kapoor\n\nProf. K. Venkataramani\n\nMrs. Nirmala D. Vohra\n\nMr. Kamal Mathur',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text:
                                      'Four local members, nominated by the Management in consultation with the principal, from the fields of education, industry, research and social services of whom at least one shall be alumnus',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: SmallText(
                                  text: 'Dr. Vaishali P. Kothiya',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text:
                                      'Co-ordinator, Internal Quality Assurance Committee of the College',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 38.0),
                                child: SmallText(
                                  text: 'Ms. Nishi Kapoor',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text:
                                      'President and Secretary of the College Students’ Council',
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
                                  text: 'Dr. Satinder Kaur Gujral',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Principal of the College',
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
                                  text: 'Dr. Sunny Mehta',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Special Invitee',
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
