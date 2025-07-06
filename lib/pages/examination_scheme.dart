// ignore_for_file: unused_local_variable

import 'package:bulleted_list/bulleted_list.dart';
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/small_container.dart';
import 'package:princeproject/components/small_text.dart';
import 'package:super_bullet_list/bullet_list.dart';

class ExaminationScheme extends StatelessWidget {
  const ExaminationScheme({super.key});

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
                        'assets/scheme_of_examination.png',
                      ), // replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 2550,
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Scheme Of Examination',
                        fontSize: 28,
                        underlineTop: 32,
                        underlineHeight: 4,
                        underlineWidth: 310,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SmallText(
                            text:
                                'The performance of the learners will be evaluated in two components:–',
                            textSize: 16,
                            textAlign: TextAlign.left,
                            textColor: Colors.black,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10.0,
                              right: 10,
                            ),
                            child: SuperBulletList(
                              iconColor: Color(0xFF545454),
                              // <------ here
                              isOrdered: false,
                              gap: 12,
                              items: [
                                SmallText(
                                  text:
                                      'First component will be the internal assessment component carrying 25% marks.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                                SmallText(
                                  text:
                                      'Second component will the semester wise end examination component carrying 75% marks.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: SmallText(
                              text:
                                  'The allocation of marks for assessment & semester end examination will be shown below:-',
                              textSize: 16,
                              textAlign: TextAlign.left,
                              textColor: Colors.black,
                            ),
                          ),
                          SmallContainer(
                            height: 1000,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    left: 10.0,
                                    right: 10,
                                  ),
                                  child: SmallText(
                                    text:
                                        'A. Internal Assessment = 25 Marks (B.M.S. / B.B.I. / B.A.F. / B.M.M. / BSc. I.T.)',
                                    textSize: 16,
                                    textColor: Colors.black,
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
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      width: 3,
                                    ),
                                    columnWidths: const {
                                      0: FixedColumnWidth(
                                        60,
                                      ), // Wider width for Particulars
                                      1: FixedColumnWidth(
                                        160,
                                      ), // Wider width for Particulars
                                      2: FixedColumnWidth(
                                        70,
                                      ), // Wider width for Particulars
                                    },
                                    children: [
                                      TableRow(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 8.0,
                                            ),
                                            child: SmallText(
                                              text: 'Sr. No.',
                                              textSize: 16,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SmallText(
                                              text: 'Particulars',
                                              textSize: 16,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SmallText(
                                              text: 'Marks',
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
                                              text: '1',
                                              textSize: 14,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SmallText(
                                              text: 'One Class Test',
                                              textSize: 14,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SmallText(
                                              text: '20 Marks',
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
                                              text: '2',
                                              textSize: 14,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SmallText(
                                              text:
                                                  'Active participation in class, responsible behavior, good manners, clear communication, and leadership in organizing academic activities.',
                                              textSize: 14,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SmallText(
                                              text: '5 Marks',
                                              textSize: 14,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    left: 10.0,
                                    right: 10,
                                  ),
                                  child: SmallText(
                                    text: 'For Course With Practical (BSC IT)',
                                    textSize: 16,
                                    textColor: Colors.black,
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
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      width: 3,
                                    ),
                                    columnWidths: const {
                                      0: FixedColumnWidth(
                                        60,
                                      ), // Wider width for Particulars
                                      1: FixedColumnWidth(
                                        130,
                                      ), // Wider width for Particulars
                                      2: FixedColumnWidth(
                                        100,
                                      ), // Wider width for Particulars
                                    },
                                    children: [
                                      TableRow(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 8.0,
                                            ),
                                            child: SmallText(
                                              text: 'Sr. No.',
                                              textSize: 16,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SmallText(
                                              text: 'Particulars',
                                              textSize: 16,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SmallText(
                                              text: 'Marks',
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
                                              text: '1',
                                              textSize: 14,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SmallText(
                                              text: 'Program I',
                                              textSize: 14,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SmallText(
                                              text: '20 Marks',
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
                                              text: '2',
                                              textSize: 14,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SmallText(
                                              text: 'Program II',
                                              textSize: 14,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SmallText(
                                              text: '20 Marks',
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
                                              text: '3',
                                              textSize: 14,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SmallText(
                                              text: 'Journal',
                                              textSize: 14,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SmallText(
                                              text: '5 Marks',
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
                                              text: '4',
                                              textSize: 14,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SmallText(
                                              text: 'VIVA',
                                              textSize: 14,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SmallText(
                                              text: '5 Marks',
                                              textSize: 14,
                                              textColor: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    left: 10.0,
                                    right: 10,
                                  ),
                                  child: SmallText(
                                    text:
                                        'B. External Examination = 75 Marks (B.M.S. / B.B.I. / B.A.F. / B.M.M. / BSc. I.T.)',
                                    textSize: 16,
                                    textColor: Colors.black,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    left: 10.0,
                                    right: 10,
                                  ),
                                  child: SuperBulletList(
                                    textStyle: TextStyle(
                                      fontWeight:
                                          FontWeight
                                              .bold, // Make bullet text bold
                                      fontSize:
                                          16, // Match the size of SmallText
                                    ),
                                    // <------ here
                                    isOrdered:
                                        true, // Change to true for numeric bullets
                                    gap: 12,
                                    items: [
                                      SmallText(
                                        text:
                                            'Duration:– these examination shall be of 2.5 hours duration',
                                        textSize: 16,
                                        textColor: Colors.black,
                                        textAlign: TextAlign.left,
                                      ),
                                      SmallText(
                                        text: 'Theory Question paper pattern.',
                                        textSize: 16,
                                        textColor: Colors.black,
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.0,
                                    right: 10,
                                  ),
                                  child: BulletedList(
                                    bulletColor: Color(0xFF545454),
                                    style: TextStyle(
                                      color: Color(0xFF545454),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    listItems: [
                                      'There shall be five questions.',
                                      'All question shall be compulsory with internal choice within the questions.',
                                      'Question may be subdivided into subquestions such as A,B,C…. and the allocation of marks depends on the weighing of topic.',
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: HeaderTitle(
                              text: 'Passing Standard',
                              fontSize: 28,
                              underlineTop: 36,
                              underlineHeight: 4,
                              underlineWidth: 310,
                            ),
                          ),
                          BulletedList(
                            bulletColor: Colors.black,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            listItems: [
                              'The leaners to pass a course shall have to a minimum of 40% marks in aggregate for each course consists of internal assessment and semester end examination.',
                              'The leaner shall obtain minimum of 40% marks i.e. (10 out of 25) in the internal assessment and 40% in semester end examination i.e. (30 out of 75) separately & individually to pass a particular semester',
                              'A leaner will be said to have passed the course if the leaner passes the internal assessment and semester end examination separately.',
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 10.0, right: 10),
                      child: SmallText(
                        text:
                            'The Seven (7) Point Grading System (For Third Year)',
                        textSize: 20,
                        textColor: Colors.black,
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
                            75,
                          ), // Wider width for Particulars
                          1: FixedColumnWidth(
                            125,
                          ), // Wider width for Particulars
                          2: FixedColumnWidth(
                            120,
                          ), // Wider width for Particulars
                        },
                        children: [
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: SmallText(
                                  text: 'Grade',
                                  textSize: 16,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Marks',
                                  textSize: 16,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Grade Points',
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
                                  text: 'O',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '70% & Above',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '7 & Above',
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
                                  text: 'A',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '60% - 69.99%',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '6 - 6.99',
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
                                  text: 'B',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '55% - 54.99%',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '5 - 5.99',
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
                                  text: 'C',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '50% - 54.99%',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '4 - 4.99',
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
                                  text: 'D',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '45% & 49.99%',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '3 - 3.99',
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
                                  text: 'E',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '40% - 44.99%',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '2 - 2.99',
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
                                  text: 'F',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '39.99% & Below',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '1 - 1.99',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 10.0, right: 10),
                      child: SmallText(
                        text:
                            'The Ten (10) Point Grading System (For First / Second / Third Year)',
                        textSize: 20,
                        textColor: Colors.black,
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
                            75,
                          ), // Wider width for Particulars
                          1: FixedColumnWidth(
                            125,
                          ), // Wider width for Particulars
                          2: FixedColumnWidth(
                            120,
                          ), // Wider width for Particulars
                        },
                        children: [
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: SmallText(
                                  text: 'Grade',
                                  textSize: 16,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Marks',
                                  textSize: 16,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Grade Points',
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
                                  text: 'O',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '80% & Above',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '10',
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
                                  text: 'A',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '70% – 79.99%',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '9',
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
                                  text: 'A+',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '60% – 69.99%',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '8',
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
                                  text: 'B',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '55% – 59.99%',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '7',
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
                                  text: 'B+',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '50% – 49.99%',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '6',
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
                                  text: 'C',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '45% – 44.99%',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '5',
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
                                  text: 'D',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '40% - 44.99%',
                                  textSize: 14,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: '4',
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
              Padding(padding: EdgeInsets.only(top: 15)),
            ],
          ),
        ),
      ),
    );
  }
}
