// ignore_for_file: unused_local_variable

import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/button.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/small_container.dart';
import 'package:princeproject/components/small_text.dart';
import 'package:flutter/material.dart';

class RTI extends StatelessWidget {
  const RTI({super.key});

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
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Container(
                  height: 225,
                  width: screenWidth * 0.95,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/rti/rti.png',
                      ), // replace with your image path
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                BigContainer(
                  height: 1125,
                  width: screenWidth * 0.95,
                  padding: const EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        HeaderTitle(
                          text: 'Right To Information Act',
                          underlineWidth: screenWidth * 0.8,
                          underlineTop: 31,
                        ),
                        SizedBox(
                          width: screenWidth * 0.9,
                          child: const SmallText(
                            text:
                                'Bringing Information to the Citizens: Right to Information Act 2005 mandates timely response to citizen requests for government information. It is an initiative taken by Department of Personnel and Training, Ministry of Personnel, Public Grievances and Pensions to provide a– RTI Portal Gateway to the citizens for quick search of information on the details of first Appellate Authorities, PIOs etc. amongst others, besides access to RTI related information / disclosures published on the web by various Public Authorities under the government of India as well as the State Governments.',
                            textAlign: TextAlign.left,
                            textColor: Colors.black,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Container(
                                height: 100,
                                width: screenWidth * 0.44,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/rti/rti1.png',
                                    ), // replace with your image path
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.44,
                              child: const SmallText(
                                text:
                                    'The Right to Information Act, 2005 (22 of 2005) has been enacted by the Parliament and has come into force from 15 June, 2005.',
                                textAlign: TextAlign.left,
                                textColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: SizedBox(
                            width: screenWidth * 0.9,
                            child: const SmallText(
                              text:
                                  'This Act provides for right to information for citizens to secure access to information under the control of public authorities in order to promote transparency and accountability in the working of every public authority. All Universities and Colleges established by law made by Parliament or by State Legislature or by notification by the appropriate Government or owned, controlled or substantially financed directly or indirectly by funds provided by the Government shall come within the meaning of a Public Authority under this Act.',
                              textAlign: TextAlign.left,
                              textColor: Colors.black,
                            ),
                          ),
                        ),
                        SmallContainer(
                          height: 580,
                          width: screenWidth * 0.9,
                          boxColor: const Color(0xFFFF5757),
                          padding: const EdgeInsets.only(top: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              children: [
                                const SmallText(
                                  text: 'For More Information',
                                  textSize: 28,
                                  textColor: Color(0xFFD9D9D9),
                                  textAlign: TextAlign.center,
                                ),
                                SmallContainer(
                                  height: 120,
                                  width: screenWidth * 0.8,
                                  padding: const EdgeInsets.only(top: 15),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SmallText(
                                        text:
                                            'RTI Website of Government of India',
                                        textColor: Colors.black,
                                        textSize: 18,
                                        textAlign: TextAlign.center,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Button(
                                          text: 'Visit',
                                          fontSize: 18,
                                          url: 'https://rti.gov.in',
                                          textColor: Color(0xFFD9D9D9),
                                          buttonColor: Color(0xFFFF5757),
                                          borderRadius: 15,
                                          buttonHeight: 40,
                                          buttonWidth: 90,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SmallContainer(
                                  height: 70,
                                  width: screenWidth * 0.8,
                                  padding: const EdgeInsets.only(top: 15),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 18.0,
                                        right: 18.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SmallText(
                                            text: 'UGC’s RTI',
                                            textColor: Colors.black,
                                            textSize: 18,
                                            textAlign: TextAlign.center,
                                          ),
                                          Button(
                                            text: 'Visit',
                                            fontSize: 18,
                                            url:
                                                'https://www.ugc.ac.in/subpage/rti-act.aspx',
                                            textColor: Color(0xFFD9D9D9),
                                            buttonColor: Color(0xFFFF5757),
                                            borderRadius: 15,
                                            buttonHeight: 40,
                                            buttonWidth: 90,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SmallContainer(
                                  height: 100,
                                  width: screenWidth * 0.8,
                                  padding: const EdgeInsets.only(top: 15),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SmallText(
                                        text:
                                            'महाराष्ट्र शासनाचे अधिकृ त संके तस्थळ',
                                        textColor: Colors.black,
                                        textSize: 18,
                                        textAlign: TextAlign.center,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Button(
                                          text: 'Visit',
                                          fontSize: 18,
                                          url:
                                              'https://rti.maharashtra.gov.in/index.action',
                                          textColor: Color(0xFFD9D9D9),
                                          buttonColor: Color(0xFFFF5757),
                                          borderRadius: 15,
                                          buttonHeight: 40,
                                          buttonWidth: 90,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: SmallText(
                                    text: 'Information Officer',
                                    textColor: Color(0xFFD9D9D9),
                                    textSize: 22,
                                  ),
                                ),
                                const SmallText(
                                  text: 'Premkumar Narayanan',
                                  textColor: Colors.black,
                                  textSize: 14,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: SmallText(
                                    text: 'Assistant Information Officer',
                                    textColor: Color(0xFFD9D9D9),
                                    textSize: 22,
                                  ),
                                ),
                                const SmallText(
                                  text: 'Mrs. Urmila Chauhan',
                                  textColor: Colors.black,
                                  textSize: 14,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: SmallText(
                                    text: 'Appellate Authority',
                                    textColor: Color(0xFFD9D9D9),
                                    textSize: 22,
                                  ),
                                ),
                                const SmallText(
                                  text: 'Dr. Satinder Kaur Gujral, Principal',
                                  textColor: Colors.black,
                                  textSize: 14,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
