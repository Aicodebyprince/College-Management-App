// ignore_for_file: unused_local_variable
import 'package:princeproject/components/button.dart';
import 'package:princeproject/components/small_container.dart';
import 'package:super_bullet_list/bullet_list.dart';
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/small_text.dart';
import 'package:flutter/material.dart';

class PolicyProcedures extends StatelessWidget {
  const PolicyProcedures({super.key});

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
                        'assets/policy_procedures/procedures.png',
                      ), // replace with your image path
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 1600,
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Procedures',
                        fontSize: 28,
                        underlineTop: 32,
                        underlineHeight: 4,
                        underlineWidth: screenWidth * 0.4,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: '1. Regular Maintenance & Upkeep',
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
                                      'Maintenance and upkeep of the campus and its facilities is a regular task.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                                SmallText(
                                  text:
                                      'This is done even when funds are not specifically allocated.',
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
                            text: '2. Management Of Maintenance',
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
                                          'The governing body manages these tasks through the maintenance supervisor.',
                                      textSize: 14,
                                      textAlign: TextAlign.left,
                                    ),
                                    SmallText(
                                      text:
                                          'The supervisor is supported by a team consisting of:',
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
                                            text: 'Hardware Technician',
                                            textSize: 14,
                                          ),
                                          SmallText(
                                            text: 'Electrician',
                                            textSize: 14,
                                          ),
                                          SmallText(
                                            text: 'Plumber',
                                            textSize: 14,
                                          ),
                                          SmallText(
                                            text: 'Painter',
                                            textSize: 14,
                                          ),
                                          SmallText(
                                            text: 'Carpenter',
                                            textSize: 14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SmallText(
                                  text:
                                      'Minor faults are handled by the team, while experts are called in for major faults.',
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
                            text: '3. Types of Regular Maintenance',
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
                                          'Civil work maintenance, including:',
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
                                            text: 'Furniture Repairs',
                                            textSize: 14,
                                          ),
                                          SmallText(
                                            text: 'Masonry & Plaster Works',
                                            textSize: 14,
                                          ),
                                          SmallText(
                                            text: 'Whitewash',
                                            textSize: 14,
                                          ),
                                          SmallText(
                                            text: 'Carpentry',
                                            textSize: 14,
                                          ),
                                          SmallText(
                                            text: 'Plumbing',
                                            textSize: 14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SmallText(
                                  text:
                                      'Housekeeping is also part of the regular tasks.',
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
                            text: '4. Cleanliness and Hygiene',
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
                                          'Sweeper staff ensure cleanliness in various areas, including:',
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
                                            text: 'Classrooms',
                                            textSize: 14,
                                          ),
                                          SmallText(
                                            text: 'Staff Rooms',
                                            textSize: 14,
                                          ),
                                          SmallText(
                                            text: 'Seminar Hall',
                                            textSize: 14,
                                          ),
                                          SmallText(
                                            text: 'Laboratories',
                                            textSize: 14,
                                          ),
                                          SmallText(
                                            text: 'Auditorium',
                                            textSize: 14,
                                          ),
                                          SmallText(
                                            text: 'Common Rooms',
                                            textSize: 14,
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
                        top: 10,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: '5. Tools and Equipment',
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
                                      'The maintenance team is well-equipped with the necessary tools and supplies.',
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
                            text: '6. Surveillance and Monitoring',
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
                                      'Campus maintenance is monitored through surveillance cameras to ensure safety and security.',
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
                            text: '7. Maintenance of Property/Equipment',
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
                                          'Regular maintenance of properties and equipment is ensured, including:',
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
                                            text: 'Generators',
                                            textSize: 14,
                                          ),
                                          SmallText(
                                            text: 'Air Conditioners',
                                            textSize: 14,
                                          ),
                                          SmallText(
                                            text: 'CCTV Cameras',
                                            textSize: 14,
                                          ),
                                          SmallText(
                                            text: 'Water Purifiers',
                                            textSize: 14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SmallText(
                                  text:
                                      'This is managed through contractual technicians.',
                                  textSize: 14,
                                  textAlign: TextAlign.left,
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
              HeaderTitle(
                text: 'Meet Our Dedicated Staff',
                fontSize: 28,
                underlineTop: 32,
                underlineHeight: 4,
                underlineWidth: screenWidth * 0.9,
              ),
              Container(
                height: 225,
                width: screenWidth * 0.95,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/policy_procedures/sop.png',
                    ), // replace with your image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              BigContainer(
                height: 795,
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'SOPs Repository',
                        fontSize: 28,
                        underlineTop: 36,
                        underlineHeight: 4,
                        underlineWidth: screenWidth * 0.6,
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SmallText(
                                text: 'Examination SOP',
                                textAlign: TextAlign.left,
                                textColor: Colors.black,
                                textSize: 16,
                                textDecoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Button(
                              text: 'View',
                              fontSize: 18,
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2022/07/1.-SOP_Examination.pdf',
                              buttonWidth: 90,
                              borderRadius: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SmallText(
                                text: 'Purchase & Inventory SOP',
                                textAlign: TextAlign.left,
                                textColor: Colors.black,
                                textSize: 16,
                                textDecoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Button(
                              text: 'View',
                              fontSize: 18,
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2022/07/2.-SOP_Purchase-and-Inventory.pdf',
                              buttonWidth: 90,
                              borderRadius: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SmallText(
                                text: 'IT LAB SOP',
                                textAlign: TextAlign.left,
                                textColor: Colors.black,
                                textSize: 16,
                                textDecoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Button(
                              text: 'View',
                              fontSize: 18,
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2022/07/3.-SOP_Maintenance-_-Utilization-of-Lab.pdf',
                              buttonWidth: 90,
                              borderRadius: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SmallText(
                                text: 'Library SOP',
                                textAlign: TextAlign.left,
                                textColor: Colors.black,
                                textSize: 16,
                                textDecoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Button(
                              text: 'View',
                              fontSize: 18,
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2022/07/4.-SOP_Library.pdf',
                              buttonWidth: 90,
                              borderRadius: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SmallText(
                                text: 'Relations Process SOP',
                                textAlign: TextAlign.left,
                                textColor: Colors.black,
                                textSize: 16,
                                textDecoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Button(
                              text: 'View',
                              fontSize: 18,
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2022/07/5.-SOP_Relation-Process.pdf',
                              buttonWidth: 90,
                              borderRadius: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SmallText(
                                text: 'Science LAB SOP',
                                textAlign: TextAlign.left,
                                textColor: Colors.black,
                                textSize: 16,
                                textDecoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Button(
                              text: 'View',
                              fontSize: 18,
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2022/07/6.-SOP_Science-Lab.pdf',
                              buttonWidth: 90,
                              borderRadius: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SmallText(
                                text: 'Training & Placement SOP',
                                textAlign: TextAlign.left,
                                textColor: Colors.black,
                                textSize: 16,
                                textDecoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Button(
                              text: 'View',
                              fontSize: 18,
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2022/07/7.-SOP_Training-_-Placement.pdf',
                              buttonWidth: 90,
                              borderRadius: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SmallText(
                                text: 'Academic Process SOP',
                                textAlign: TextAlign.left,
                                textColor: Colors.black,
                                textSize: 16,
                                textDecoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Button(
                              text: 'View',
                              fontSize: 18,
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2022/07/8.-SOP_Academic-Process.pdf',
                              buttonWidth: 90,
                              borderRadius: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SmallText(
                                text: 'Administration SOP',
                                textAlign: TextAlign.left,
                                textColor: Colors.black,
                                textSize: 16,
                                textDecoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Button(
                              text: 'View',
                              fontSize: 18,
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2022/07/9.-SOP_Administration.pdf',
                              buttonWidth: 90,
                              borderRadius: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  height: 225,
                  width: screenWidth * 0.95,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/policy_procedures/policy.png',
                      ), // replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 635,
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Our Policies',
                        fontSize: 28,
                        underlineTop: 36,
                        underlineHeight: 4,
                        underlineWidth: screenWidth * 0.6,
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SmallText(
                                text: 'Quality Assurance &\nImprovement Policy',
                                textAlign: TextAlign.left,
                                textColor: Colors.black,
                                textSize: 16,
                                textDecoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Button(
                              text: 'View',
                              fontSize: 18,
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2022/07/Quality-Assurance-_-Improvement-Policy.pdf',
                              buttonWidth: 90,
                              borderRadius: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SmallText(
                                text: 'Policy Towards\nSocial Commitment',
                                textAlign: TextAlign.left,
                                textColor: Colors.black,
                                textSize: 16,
                                textDecoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Button(
                              text: 'View',
                              fontSize: 18,
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2022/07/Policy-Towards-Social-Commitment.pdf',
                              buttonWidth: 90,
                              borderRadius: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SmallText(
                                text: 'Green Policy',
                                textAlign: TextAlign.left,
                                textColor: Colors.black,
                                textSize: 16,
                                textDecoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Button(
                              text: 'View',
                              fontSize: 18,
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2022/07/Green-Policy.pdf',
                              buttonWidth: 90,
                              borderRadius: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SmallText(
                                text: 'Computer & Data Use\nPolicy',
                                textAlign: TextAlign.left,
                                textColor: Colors.black,
                                textSize: 16,
                                textDecoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Button(
                              text: 'View',
                              fontSize: 18,
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2022/07/Computer-and-Data-Use-Policy.pdf',
                              buttonWidth: 90,
                              borderRadius: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SmallText(
                                text: 'Anti Ragging Policy',
                                textAlign: TextAlign.left,
                                textColor: Colors.black,
                                textSize: 16,
                                textDecoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Button(
                              text: 'View',
                              fontSize: 18,
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2022/07/Anti-Ragging-Policy.pdf',
                              buttonWidth: 90,
                              borderRadius: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SmallText(
                                text: 'Anti-Sexual Harassment\nPolicy',
                                textAlign: TextAlign.left,
                                textColor: Colors.black,
                                textSize: 16,
                                textDecoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Button(
                              text: 'View',
                              fontSize: 18,
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2022/07/Anti-Harassment-Policy.pdf',
                              buttonWidth: 90,
                              borderRadius: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 70,
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SmallText(
                                text: 'E-Governance Policy',
                                textAlign: TextAlign.left,
                                textColor: Colors.black,
                                textSize: 16,
                                textDecoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Button(
                              text: 'View',
                              fontSize: 18,
                              url:
                                  'https://rmc.edu.in/wp-content/uploads/2022/09/E-Governance-Policy.pdf',
                              buttonWidth: 90,
                              borderRadius: 15,
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
