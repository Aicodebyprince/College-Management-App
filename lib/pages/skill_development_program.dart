// ignore_for_file: unused_local_variable
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/image_title.dart';
import 'package:princeproject/components/small_container.dart';
import 'package:princeproject/components/small_text.dart';

class SkillDevelopmentProgram extends StatelessWidget {
  const SkillDevelopmentProgram({super.key});

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
                  height: 180,
                  width: screenWidth * 0.95,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/skill_development/ict_academy.png',
                      ), // replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 950,
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Skill Development Program',
                        fontSize: 28,
                        underlineHeight: 4,
                        underlineTop: 35,
                        underlineWidth: 230,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: SmallText(
                        text:
                            'Reena Mehta College collaborates with ICT Academy to offer various skill development programs aimed at enhancing the employability and technical competencies of its students. While specific details about the programs offered through this collaboration are not extensively documented online, ICT Academy typically provides training in areas such as:',
                        textSize: 14,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: BulletedList(
                        style: TextStyle(
                          color: Color(0xFF545454),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        listItems: [
                          'Information and Communication Technology (ICT) Skills: Training in the latest ICT tools and technologies to keep students abreast of industry standards.',
                          'Soft Skills Development: Programs focusing on communication, teamwork, and leadership to prepare students for the corporate environment.',
                          'Faculty Development: Workshops and training sessions designed to enhance the teaching capabilities of faculty members, ensuring they can effectively impart current industry knowledge to students.',
                          'Entrepreneurship Development: Initiatives aimed at fostering entrepreneurial thinking and skills among students.',
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: SmallText(
                        text:
                            'These programs are part of ICT Academy’s broader mission to bridge the gap between industry and academia by equipping students and educators with relevant skills.',
                        textSize: 14,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: SmallText(
                        text:
                            'For detailed information on the specific programs available through the collaboration between Reena Mehta College and ICT Academy, it is advisable to contact us directly or visit our official website.',
                        textSize: 14,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15.0)),
              Container(
                height: 120,
                width: screenWidth * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                      'assets/skill_development/study_centre.png',
                    ),
                  ),
                ),
                child: Center(
                  child: ImageTitle(
                    text: 'Study Centre',
                    textSize: 34,
                    showUnderline: false,
                  ),
                ),
              ),
              BigContainer(
                height: 1200,
                width: screenWidth * 0.95,
                padding: EdgeInsets.only(top: 15),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SmallContainer(
                        height: 440,
                        width: screenWidth * 0.85,
                        padding: EdgeInsets.only(top: 0),
                        child: Column(
                          children: [
                            HeaderTitle(
                              text:
                                  'All India Early Childhood Care & Education',
                              underlineTop: 33,
                              underlineHeight: 4,
                              underlineWidth: 270,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 5.0,
                                right: 5.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 140,
                                    width: screenWidth * 0.40,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/skill_development/aiecce.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.40,
                                    child: SmallText(
                                      text:
                                          'AIECCE is a recognized organization dedicated to promoting quality education and care for early childhood. It focuses on training educators to nurture and develop foundational skills in young children, emphasizing holistic growth and learning.',
                                      textSize: 10.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            SmallText(
                              text:
                                  'Nursery Teacher’s Training (E.C.C.E.) Programs',
                              textSize: 14,
                            ),
                            BulletedList(
                              style: TextStyle(
                                color: Color(0xFF545454),
                                fontWeight: FontWeight.bold,
                                fontSize: 10.5,
                              ),
                              listItems: [
                                'Diploma in Child Education and Psychology (1 Year)',
                                'Advance Diploma in Child Education and Applied Psychology (2 Years)',
                                'Pre-Primary Teacher’s Training (Job-oriented self-employment course)',
                              ],
                            ),
                          ],
                        ),
                      ),
                      SmallContainer(
                        height: 380,
                        width: screenWidth * 0.85,
                        padding: EdgeInsets.only(top: 0),
                        child: Column(
                          children: [
                            HeaderTitle(
                              text: 'Singhania University',
                              underlineTop: 34,
                              underlineHeight: 4,
                              underlineWidth: 310,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 5.0,
                                right: 5.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 140,
                                    width: screenWidth * 0.40,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/skill_development/singhania_university.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.40,
                                    child: SmallText(
                                      text:
                                          'Singhania University, established by the Government of Rajasthan, is a prestigious institution offering a wide range of undergraduate and postgraduate programs. Known for its commitment to academic excellence, the university provides quality education and research opportunities across various disciplines.',
                                      textSize: 10.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            SmallText(text: 'Programs Offered', textSize: 14),
                            BulletedList(
                              style: TextStyle(
                                color: Color(0xFF545454),
                                fontWeight: FontWeight.bold,
                                fontSize: 10.5,
                              ),
                              listItems: [
                                'B.Sc. Fashion Design and Garment Management (3 Years)',
                                'Diploma in Fashion Design & Textile (1 Year)',
                              ],
                            ),
                          ],
                        ),
                      ),
                      SmallContainer(
                        height: 315,
                        width: screenWidth * 0.85,
                        padding: EdgeInsets.only(top: 0),
                        child: Column(
                          children: [
                            HeaderTitle(
                              text: 'Learner Support Centre',
                              underlineTop: 34,
                              underlineHeight: 4,
                              underlineWidth: 310,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 5.0,
                                right: 5.0,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: screenWidth * 0.40,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/skill_development/symbiosis.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.40,
                                        child: SmallText(
                                          text:
                                              'The Learner Support Centre for Symbiosis Centre for Distance Learning (SCDL) serves as a dedicated resource hub for students pursuing distance education',
                                          textSize: 10.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SmallText(
                                    text:
                                        'programs. Approved by AICTE, SCDL offers a wide range of postgraduate diplomas, certifications, and skill-oriented courses designed to meet industry demands. This center provides academic assistance, study materials, and guidance to ensure learners achieve their educational and career goals with flexibility and convenience.',
                                    textSize: 10.5,
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            SmallText(text: 'Programs Offered', textSize: 14),
                            BulletedList(
                              style: TextStyle(
                                color: Color(0xFF545454),
                                fontWeight: FontWeight.bold,
                                fontSize: 10.5,
                              ),
                              listItems: [
                                'Symbiosis Centre for Distance Learning approved by AICTE',
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
