// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:princeproject/components/button.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/small_container.dart';
import 'package:princeproject/pages/awards_of_principal.dart';
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/small_text.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var nameController = TextEditingController();
    var emailController = TextEditingController(); // New controller for email
    var queryController = TextEditingController(); // New controller for queries
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appBar: const MyAppBar(),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Container(
                height: 225,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/slider/slider10.png',
                    ), // replace with your image path
                    fit: BoxFit.fill,
                  ),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Reena Mehta College',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFFD9D9D9),
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(offset: Offset(2, 2), blurRadius: 2),
                        ],
                      ),
                    ),
                    Text(
                      'Enter To Learn. Leave To Succeed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1,
                        fontSize: 16,
                        color: Color(0xFFD9D9D9),
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(offset: Offset(2, 2), blurRadius: 2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: HeaderTitle(
                text: 'About Us',
                fontSize: 32,
                underlineTop: 37,
                underlineHeight: 5,
                underlineWidth: 140,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: SmallText(
                text:
                    'Reena Mehta College of Commerce and Management Studies, with Jeevan Jyot as its parent body, was established in 2003 by the founder and chairperson, Mrs. Reena Mehta.\n\nAt present, the college conducts Bachelor of Commerce (B.Com), Bachelor of Arts (B.A), Bachelor of Science (B.Sc), Bachelor of Banking and Insurance (B.B.I), Bachelor in Accounting and Finance (B.A.F), Bachelor of Mass Media (B.M.M), Bachelor of Science in Information Technology (B.Sc I.T), Bachelor of Science in Data Science (B.Sc D.S), Bachelor of Management Studies (B.M.S), and Hotel Management courses. All the courses offered are affiliated with the University of Mumbai. Reena Mehta College focuses on providing “Holistic” and “Quality” education to individual students.',
                textSize: 13,
                textAlign: TextAlign.left,
                textColor: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
              child: Container(
                height: 225,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/about_us/about_us.png',
                    ), // replace with your image path
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0, left: 15, right: 15),
              child: SmallText(
                text:
                    'We are committed to providing students with the necessary environment and support for their career planning and advancement. While ensuring academic and co-curricular facilities, we are also conscious of our role as constructive and responsible contributors to the larger society.\n\nAt Reena Mehta College, we believe that teaching is the art of simplifying knowledge and information without diluting its essence. Our dedicated faculty nurtures the aspirations of our young students to excel academically while laying the foundation for lifelong learning.',
                textSize: 13,
                textAlign: TextAlign.left,
                textColor: Colors.black,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0, left: 15, right: 15),
              child: Column(
                children: [
                  SmallText(
                    text:
                        'To make learning interesting and comprehensive, the college has been developing innovative teaching methods, such as:',
                    textSize: 13,
                    textAlign: TextAlign.left,
                    textColor: Colors.black,
                  ),
                  SmallText(
                    text:
                        '\n• Presentations, discussions, and classroom debates\n• Organizing guest lectures for the benefit of students\n• Conducting audio-visual lectures',
                    textSize: 13,
                    textAlign: TextAlign.left,
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Container(
                    height: 225,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/about_us/our_history.png',
                        ), // replace with your image path
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: const Text(
                      'Our History',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFFD9D9D9),
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(offset: Offset(2, 2), blurRadius: 2),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: SmallText(
                    text:
                        'Affiliated with the University of Mumbai, we offer a diverse range of undergraduate and postgraduate programs across various disciplines, including Arts, Commerce, Science, Management, and specialized fields such as Hotel Management and Fashion Education.',
                    textSize: 13,
                    textAlign: TextAlign.left,
                    textColor: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 120,
                        width: screenWidth * 0.45,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/about_us/our_history1.png',
                            ), // replace with your image path
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: screenWidth * 0.45,
                        child: SmallText(
                          text:
                              'Since our inception, we have been dedicated to providing holistic and quality education, focusing on the comprehensive development of our students.',
                          textSize: 13,
                          textAlign: TextAlign.left,
                          textColor: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: SmallText(
                    text:
                        'We emphasize not only academic excellence but also the cultivation of ethical values and cultural awareness, aiming to prepare students to serve society effectively. Our mission includes motivating students to foster environmental and social harmony, promoting equality,',
                    textSize: 13,
                    textAlign: TextAlign.left,
                    textColor: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: screenWidth * 0.45,
                        child: SmallText(
                          text:
                              'and facilitating holistic In addition to academic programs, we offer various facilities and extracurricular activities, including a',
                          textSize: 13,
                          textAlign: TextAlign.left,
                          textColor: Colors.black,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 100,
                        width: screenWidth * 0.45,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/about_us/our_history2.png',
                            ), // replace with your image path
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: SmallText(
                    text:
                        'well-equipped library with internet access, computer laboratories, industrial visits, and activities like social services, yoga, dance, and music. Extra coaching is also provided for slow learners, ensuring that every student receives the support they need to succeed. Over the years, we have established ourselves as a leading institution in higher education, committed to developing the knowledge, skills, and character of our students, thereby creating an environment conducive to academic and professional excellence.',
                    textSize: 13,
                    textAlign: TextAlign.left,
                    textColor: Colors.black,
                  ),
                ),
              ],
            ),
            const HeaderTitle(
              text: 'Our Facilities',
              fontSize: 32,
              underlineTop: 42,
              underlineHeight: 5,
              underlineWidth: 200,
            ),
            BigContainer(
              height: 790,
              width: screenWidth * 1,
              color: const Color(0xFFFF5757),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: screenHeight * 0.15,
                              width: screenWidth * 0.44,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/about_us/our_facilities.png',
                                  ), // replace with your image path
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: SmallText(
                                  text: 'Well-Equipped\nLibrary',
                                  textColor: Color(0xFFD9D9D9),
                                  textSize: 22,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.44,
                              child: SmallText(
                                text:
                                    'Offers a wide collection of books and resources to support academic excellence and self-learning.',
                                textSize: 15,
                                textAlign: TextAlign.center,
                                textColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.44,
                              child: SmallText(
                                text:
                                    'Equipped with modern systems to facilitate hands-on learning in technology and programming.',
                                textSize: 15,
                                textAlign: TextAlign.center,
                                textColor: Colors.black,
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.15,
                              width: screenWidth * 0.44,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/about_us/our_facilities1.png',
                                  ), // replace with your image path
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: SmallText(
                                  text: 'Computer\nLaboratary',
                                  textColor: Color(0xFFD9D9D9),
                                  textSize: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: screenHeight * 0.15,
                              width: screenWidth * 0.44,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/about_us/our_facilities2.png',
                                  ), // replace with your image path
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: SmallText(
                                  text: 'Industrial\nVisit',
                                  textColor: Color(0xFFD9D9D9),
                                  textSize: 22,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.44,
                              child: SmallText(
                                text:
                                    'Provides students with practical exposure to industry operations and processes.',
                                textSize: 15,
                                textAlign: TextAlign.center,
                                textColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.44,
                              child: SmallText(
                                text:
                                    'Tailored sessions to help students strengthen their understanding and improve academically.',
                                textSize: 15,
                                textAlign: TextAlign.center,
                                textColor: Colors.black,
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.15,
                              width: screenWidth * 0.44,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/about_us/our_facilities3.png',
                                  ), // replace with your image path
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: const Align(
                                alignment: Alignment.center,
                                child: SmallText(
                                  text: 'Extra Coaching\nSessions',
                                  textColor: Color(0xFFD9D9D9),
                                  textSize: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            HeaderTitle(
              text: 'Mission & Vision',
              fontSize: 32,
              underlineTop: 45,
              underlineHeight: 5,
              underlineWidth: screenWidth * 0.70,
            ),
            BigContainer(
              height: 500,
              width: screenWidth * 0.95,
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: HeaderTitle(
                      text: 'Mission',
                      fontSize: 32,
                      textColor: Colors.black,
                      underlineTop: 40,
                      underlineHeight: 4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: SmallText(
                      text:
                          'The aim is to build students who are ethically, academically, and culturally aware, empowering them to serve society while fostering a sense of responsibility. This includes motivating them to promote environmental and social harmony, ensuring they contribute positively to the community. Additionally, the focus is on enhancing equality and fostering holistic development to create well-rounded individuals equipped to address societal challenges effectively.',
                      textColor: Colors.black,
                      textSize: 15,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: HeaderTitle(
                      text: 'Vision',
                      fontSize: 32,
                      textColor: Colors.black,
                      underlineTop: 36,
                      underlineHeight: 4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: SmallText(
                      text:
                          'To develop the knowledge, skills and character of our students which will help us in creating and sustaining an environment conducive to academic and professional excellence.',
                      textColor: Colors.black,
                      textSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            HeaderTitle(
              text: 'Choose Your Faculty',
              textColor: Colors.black,
              fontSize: 32,
              underlineTop: 41,
              underlineHeight: 5,
              underlineWidth: screenWidth * 0.95,
            ),
            SmallText(text: '5 Offering Faculties', textSize: 16),
            BigContainer(
              height: 1980,
              width: screenWidth * 0.95,
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        SmallContainer(
                          height: screenHeight * 0.31,
                          width: screenWidth * 0.9,
                          padding: EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: SmallText(
                                  text: 'Faculty Of Arts',
                                  textSize: 28,
                                  textColor: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: screenHeight * 0.20,
                                      width: screenWidth * 0.4,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/about_us/arts.png',
                                          ), // replace with your image path
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.45,
                                      child: Column(
                                        children: [
                                          SmallText(
                                            text:
                                                '‣ Enriching creative and cultural perspectives\n‣ Encouraging critical and analytical thinking\n‣ Programs: B.A., B.A.M.M.C.',
                                            textSize: 14,
                                            fontWeight: FontWeight.bold,
                                            textAlign: TextAlign.center,
                                            textColor: Colors.black,
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
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SmallContainer(
                            height: screenHeight * 0.31,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 5),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: SmallText(
                                    text: 'Faculty Of Commerce',
                                    textSize: 28,
                                    textColor: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: screenHeight * 0.20,
                                        width: screenWidth * 0.4,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/about_us/commerce.png',
                                            ), // replace with your image path
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.45,
                                        child: Column(
                                          children: [
                                            SmallText(
                                              text:
                                                  '‣ Fostering financial and business acumen\n‣ Preparing students for dynamic industries\n‣ Programs: B.Com., M.Com.',
                                              textSize: 14,
                                              fontWeight: FontWeight.bold,
                                              textAlign: TextAlign.center,
                                              textColor: Colors.black,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SmallContainer(
                            height: screenHeight * 0.31,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 5),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: SmallText(
                                    text: 'Faculty Of Science',
                                    textSize: 28,
                                    textColor: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: screenHeight * 0.20,
                                        width: screenWidth * 0.4,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/about_us/science.png',
                                            ), // replace with your image path
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.45,
                                        child: Column(
                                          children: [
                                            SmallText(
                                              text:
                                                  '‣ Promoting scientific inquiry and innovation\n‣ Equipping students with technical expertise\n‣ Programs: B.Sc., M.Sc.',
                                              textSize: 14,
                                              fontWeight: FontWeight.bold,
                                              textAlign: TextAlign.center,
                                              textColor: Colors.black,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SmallContainer(
                            height: screenHeight * 0.34,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 5),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: SmallText(
                                    text: 'Faculty Of Management',
                                    textSize: 28,
                                    textColor: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: screenHeight * 0.20,
                                        width: screenWidth * 0.4,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/about_us/management.png',
                                            ), // replace with your image path
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.45,
                                        child: Column(
                                          children: [
                                            SmallText(
                                              text:
                                                  '‣ Building leadership and organizational skills\n‣ Nurturing entrepreneurial and managerial abilities\n‣ Programs: B.M.S., M.M.S.',
                                              textSize: 14,
                                              fontWeight: FontWeight.bold,
                                              textAlign: TextAlign.center,
                                              textColor: Colors.black,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SmallContainer(
                            height: screenHeight * 0.39,
                            width: screenWidth * 0.9,
                            padding: EdgeInsets.only(top: 5),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: SmallText(
                                    text: 'Faculty Of Information Technology',
                                    textSize: 28,
                                    textColor: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: screenHeight * 0.20,
                                        width: screenWidth * 0.4,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/about_us/information_technology.png',
                                            ), // replace with your image path
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.45,
                                        child: Column(
                                          children: [
                                            SmallText(
                                              text:
                                                  '‣ Developing technological proficiency\n‣ Preparing students for IT-driven careers\n‣ Programs: B.Sc. I.T., M.Sc. I.T.',
                                              textSize: 14,
                                              fontWeight: FontWeight.bold,
                                              textAlign: TextAlign.center,
                                              textColor: Colors.black,
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BigContainer(
              height: 500,
              width: screenWidth * 0.95,
              color: Color(0xFFFF3131),
              padding: EdgeInsets.only(top: 15),
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  children: [
                    SmallText(
                      text:
                          'Write Your Contact Data & We’ll Get In Touch With You',
                      textSize: 28,
                      fontWeight: FontWeight.bold,
                      textColor: Color(0xFFD9D9D9),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                        height: screenHeight * 0.08,
                        width: screenWidth * 0.85,
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            fillColor: Color(0xFFD9D9D9),
                            filled: true,
                            hintText: 'Your Name:',
                            hintStyle: TextStyle(fontSize: 18),
                            labelText: 'Name',
                            labelStyle: TextStyle(fontSize: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                        height: screenHeight * 0.08,
                        width: screenWidth * 0.85,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            fillColor: Color(0xFFD9D9D9),
                            filled: true,
                            hintText: 'Your Email:',
                            hintStyle: TextStyle(fontSize: 18),
                            labelText: 'Email',
                            labelStyle: TextStyle(fontSize: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                        height: screenHeight * 0.08,
                        width: screenWidth * 0.85,
                        child: TextField(
                          controller: queryController,
                          decoration: InputDecoration(
                            fillColor: Color(0xFFD9D9D9),
                            filled: true,
                            hintText: 'Your Query:',
                            hintStyle: TextStyle(fontSize: 18),
                            labelText: 'Queries',
                            labelStyle: TextStyle(fontSize: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Button(
                        text: 'Submit',
                        onPressed:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AwardsOfPrincipal(),
                              ),
                            ),
                        textColor: Color(0xFFD9D9D9),
                        fontSize: 20,
                        borderRadius: 15,
                        buttonHeight: 50,
                        buttonWidth: 120,
                        buttonColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
          ],
        ),
      ),
    );
  }
}
