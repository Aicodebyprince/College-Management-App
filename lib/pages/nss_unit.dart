// ignore_for_file: unused_local_variable
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/button.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/small_container.dart';
import 'package:princeproject/components/small_text.dart';

class NSSUnit extends StatelessWidget {
  const NSSUnit({super.key});

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
                        'assets/nss_unit/nss_unit.png',
                      ), // replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 3750,
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'NSS Unit',
                        fontSize: 28,
                        underlineHeight: 4,
                        underlineTop: 35,
                        underlineWidth: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: SmallText(
                        text:
                            'The National Service Scheme (NSS) was established on September 24, 1969, during the Gandhi centenary year. Initially, the scheme was launched in 37 universities and involved 40,000 students. Over the years, NSS has grown to become the largest government organization for students in India.',
                        textSize: 12,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 0.0,
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 90,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/nss_unit/nss_unit1.png',
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.45,
                            child: SmallText(
                              text:
                                  'Today, the NSS comprises members ranging from the +2 level to the college and university levels, with a volunteer strength exceeding 30 lakh students.',
                              textSize: 12,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.0, left: 8.0, right: 8.0),
                      child: SmallText(
                        text:
                            'This remarkable growth makes the NSS one of the largest student forces in the world.',
                        textSize: 12,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 0.0,
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.45,
                            child: SmallText(
                              text:
                                  'The scheme works in collaboration with various government agencies and non-government organizations (NGOs)',
                              textSize: 12,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            height: 90,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/nss_unit/nss_unit2.png',
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.0, left: 8.0, right: 8.0),
                      child: SmallText(
                        text:
                            ' to implement programs that focus on building community assets, educating underprivileged people, and offering social services for community welfare.',
                        textSize: 12,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 3.0,
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 90,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/nss_unit/nss_unit3.png',
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.45,
                            child: SmallText(
                              text:
                                  'The NSS is instrumental not only in fostering the personality development of its volunteers but also in promoting national unity and integrity.',
                              textSize: 12,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.0, left: 8.0, right: 8.0),
                      child: SmallText(
                        text:
                            'By bringing together young people from diverse geographical and socio-cultural backgrounds, it strengthens the bonds of unity across the nation.\nAt Jadavpur University, the NSS started functioning in 1969, the year of its inception. Since then, the scheme has consistently performed at a highly satisfactory level, contributing significantly to the university’s social outreach initiatives and the holistic development of its students.',
                        textSize: 12,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Container(
                        height: 100,
                        width: 345,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          image: DecorationImage(
                            image: AssetImage('assets/nss_unit/our_aims.png'),
                            fit: BoxFit.cover,
                            opacity: 0.6,
                          ),
                        ),
                        child: Center(
                          child: HeaderTitle(
                            text: 'Our Aims',
                            textColor: Colors.white,
                            fontSize: 28,
                            underlineTop: 34,
                            underlineHeight: 4,
                            underlineWidth: 140,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 8, right: 8),
                      child: BulletedList(
                        style: TextStyle(
                          color: Color(0xFF545454),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        listItems: [
                          'The NSS is part of our academic, social and personal life as it is the third dimension of education.',
                          'It allows the students to actively contribute their services for the cause of community and the nation, thus helping them develop their personality.',
                          'Service and attain the traits of a leader of the nation. As such, the NSS is the right platform, where the student- youth of the nation may get to involve with real-life social activities, and thereby become responsible citizen of India.',
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Container(
                        height: 100,
                        width: 345,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/nss_unit/our_objectives.png',
                            ),
                            fit: BoxFit.cover,
                            opacity: 0.6,
                          ),
                        ),
                        child: Center(
                          child: HeaderTitle(
                            text: 'Our Objectives',
                            textColor: Colors.white,
                            fontSize: 28,
                            underlineTop: 36,
                            underlineHeight: 4,
                            underlineWidth: 230,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 8, right: 8),
                      child: BulletedList(
                        style: TextStyle(
                          color: Color(0xFF545454),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        listItems: [
                          'Understand the community in which the students work.',
                          'Understand themselves in relation to their community.',
                          'Develop among themselves a sense of social and civic responsibility.',
                          'Identify the needs and problems of the community and involve them in the solution of problems.',
                          'Utilize their knowledge in finding practical solution to individual and community problems.',
                          'Develop competence required for collective existence and sharing of responsibilities.',
                          'Gain skills in mobilizing community participation.',
                          'Acquire leadership qualities and democratic attitude.',
                          'Develop capacity to meet emergencies and natural disasters.',
                          'practice national integration and social harmony.',
                        ],
                      ),
                    ),
                    Center(
                      child: HeaderTitle(
                        text: 'NSS Committee Members',
                        fontSize: 28,
                        underlineTop: 34,
                        underlineHeight: 5,
                        underlineWidth: 340,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 0,
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
                            180,
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
                                  text: 'Faculty Member Name',
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
                                  text: 'Mr. Nilesh Dubey (P.O)',
                                  textSize: 14,
                                  textColor: Colors.black,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SmallText(
                                    text: 'Convenor',
                                    textSize: 14,
                                    textColor: Colors.black,
                                  ),
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
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SmallText(
                                    text: 'Member',
                                    textSize: 14,
                                    textColor: Colors.black,
                                  ),
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
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SmallText(
                                    text: 'Member',
                                    textSize: 14,
                                    textColor: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Ms. Sonam Dwivedi',
                                  textSize: 14,
                                  textColor: Colors.black,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SmallText(
                                    text: 'Member',
                                    textSize: 14,
                                    textColor: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Mrs. Jayashree Parmar',
                                  textSize: 14,
                                  textColor: Colors.black,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SmallText(
                                    text: 'Member',
                                    textSize: 14,
                                    textColor: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Mr. Navnitlal',
                                  textSize: 14,
                                  textColor: Colors.black,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SmallText(
                                    text: 'Member',
                                    textSize: 14,
                                    textColor: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Ms. Vishakha Pandey',
                                  textSize: 14,
                                  textColor: Colors.black,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SmallText(
                                    text: 'Member',
                                    textSize: 14,
                                    textColor: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SmallText(
                                  text: 'Mr. Rahul Gaikwad',
                                  textSize: 14,
                                  textColor: Colors.black,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Center(
                                  child: SmallText(
                                    text: 'Member',
                                    textSize: 14,
                                    textColor: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 18,
                                  left: 8,
                                ),
                                child: SmallText(
                                  text: 'Mr. Prince Jaiswal',
                                  textSize: 14,
                                  textColor: Colors.black,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SmallText(
                                    text: 'Student Representative',
                                    textSize: 14,
                                    textColor: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 18,
                                  left: 8,
                                ),
                                child: SmallText(
                                  text: 'Ms. Zakiya Gaur',
                                  textSize: 14,
                                  textColor: Colors.black,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SmallText(
                                    text: 'Student Representative',
                                    textSize: 14,
                                    textColor: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: HeaderTitle(
                        text: 'Activities Undertaken',
                        fontSize: 28,
                        underlineTop: 34,
                        underlineHeight: 4,
                        underlineWidth: 285,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 8, right: 8),
                      child: Column(
                        children: [
                          SmallContainer(
                            height: 60,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 0),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallText(
                                      text: 'Yoga Day',
                                      textSize: 20,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                    Button(
                                      text: 'View',
                                      fontSize: 20,
                                      borderRadius: 20,
                                      buttonWidth: double.nan,
                                      url:
                                          'https://rmc.edu.in/wp-content/uploads/2022/07/Report_Yoga-Day.pdf',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SmallContainer(
                            height: 80,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.55,
                                      child: SmallText(
                                        text:
                                            'Tribute To The Brave Heart Of Pulwama',
                                        textSize: 20,
                                        textColor: Colors.black,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Button(
                                      text: 'View',
                                      fontSize: 20,
                                      borderRadius: 20,
                                      buttonWidth: double.nan,
                                      url:
                                          'https://rmc.edu.in/wp-content/uploads/2022/05/Tribute-to-the-Brave-Heart-of-Pulwama.pdf',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SmallContainer(
                            height: 60,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallText(
                                      text: 'National Voters Day',
                                      textSize: 20,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                    Button(
                                      text: 'View',
                                      fontSize: 20,
                                      borderRadius: 20,
                                      buttonWidth: double.nan,
                                      url:
                                          'https://rmc.edu.in/wp-content/uploads/2022/05/National-Voters-Day.pdf',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SmallContainer(
                            height: 80,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.55,
                                      child: SmallText(
                                        text: 'Savitribai Phule Jayanti',
                                        textSize: 20,
                                        textColor: Colors.black,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Button(
                                      text: 'View',
                                      fontSize: 20,
                                      borderRadius: 20,
                                      buttonWidth: double.nan,
                                      url:
                                          'https://rmc.edu.in/wp-content/uploads/2022/05/Savitribai-Phule-Jayanti.pdf',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SmallContainer(
                            height: 60,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallText(
                                      text: 'HIV Awareness',
                                      textSize: 20,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                    Button(
                                      text: 'View',
                                      fontSize: 20,
                                      borderRadius: 20,
                                      buttonWidth: double.nan,
                                      url:
                                          'https://rmc.edu.in/wp-content/uploads/2022/05/HIV-Awareness.pdf',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SmallContainer(
                            height: 80,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.55,
                                      child: SmallText(
                                        text: 'Celebrations Of Gandhi Jayanti',
                                        textSize: 20,
                                        textColor: Colors.black,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Button(
                                      text: 'View',
                                      fontSize: 20,
                                      borderRadius: 20,
                                      buttonWidth: double.nan,
                                      url:
                                          'https://rmc.edu.in/wp-content/uploads/2022/05/Celebrations-of-Gandhi-Jayanti.pdf',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SmallContainer(
                            height: 100,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.55,
                                      child: SmallText(
                                        text:
                                            'Workshop On Municipal Waste Management',
                                        textSize: 20,
                                        textColor: Colors.black,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Button(
                                      text: 'View',
                                      fontSize: 20,
                                      borderRadius: 20,
                                      buttonWidth: double.nan,
                                      url:
                                          'https://rmc.edu.in/wp-content/uploads/2022/05/Workshop-on-Municipal-Waste-Management-1.pdf',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SmallContainer(
                            height: 60,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallText(
                                      text: 'Blood Donation Camp',
                                      textSize: 20,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                    Button(
                                      text: 'View',
                                      fontSize: 20,
                                      borderRadius: 20,
                                      buttonWidth: double.nan,
                                      url:
                                          'https://rmc.edu.in/wp-content/uploads/2022/05/Blood-Donation-Camp.pdf',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SmallContainer(
                            height: 80,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.55,
                                      child: SmallText(
                                        text:
                                            'Donation For Konkan Floods Victims',
                                        textSize: 20,
                                        textColor: Colors.black,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Button(
                                      text: 'View',
                                      fontSize: 20,
                                      borderRadius: 20,
                                      buttonWidth: double.nan,
                                      url:
                                          'https://rmc.edu.in/wp-content/uploads/2022/05/Donation-For-Konkan-Floods-Victims.pdf',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SmallContainer(
                            height: 100,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.55,
                                      child: SmallText(
                                        text:
                                            'International Day Against Drug Abuse & Illicit Trafficking',
                                        textSize: 20,
                                        textColor: Colors.black,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Button(
                                      text: 'View',
                                      fontSize: 20,
                                      borderRadius: 20,
                                      buttonWidth: double.nan,
                                      url:
                                          'https://rmc.edu.in/wp-content/uploads/2022/05/International-Day-Against-Drug-Abuse-and-Illicit-Trafficking.pdf',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SmallContainer(
                            height: 60,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallText(
                                      text: 'Kargil Vijay Diwas',
                                      textSize: 20,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                    Button(
                                      text: 'View',
                                      fontSize: 20,
                                      borderRadius: 20,
                                      buttonWidth: double.nan,
                                      url:
                                          'https://rmc.edu.in/wp-content/uploads/2022/05/Kargil-Vijay-Diwas.pdf',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SmallContainer(
                            height: 60,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallText(
                                      text: 'Tree Plantation',
                                      textSize: 20,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                    Button(
                                      text: 'View',
                                      fontSize: 20,
                                      borderRadius: 20,
                                      buttonWidth: double.nan,
                                      url:
                                          'https://rmc.edu.in/wp-content/uploads/2022/05/Tree-Plantation.pdf',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SmallContainer(
                            height: 80,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.55,
                                      child: SmallText(
                                        text: 'International Youth Day',
                                        textSize: 20,
                                        textColor: Colors.black,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Button(
                                      text: 'View',
                                      fontSize: 20,
                                      borderRadius: 20,
                                      buttonWidth: double.nan,
                                      url:
                                          'https://rmc.edu.in/wp-content/uploads/2022/05/International-Youth-Day.pdf',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SmallContainer(
                            height: 80,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.55,
                                      child: SmallText(
                                        text: 'International Yoga Day',
                                        textSize: 20,
                                        textColor: Colors.black,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Button(
                                      text: 'View',
                                      fontSize: 20,
                                      borderRadius: 20,
                                      buttonWidth: double.nan,
                                      url:
                                          'https://rmc.edu.in/wp-content/uploads/2022/05/International-Yoga-Day.pdf',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SmallContainer(
                            height: 80,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.55,
                                      child: SmallText(
                                        text: 'World Environment Day',
                                        textSize: 20,
                                        textColor: Colors.black,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Button(
                                      text: 'View',
                                      fontSize: 20,
                                      borderRadius: 20,
                                      buttonWidth: double.nan,
                                      url:
                                          'https://rmc.edu.in/wp-content/uploads/2022/05/World-Environment-Day.pdf',
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
