// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, use_full_hex_values_for_flutter_colors
import 'package:flutter/material.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/auto_sliding_page_view.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/button.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/image_title.dart';
import 'package:princeproject/components/small_container.dart';
import 'package:princeproject/components/small_text.dart';
import 'package:princeproject/components/underline.dart';
import 'package:princeproject/pages/about_us.dart';
import 'package:url_launcher/url_launcher.dart'; // Importing url_launcher package

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appBar: const MyAppBar(),
      drawer: const MyDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: AutoSlidingPageView(), // Slider
              ),
              //👇Container Starts From Here👇
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    BigContainer(
                      width: screenWidth * 1,
                      height: 1940,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ), // Custom padding
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              //College Admission Links
                              const HeaderTitle(
                                text: 'College Admission Links',
                                underlineHeight: 5,
                                underlineWidth: 300,
                                underlineTop: 32,
                              ),
                              //“Find All The Necessary Admission Resources & Portals Here”
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                child: SmallText(
                                  text:
                                      '“Find All The Necessary Admission Resources & Portals Here”',
                                ),
                              ),
                              //Stream Codes For Junior College
                              const HeaderTitle(
                                text: 'Stream Codes For Junior College',
                                fontSize: 18,
                                underlineWidth: 330,
                                underlineHeight: 5,
                                underlineTop: 22,
                              ),
                              //ARTS: MU656AFE\nCOMMERCE: MU656CFE\nSCIENCE: MU656SPE
                              const SmallText(
                                text:
                                    'ARTS: MU656AFE\nCOMMERCE: MU656CFE\nSCIENCE: MU656SPE',
                                textSize: 14,
                              ),
                              Column(
                                children: [
                                  //FY. J.C. Admissions
                                  SmallContainer(
                                    height: 190,
                                    width: screenWidth * 1,
                                    padding: const EdgeInsets.all(10),
                                    child: const Column(
                                      children: [
                                        HeaderTitle(
                                          text: 'FY. J.C. Admissions',
                                          fontSize: 20,
                                          underlineTop: 24,
                                          underlineWidth: 300,
                                          underlineHeight: 4,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 300,
                                                child: SmallText(
                                                  text:
                                                      'Apply For First-Year Junior College (FY. J.C.) Admissions Online',
                                                  textSize: 16,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(15),
                                                child: Button(
                                                  text: 'Apply Now',
                                                  fontSize: 16,
                                                  url:
                                                      'https://enrollonline.co.in/Registration/Apply/RMCJR',
                                                  buttonHeight: 50,
                                                  buttonWidth: 135,
                                                  borderRadius: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //First-Year Under-Graduate Admissions
                                  SmallContainer(
                                    height: 330,
                                    width: screenWidth * 1,
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: 250,
                                          child: HeaderTitle(
                                            text:
                                                'First-Year Under-Graduate Admissions',
                                            fontSize: 20,
                                            underlineTop: 26,
                                            underlineWidth: 245,
                                            underlineHeight: 4,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 300,
                                                child: SmallText(
                                                  text:
                                                      'Admissions For Undergraduate Programs:- B.C.O.M., B.A., B.S.C., B.M.S., B.A.F., B.B.I., B.A.M.M.C., BSc. (Information Technology), BSc. (Data Science), BSc. (Hospitality Studies).',
                                                  textSize: 16,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(15),
                                                child: Button(
                                                  text: 'Apply Now',
                                                  fontSize: 16,
                                                  url:
                                                      'https://enrollonline.co.in/Registration/Apply/RMC',
                                                  buttonHeight: 50,
                                                  buttonWidth: 135,
                                                  borderRadius: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //University Of Mumbai Admission Links
                                  SmallContainer(
                                    height: 380,
                                    width: screenWidth * 1,
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: 250,
                                          child: HeaderTitle(
                                            text:
                                                'University Of Mumbai Admission Links',
                                            fontSize: 20,
                                            underlineTop: 26,
                                            underlineWidth: 200,
                                            underlineHeight: 4,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 300,
                                                child: SmallText(
                                                  text:
                                                      'For Under-Graduate Program Enrollment',
                                                  textSize: 16,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(15),
                                                child: Button(
                                                  text: 'Visit UG Portal',
                                                  fontSize: 16,
                                                  url:
                                                      'https://muugadmission.samarth.edu.in',
                                                  buttonHeight: 50,
                                                  buttonWidth: 167,
                                                  borderRadius: 15,
                                                ),
                                              ),
                                              Underline(
                                                underlineColor: Color.fromARGB(
                                                  150,
                                                  255,
                                                  0,
                                                  0,
                                                ),
                                                underlineWidth: 300,
                                                underlineHeight: 4,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 10,
                                                ),
                                                child: SizedBox(
                                                  width: 300,
                                                  child: SmallText(
                                                    text:
                                                        'For Post-Graduate Program Enrollment',
                                                    textSize: 16,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(15),
                                                child: Button(
                                                  text: 'Visit PG Portal',
                                                  fontSize: 16,
                                                  url:
                                                      'https://muadmission.samarth.edu.in',
                                                  buttonHeight: 50,
                                                  buttonWidth: 167,
                                                  borderRadius: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //In-House Students (SY. & TY.)
                                  SmallContainer(
                                    height: 250,
                                    width: screenWidth * 1,
                                    padding: const EdgeInsets.all(10),
                                    child: const Column(
                                      children: [
                                        HeaderTitle(
                                          text: 'In-House Students (SY. & TY.)',
                                          fontSize: 20,
                                          underlineTop: 25,
                                          underlineWidth: 300,
                                          underlineHeight: 4,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 300,
                                                child: SmallText(
                                                  text:
                                                      'For Second & Third-Year Student’s Login & Admission',
                                                  textSize: 16,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(15),
                                                child: Button(
                                                  text: 'Student Login',
                                                  fontSize: 16,
                                                  url:
                                                      'https://cimsstudent.mastersofterp.in/StudentLogin/Index',
                                                  buttonHeight: 50,
                                                  buttonWidth: 167,
                                                  borderRadius: 15,
                                                ),
                                              ),
                                              Button(
                                                text: 'New Admission',
                                                fontSize: 16,
                                                url:
                                                    'https://enrollonline.co.in/Registration/Apply/RMC',
                                                buttonHeight: 50,
                                                buttonWidth: 186,
                                                borderRadius: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //SY. J.C. Admissions
                                  SmallContainer(
                                    height: 220,
                                    width: screenWidth * 1,
                                    padding: const EdgeInsets.all(10),
                                    child: const Column(
                                      children: [
                                        HeaderTitle(
                                          text: 'SY. J.C. Admissions',
                                          fontSize: 20,
                                          underlineTop: 24,
                                          underlineWidth: 300,
                                          underlineHeight: 4,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 300,
                                                child: SmallText(
                                                  text:
                                                      'Second-Year Junior College Admissions For Arts, Science, & Commerce Sections',
                                                  textSize: 16,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(15),
                                                child: Button(
                                                  text: 'Apply Now',
                                                  fontSize: 16,
                                                  url:
                                                      'https://cimsstudentnewui.mastersofterp.in/StudentLogin/Index',
                                                  buttonHeight: 45,
                                                  buttonWidth: 135,
                                                  borderRadius: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  //Admission Queries
                                  SmallContainer(
                                    height: 222,
                                    width: screenWidth * 1,
                                    padding: const EdgeInsets.all(10),
                                    child: const Column(
                                      children: [
                                        HeaderTitle(
                                          text: 'Admission Queries',
                                          fontSize: 20,
                                          underlineTop: 24,
                                          underlineWidth: 300,
                                          underlineHeight: 4,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 300,
                                                child: SmallText(
                                                  text:
                                                      'For Any Admission-Related Queries, Contact Us At The Number Below',
                                                  textSize: 16,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(15),
                                                child: Button(
                                                  text: '+91 9372748944',
                                                  fontSize: 16,
                                                  url: 'tel:+91%209372748944',
                                                  buttonHeight: 45,
                                                  buttonWidth: 187,
                                                  borderRadius: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              //About Us
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 500,
                  width: screenWidth * 1,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/landing_page/college.png',
                      ), // replace with your image path
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        const ImageTitle(
                          text: 'About Us',
                          underlineWidth: 150,
                          underlineTop: 37,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: SizedBox(
                            width: 300,
                            child: SmallText(
                              text:
                                  'Reena Mehta College of Commerce and Management studies with Jeevan Jyot as its parent body was established in the year 2003 by the founder and chairperson Mrs. Reena Mehta.\n\nAt present the college conduct Bachelor of Commerce (Bcom), Bachelor of Arts (B.A), Bachelor of Banking and Insurance (B.B.I), Bachelor in Accounting and Finance (BAF), Bachelors of Mass Media (BMM), Bachelors of Science in Information Technology (BSc I.T) and Bachelors of Management Studies(BMS) Courses.',
                              textSize: 14,
                              textColor: Color(0xFFD9D9D9),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffdf00000),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AboutUs(),
                                  ),
                                ),
                            child: const Text(
                              'Read More',
                              style: TextStyle(
                                color: Color(0xFFD9D9D9),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Notices
              Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    height: 310,
                    width: screenWidth * 0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red,
                    ),
                    child: Column(
                      children: [
                        // Fixed Header
                        const HeaderTitle(
                          text: 'Notices',
                          fontSize: 28,
                          textColor: Color(0xFFD9D9D9),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // Your existing notice rows go here
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SmallText(
                                            text: 'Examination Notice AT-KT',
                                            textSize: 18,
                                            textColor: Color(0xFFD9D9D9),
                                            url:
                                                'https://rmc.edu.in/wp-content/uploads/2024/08/EXAM-NOTICE-ATKT-1-.pdf',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // Add more notice rows here...
                                // Example:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SmallText(
                                            text: 'Examination Student Notice',
                                            textSize: 18,
                                            textColor: Color(0xFFD9D9D9),
                                            url:
                                                'https://rmc.edu.in/wp-content/uploads/2024/08/EXAM-ATKT-NOTICE-.pdf',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 315,
                                            child: SmallText(
                                              text:
                                                  'Notice For Student Unauthorized Picnics & Parties',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Color(0xFFD9D9D9),
                                              url:
                                                  'https://rmc.edu.in/wp-content/uploads/2024/08/Unauthorized-Picnics-and-Parties-Notice.pdf',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SmallText(
                                            text:
                                                'Notice Sem III & V Internal Exam',
                                            textSize: 18,
                                            textColor: Color(0xFFD9D9D9),
                                            url:
                                                'https://rmc.edu.in/wp-content/uploads/2023/07/Notice-Sem-III-V-Internal-Exam.pdf',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SmallText(
                                            text: 'Extension Date Of ATKT',
                                            textSize: 18,
                                            textColor: Color(0xFFD9D9D9),
                                            url:
                                                'https://rmc.edu.in/wp-content/uploads/2022/09/Extension-Date-of-ATKT.pdf',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SmallText(
                                            text: 'Regarding ATKT Form Filling',
                                            textSize: 18,
                                            textColor: Color(0xFFD9D9D9),
                                            url:
                                                'https://rmc.edu.in/wp-content/uploads/2022/09/ATKT-Form-Filling-Notice.pdf',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SmallText(
                                            text: 'Merit List 2023-2024',
                                            textSize: 18,
                                            textColor: Color(0xFFD9D9D9),
                                            url:
                                                'https://rmc.edu.in/merit-list-2/',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 315,
                                            child: SmallText(
                                              text:
                                                  'Time-Table For S.Y. J.C. Science & S.Y. J.C. Commerce',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Color(0xFFD9D9D9),
                                              url:
                                                  'https://rmc.edu.in/wp-content/uploads/2021/07/MCQ-Time-Table-for-S.Y.J.C-Science-Commerce.pdf',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 315,
                                            child: SmallText(
                                              text:
                                                  'Check Here For Prospectus 2023-2024',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Color(0xFFD9D9D9),
                                              url:
                                                  'https://rmc.edu.in/wp-content/uploads/2023/06/RMC-Prospectus_New_compressed.pdf',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 315,
                                            child: SmallText(
                                              text:
                                                  'Click Here For New Admissions In S.Y. & T.Y. For A.Y. 2021-2022',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Color(0xFFD9D9D9),
                                              url:
                                                  'https://enrollonline.co.in/Registration/Apply/RMC',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 315,
                                            child: SmallText(
                                              text:
                                                  'Click Here For In-House Students In S.Y. & T.Y. For A.Y. 2021-2022',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Color(0xFFD9D9D9),
                                              url:
                                                  'https://cimsstudent.mastersofterp.in/',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 315,
                                            child: SmallText(
                                              text:
                                                  'Examination Notice For AT-KT 2021-2022',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Color(0xFFD9D9D9),
                                              url:
                                                  'https://rmc.edu.in/wp-content/uploads/2021/09/Examination-Notice-for-ATKT-2021-22.pdf',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SmallText(
                                            text:
                                                'Examination Notice For T.Y. AT-KT',
                                            textSize: 18,
                                            textColor: Color(0xFFD9D9D9),
                                            url:
                                                'https://rmc.edu.in/wp-content/uploads/2021/09/Examination-Notice-for-TYs-ATKT.pdf',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 315,
                                            child: SmallText(
                                              text:
                                                  'F.Y. SEM - I AT-KT Exam Time-Table (October-2021)',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Color(0xFFD9D9D9),
                                              url:
                                                  'https://rmc.edu.in/wp-content/uploads/2021/09/First-Year-Sem-I-ATKT-Tim-Table-October-2021.pdf',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 315,
                                            child: SmallText(
                                              text:
                                                  'F.Y. SEM II - AT-KT Exam Time-Table (October-2021)',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Color(0xFFD9D9D9),
                                              url:
                                                  'https://rmc.edu.in/wp-content/uploads/2021/09/First-Year-Sem-II-ATKT-Time-Table-October-2021.pdf',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SmallText(
                                            text:
                                                'Sem V - AT-KT Exam Time-Table',
                                            textSize: 18,
                                            textColor: Color(0xFFD9D9D9),
                                            url:
                                                'https://rmc.edu.in/wp-content/uploads/2021/05/SEM-V-ATKT.pdf',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 315,
                                            child: SmallText(
                                              text:
                                                  'SEM VI - External Examination Regular & AT-KT',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Color(0xFFD9D9D9),
                                              url:
                                                  'https://rmc.edu.in/wp-content/uploads/2021/04/SEM-6-EXAM-timetable1.pdf',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SmallText(
                                            text:
                                                'SEM I - Regular Examination AT-KT',
                                            textSize: 18,
                                            textColor: Color(0xFFD9D9D9),
                                            url:
                                                'https://rmc.edu.in/wp-content/uploads/2021/04/SEM-I-Regular-Examination-ATKT.pdf',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 315,
                                            child: SmallText(
                                              text:
                                                  'SEM II - External Examination Regular & AT-KT',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Color(0xFFD9D9D9),
                                              url:
                                                  'https://rmc.edu.in/wp-content/uploads/2021/04/SEM-II-External-Examination-Regular-ATKT.pdf',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SmallText(
                                            text:
                                                'SEM III - Regular Examination AT-KT',
                                            textSize: 18,
                                            textColor: Color(0xFFD9D9D9),
                                            url:
                                                'https://rmc.edu.in/wp-content/uploads/2021/04/SEM-III-External-Examination-ATKT.pdf',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 315,
                                            child: SmallText(
                                              text:
                                                  'SEM IV - External Examination Regular & AT-KT',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Color(0xFFD9D9D9),
                                              url:
                                                  'https://rmc.edu.in/wp-content/uploads/2021/04/SEM-IV-External-Examination-Regular-ATKT.pdf',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 315,
                                            child: SmallText(
                                              text:
                                                  'SEM II, IV, & VI - Internal Examination (February-2021)',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Color(0xFFD9D9D9),
                                              url:
                                                  'https://rmc.edu.in/wp-content/uploads/2021/02/timetable-compressed.pdf',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 315,
                                            child: SmallText(
                                              text:
                                                  'SEM II, IV, & VI - Class Time-Table',
                                              textSize: 18,
                                              textColor: Color(0xFFD9D9D9),
                                              url:
                                                  'https://rmc.edu.in/wp-content/uploads/2021/01/class-timetable.pdf',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SmallText(
                                            text: 'Academic Calendar 2019-2020',
                                            textSize: 18,
                                            textColor: Color(0xFFD9D9D9),
                                            url:
                                                'https://rmc.edu.in/wp-content/uploads/2020/12/ACADEMIC-calendar19-20.pdf',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SmallText(
                                            text:
                                                'Balance Fees Payment For 2020-2021',
                                            textSize: 18,
                                            textAlign: TextAlign.left,
                                            textColor: Color(0xFFD9D9D9),
                                            url:
                                                'https://rmc.edu.in/balance-fees-payment-for-2020-2021/',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 310,
                                            child: SmallText(
                                              text:
                                                  'Admissions Have Started For M.C.O.M. Part I & M.C.O.M. Part II For The Academic Year 2020-2021',
                                              textAlign: TextAlign.left,
                                              textSize: 18,
                                              textColor: Color(0xFFD9D9D9),
                                              url:
                                                  'https://rmc.edu.in/wp-content/uploads/2021/02/timetable-compressed.pdf',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SmallText(
                                            text:
                                                'SEM II, IV, & VI - Class Time-Table',
                                            textSize: 18,
                                            textColor: Color(0xFFD9D9D9),
                                            url:
                                                'https://rmc.edu.in/wp-content/uploads/2021/01/class-timetable.pdf',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // Continue adding more notices...
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            '• ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          SmallText(
                                            text: 'Academic Calendar 2019-2020',
                                            textSize: 18,
                                            textColor: Color(0xFFD9D9D9),
                                            url:
                                                'https://rmc.edu.in/wp-content/uploads/2020/12/ACADEMIC-calendar19-20.pdf',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Fixed Footer
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 15),
                          child: SmallText(
                            text: '↓ Scroll To View More ↓',
                            textColor: Colors.black,
                            textSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //Board Of Trustees
              const HeaderTitle(
                text: 'Board Of Trustees',
                underlineTop: 32,
                underlineHeight: 5,
                underlineWidth: 200,
              ),
              Container(
                height: 360,
                width: screenWidth * 0.95,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/landing_page/board_of_trustees.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/landing_page/mrs_reena_mehta.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SmallText(
                                text:
                                    'Mrs. Reena Mehta\nHon. Founder & Chairperson\nreenamehta@rmc.edu.in',
                                textColor: Color(0xFFD9D9D9),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/landing_page/mr_narendra_mehta.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SmallText(
                                text:
                                    'Mrs. Reena Mehta\nHon. Founder & Chairperson\nreenamehta@rmc.edu.in',
                                textColor: Color(0xFFD9D9D9),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/landing_page/dr_sunny_mehta.png',
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SmallText(
                            text:
                                'Dr. Sunny Mehta\nHon. Trustee / Treasurer\nsunnymehta@rmc.edu.in',
                            textColor: Color(0xFFD9D9D9),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Principal's Message
              const HeaderTitle(
                text: "Principal's Message",
                underlineTop: 32,
                underlineHeight: 4,
                underlineWidth: 220,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 150,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/landing_page/dr_mrs_satinder_kaur_gujral.png',
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  const Column(
                    children: [
                      SmallText(
                        text:
                            'Dr.(Mrs.) Satinder Kaur Gujral\nPrincipal drgujral@rmc.edu.in\n',
                        textColor: Colors.black,
                        textSize: 14,
                      ),
                      SizedBox(
                        width: 195,
                        child: SmallText(
                          text:
                              '“Reena Mehta Degree College was founded in 2003 by a dynamic personality Ms. Reena Mehta with the aim to provide value based education which help in creating progressive and positive citizens.”',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 6, right: 6),
                child: SizedBox(
                  width: 350,
                  child: SmallText(
                    text:
                        'Our College strongly adheres to the philosophy of its founder, Ms. Reena Mehta who believed that true education ought to focus primarily on disciplining the mind, body and the spirit. I believe that in order to be successful in this competitive world and face the emerging challenges of the future” is of utmost importance and that is what Reena Mehta College intends to provide to the students.',
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Container(
                height: 550,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Color(0xFFDF0000),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Contact Us',
                        fontSize: 30,
                        textColor: Color(0xFFD9D9D9),
                        underlineColor: Color(0xFFD9D9D9),
                        underlineWidth: 150,
                        underlineTop: 40,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: SmallText(
                          text: 'Reena Mehta College',
                          textSize: 20,
                          textColor: Color(0xFFD9D9D9),
                        ),
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: SmallText(
                              text: 'Address:-',
                              textSize: 20,
                              textColor: Color(0xFFD9D9D9),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 6),
                            child: SmallText(
                              text:
                                  '@2025 | 150 FT, Road Opposite\nMaxus Mall, Bhayander West,\nThane, 401 101',
                              textAlign: TextAlign.right,
                              textSize: 16,
                              fontWeight: FontWeight.normal,
                              textColor: Color(0xFFD9D9D9),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: SmallText(
                              text: 'Phone No.:-',
                              textSize: 20,
                              textColor: Color(0xFFD9D9D9),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 6),
                            child: Row(
                              children: [
                                SmallText(
                                  url: 'tel:022 2817 6264',
                                  text: '022 2817 6264',
                                  textAlign: TextAlign.right,
                                  textSize: 16,
                                  fontWeight: FontWeight.normal,
                                  textColor: Color(0xFFD9D9D9),
                                ),
                                SmallText(
                                  text: ' / ',
                                  textSize: 16,
                                  textColor: Color(0xFFD9D9D9),
                                ),
                                SmallText(
                                  url: 'tel:022 2817 6266',
                                  text: '66',
                                  textAlign: TextAlign.right,
                                  textSize: 16,
                                  fontWeight: FontWeight.normal,
                                  textColor: Color(0xFFD9D9D9),
                                ),
                                SmallText(
                                  text: ' / ',
                                  textSize: 16,
                                  textColor: Color(0xFFD9D9D9),
                                ),
                                SmallText(
                                  url: 'tel:022 2817 6268',
                                  text: '68',
                                  textAlign: TextAlign.right,
                                  textSize: 16,
                                  fontWeight: FontWeight.normal,
                                  textColor: Color(0xFFD9D9D9),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: SmallText(
                              text: 'Junior College:-',
                              textSize: 20,
                              textColor: Color(0xFFD9D9D9),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 6),
                            child: SmallText(
                              url: 'mailto:juniorcollege@rmc.edu.in',
                              text: 'juniorcollege@rmc.edu.in',
                              textAlign: TextAlign.right,
                              textSize: 16,
                              fontWeight: FontWeight.normal,
                              textColor: Color(0xFFD9D9D9),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: SmallText(
                              text: 'Enquiry:-',
                              textSize: 20,
                              textColor: Color(0xFFD9D9D9),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 6),
                            child: SmallText(
                              url: 'mailto:enquiry@rmc.edu.in',
                              text: 'enquiry@rmc.edu.in',
                              textAlign: TextAlign.right,
                              textSize: 16,
                              fontWeight: FontWeight.normal,
                              textColor: Color(0xFFD9D9D9),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: SmallText(
                              text: 'Fax:-',
                              textSize: 20,
                              textColor: Color(0xFFD9D9D9),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 6),
                            child: SmallText(
                              url: 'tel:+91%202228189661',
                              text: '+91 22 2818 9661',
                              textAlign: TextAlign.right,
                              textSize: 16,
                              fontWeight: FontWeight.normal,
                              textColor: Color(0xFFD9D9D9),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const HeaderTitle(
                      text: 'Follow Us On',
                      fontSize: 24,
                      textColor: Color(0xFFD9D9D9),
                      underlineColor: Color(0xFFD9D9D9),
                      underlineWidth: 200,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            launchUrl(
                              Uri.parse(
                                'https://www.facebook.com/reenamehtacollege/',
                              ),
                            );
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/landing_page/facebook.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrl(
                              Uri.parse('https://www.instagram.com/rmc_india/'),
                            );
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/landing_page/instagram.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse('https://x.com/RMCINDIA/'));
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/landing_page/twitter.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrl(
                              Uri.parse(
                                'https://in.linkedin.com/school/reena-mehta-college/',
                              ),
                            );
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/landing_page/linkedin.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        launchUrl(
                          Uri.parse(
                            'https://www.youtube.com/@reenamehtacollege',
                          ),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/landing_page/youtube.png',
                            ),
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
      ),
    );
  }
}
