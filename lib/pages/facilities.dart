// ignore_for_file: unused_local_variable

import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/small_text.dart';
import 'package:flutter/material.dart';
import 'package:super_bullet_list/bullet_list.dart';

class Facilities extends StatelessWidget {
  const Facilities({super.key});

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
                        'assets/facilities.png',
                      ), // replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 2300,
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Our Facilities',
                        fontSize: 28,
                        underlineTop: 32,
                        underlineHeight: 4,
                        underlineWidth: screenWidth * 0.5,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: '1. College Library',
                            textSize: 18,
                            textColor: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10.0,
                              right: 10,
                            ),
                            child: SuperBulletList(
                              // <------ here
                              isOrdered: false,
                              gap: 12,
                              items: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SmallText(
                                      text: 'Two Libraries:',
                                      textSize: 16,
                                      textAlign: TextAlign.left,
                                      textColor: Colors.black,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                        left: 10.0,
                                        right: 10,
                                      ),
                                      child: SuperBulletList(
                                        customBullet: SmallText(text: '■'),
                                        isOrdered: true,
                                        items: [
                                          SmallText(
                                            text:
                                                'Ground floor: For traditional courses.',
                                            textSize: 14,
                                            textAlign: TextAlign.left,
                                          ),
                                          SmallText(
                                            text:
                                                'Third floor: For self-financed/professional courses.',
                                            textSize: 14,
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SmallText(
                                  text:
                                      'Resources include textbooks, periodicals, magazines, journals, and regional/national newspapers.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                                SmallText(
                                  text:
                                      'Equipped with well-furnished reading rooms for students and teachers.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SmallText(
                                      text: 'Facilities include:',
                                      textSize: 16,
                                      textAlign: TextAlign.left,
                                      textColor: Colors.black,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                        left: 10.0,
                                        right: 10,
                                      ),
                                      child: SuperBulletList(
                                        customBullet: SmallText(text: '■'),
                                        isOrdered: true,
                                        items: [
                                          SmallText(
                                            text:
                                                'Book bank for poor and meritorious students.',
                                            textSize: 14,
                                            textAlign: TextAlign.left,
                                          ),
                                          SmallText(
                                            text:
                                                'Information circulation board.',
                                            textSize: 14,
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SmallText(
                                  text:
                                      'Students can borrow books using college library cards.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: '2. Canteen / Cafeteria',
                            textSize: 16,
                            textColor: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10.0,
                              right: 10,
                            ),
                            child: SuperBulletList(
                              // <------ here
                              isOrdered: false,
                              gap: 12,
                              items: [
                                SmallText(
                                  text:
                                      'Provides a space for students, teachers, and employees.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: '3. Drinking Water',
                            textSize: 16,
                            textColor: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10.0,
                              right: 10,
                            ),
                            child: SuperBulletList(
                              // <------ here
                              isOrdered: false,
                              gap: 12,
                              items: [
                                SmallText(
                                  text:
                                      'Clean and hygienic drinking water facilities installed on each floor and near the canteen area.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: '4. Playground For Sports',
                            textSize: 16,
                            textColor: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10.0,
                              right: 10,
                            ),
                            child: SuperBulletList(
                              // <------ here
                              isOrdered: false,
                              gap: 12,
                              items: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SmallText(
                                      text:
                                          'Dedicated playground for outdoor sports, including:',
                                      textSize: 14,
                                      textAlign: TextAlign.left,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                        left: 10.0,
                                        right: 10,
                                      ),
                                      child: SuperBulletList(
                                        customBullet: SmallText(text: '■'),
                                        isOrdered: true,
                                        items: [
                                          SmallText(
                                            text:
                                                'Cricket, football, basketball, kho-kho, kabaddi, badminton, etc.',
                                            textSize: 14,
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SmallText(
                                  text:
                                      'Annual sports activities and sports week organized in the college premises.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: '5. Gymnasium',
                            textSize: 16,
                            textColor: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10.0,
                              right: 10,
                            ),
                            child: SuperBulletList(
                              // <------ here
                              isOrdered: false,
                              gap: 12,
                              items: [
                                SmallText(
                                  text:
                                      'Equipped gymnasium for physical exercise for students and staff.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                                SmallText(
                                  text:
                                      'Facilities for indoor games like carom, chess, batminton, and table tennis.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: '6. Student’s Common Room',
                            textSize: 16,
                            textColor: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10.0,
                              right: 10,
                            ),
                            child: SuperBulletList(
                              // <------ here
                              isOrdered: false,
                              gap: 12,
                              items: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SmallText(
                                      text:
                                          'Separate common rooms for girls with:',
                                      textSize: 14,
                                      textAlign: TextAlign.left,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                        left: 10.0,
                                        right: 10,
                                      ),
                                      child: SuperBulletList(
                                        customBullet: SmallText(text: '■'),
                                        isOrdered: true,
                                        items: [
                                          SmallText(
                                            text:
                                                'Water supply, electricity, sanitation, and furniture.',
                                            textSize: 14,
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
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
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: '7. Auditorium / Seminar Hall',
                            textSize: 16,
                            textColor: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10.0,
                              right: 10,
                            ),
                            child: SuperBulletList(
                              // <------ here
                              isOrdered: false,
                              gap: 12,
                              items: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SmallText(
                                      text:
                                          'Auditorium under construction to host:',
                                      textSize: 14,
                                      textAlign: TextAlign.left,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                        left: 10.0,
                                        right: 10,
                                      ),
                                      child: SuperBulletList(
                                        customBullet: SmallText(text: '■'),
                                        isOrdered: true,
                                        items: [
                                          SmallText(
                                            text:
                                                'Seminars, workshops, meetings, cultural shows, etc.',
                                            textSize: 14,
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SmallText(
                                  text:
                                      'Designed with a decorated stage and adequate seating capacity.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: '8. Halls & Rooms',
                            textSize: 16,
                            textColor: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10.0,
                              right: 10,
                            ),
                            child: SuperBulletList(
                              // <------ here
                              isOrdered: false,
                              gap: 12,
                              items: [
                                SmallText(
                                  text: 'Spacious rooms and halls for courses.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                                SmallText(
                                  text:
                                      'Equipped with uninterrupted power supply.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: '9. Counselor',
                            textSize: 16,
                            textColor: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10.0,
                              right: 10,
                            ),
                            child: SuperBulletList(
                              // <------ here
                              isOrdered: false,
                              gap: 12,
                              items: [
                                SmallText(
                                  text:
                                      'A full-time counselor is available for students, teaching staff, and non-teaching staff.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: '10. Health Care & Hygiene Facility',
                            textSize: 16,
                            textColor: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10.0,
                              right: 10,
                            ),
                            child: SuperBulletList(
                              // <------ here
                              isOrdered: false,
                              gap: 12,
                              items: [
                                SmallText(
                                  text:
                                      '24-hour aqua drinking water for teachers and students.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                                SmallText(
                                  text:
                                      'Adequate urinals and latrines for both genders.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                                SmallText(
                                  text:
                                      'Coin-operated sanitary pad dispensers and incinerators in girls’ washrooms on the first and second floors.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: '11. Safety Measures',
                            textSize: 16,
                            textColor: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10.0,
                              right: 10,
                            ),
                            child: SuperBulletList(
                              // <------ here
                              isOrdered: false,
                              gap: 12,
                              items: [
                                SmallText(
                                  text:
                                      'Staff posted at the college gate to monitor entry and exit of outsiders.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                                SmallText(
                                  text:
                                      'College premises enclosed by boundary walls and monitored by CCTV surveillance.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: '12. Information Resources',
                            textSize: 16,
                            textColor: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10.0,
                              right: 10,
                            ),
                            child: SuperBulletList(
                              // <------ here
                              isOrdered: false,
                              gap: 12,
                              items: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SmallText(
                                      text: 'Notice boards for updates:',
                                      textSize: 14,
                                      textAlign: TextAlign.left,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                        left: 10.0,
                                        right: 10,
                                      ),
                                      child: SuperBulletList(
                                        customBullet: SmallText(text: '■'),
                                        isOrdered: true,
                                        items: [
                                          SmallText(
                                            text:
                                                'College, library, and departmental boards.',
                                            textSize: 14,
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SmallText(
                                  text:
                                      'Internet and Wi-Fi facilities across the campus.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: '13. Photocopy Machine & Stationery Shop',
                            textSize: 16,
                            textColor: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10.0,
                              right: 10,
                            ),
                            child: SuperBulletList(
                              // <------ here
                              isOrdered: false,
                              gap: 12,
                              items: [
                                SmallText(
                                  text:
                                      'On-campus facilities for photocopying and stationery.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: '14. Facilities For Especially Abled Persons',
                            textSize: 16,
                            textColor: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10.0,
                              right: 10,
                            ),
                            child: SuperBulletList(
                              // <------ here
                              isOrdered: false,
                              gap: 12,
                              items: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SmallText(
                                      text: 'Special provisions include:',
                                      textSize: 14,
                                      textAlign: TextAlign.left,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                        left: 10.0,
                                        right: 10,
                                      ),
                                      child: SuperBulletList(
                                        customBullet: SmallText(text: '■'),
                                        isOrdered: true,
                                        items: [
                                          SmallText(
                                            text:
                                                'Lift access, ramps, and washrooms designed for differently-abled individuals.',
                                            textSize: 14,
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
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
