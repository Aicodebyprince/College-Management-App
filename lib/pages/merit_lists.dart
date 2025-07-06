// ignore_for_file: unused_local_variable
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/button.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/small_container.dart';
import 'package:princeproject/components/small_text.dart';
import 'package:flutter/material.dart';

class MeritLists extends StatelessWidget {
  const MeritLists({super.key});

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
                        'assets/merit_list/merit.png',
                      ), // replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 6885,
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Merit List',
                        fontSize: 28,
                        underlineHeight: 4,
                        underlineTop: 35,
                        underlineWidth: 250,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: SmallText(
                        text:
                            'Merit List for the Academic Year 2024 – 2025 for First Year Admissions',
                        textSize: 16,
                        textColor: Colors.black,
                      ),
                    ),
                    SmallContainer(
                      height: 335,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: [
                          HeaderTitle(
                            text: 'Faculty Of Arts',
                            showUnderline: false,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/ba.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SmallText(
                                    text: 'Programs',
                                    textSize: 20,
                                    textColor: Colors.black,
                                  ),
                                  SmallText(
                                    text: 'Bachelor Of Arts (B.A.)',
                                    textSize: 18,
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FY-BA.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FYBA.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bammc.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Arts In Multimedia And Mass Communication (B.A.M.M.C.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FY-BAMMC.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FYBAMMC.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 600,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 15.0),
                      child: Column(
                        children: [
                          HeaderTitle(
                            text: 'Faculty Of Commerce',
                            showUnderline: false,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bcom.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SmallText(
                                    text: 'Programs',
                                    textSize: 20,
                                    textColor: Colors.black,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text: 'Bachelor Of Commerce (B.C.O.M.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FY-BCOM.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FYBCOM.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/baf.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Commerce In Accounting And Finance (B.A.F.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FY-BAF.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FYBAF.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bammc.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Commerce In Management Studies (B.M.S.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FY-BCOMManagement-Studies.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FYBCOMManagement-Studies.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bbi.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Commerce In Banking And Insurance (B.B.I.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FY-BBI.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FYBBI.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 580,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 15.0),
                      child: Column(
                        children: [
                          HeaderTitle(
                            text: 'Faculty Of Science',
                            showUnderline: false,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bsc.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SmallText(
                                    text: 'Programs',
                                    textSize: 20,
                                    textColor: Colors.black,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text: 'Bachelor Of Science (BSc.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FY-BSc.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FYBSC.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bschs.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Science In Hospitality Studies (BSc.H.S.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FY-HOSPITLITY-STUDIES.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FYBScHospitality-Studies.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bscds.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Science In Data Science (BSc.D.S.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FY-BScData-Science.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FYBSCData-Science.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bscit.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Science In Information Technology (BSc.I.T.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FY-BScIT.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2024/06/FYBSCIT.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: SmallText(
                        text:
                            'Merit List for the Academic Year 2023 – 2024 for First Year Admissions',
                        textSize: 16,
                        textColor: Colors.black,
                      ),
                    ),
                    SmallContainer(
                      height: 425,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: [
                          HeaderTitle(
                            text: 'Faculty Of Arts',
                            showUnderline: false,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/ba.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SmallText(
                                    text: 'Programs',
                                    textSize: 20,
                                    textColor: Colors.black,
                                  ),
                                  SmallText(
                                    text: 'Bachelor Of Arts (B.A.)',
                                    textSize: 18,
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FYBA.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FYBA-1.pdf',
                                      ),
                                    ],
                                  ),
                                  Button(
                                    text: '3rd List',
                                    fontSize: 16,
                                    buttonWidth: double.nan,
                                    borderRadius: 20,
                                    url:
                                        'https://rmc.edu.in/wp-content/uploads/2023/07/FYBA.pdf',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bammc.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Arts In Multimedia And Mass Communication (B.A.M.M.C.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FYBAMMC.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FYBAMMC-1.pdf',
                                      ),
                                    ],
                                  ),
                                  Button(
                                    text: '3rd List',
                                    fontSize: 16,
                                    buttonWidth: double.nan,
                                    borderRadius: 20,
                                    url:
                                        'https://rmc.edu.in/wp-content/uploads/2023/07/FYBAMMC.pdf',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 745,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 15.0),
                      child: Column(
                        children: [
                          HeaderTitle(
                            text: 'Faculty Of Commerce',
                            showUnderline: false,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bcom.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SmallText(
                                    text: 'Programs',
                                    textSize: 20,
                                    textColor: Colors.black,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text: 'Bachelor Of Commerce (B.C.O.M.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FYBCOM.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FYBCOM-1.pdf',
                                      ),
                                    ],
                                  ),
                                  Button(
                                    text: '3rd List',
                                    fontSize: 16,
                                    buttonWidth: double.nan,
                                    borderRadius: 20,
                                    url:
                                        'https://rmc.edu.in/wp-content/uploads/2023/07/FYBCOM.pdf',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/baf.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Commerce In Accounting And Finance (B.A.F.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FYBAF.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FYBComAF.pdf',
                                      ),
                                    ],
                                  ),
                                  Button(
                                    text: '3rd List',
                                    fontSize: 16,
                                    buttonWidth: double.nan,
                                    borderRadius: 20,
                                    url:
                                        'https://rmc.edu.in/wp-content/uploads/2023/07/FYBAF.pdf',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bammc.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Commerce In Management Studies (B.M.S.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FYBMS.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FYBMS-1.pdf',
                                      ),
                                    ],
                                  ),
                                  Button(
                                    text: '3rd List',
                                    fontSize: 16,
                                    buttonWidth: double.nan,
                                    borderRadius: 20,
                                    url:
                                        'https://rmc.edu.in/wp-content/uploads/2023/07/FYBMS.pdf',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bbi.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Commerce In Banking And Insurance (B.B.I.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FYBBI.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 720,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 15.0),
                      child: Column(
                        children: [
                          HeaderTitle(
                            text: 'Faculty Of Science',
                            showUnderline: false,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bsc.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SmallText(
                                    text: 'Programs',
                                    textSize: 20,
                                    textColor: Colors.black,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text: 'Bachelor Of Science (BSc.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FYBSC.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FYBSc.pdf',
                                      ),
                                    ],
                                  ),
                                  Button(
                                    text: '3rd List',
                                    fontSize: 16,
                                    buttonWidth: double.nan,
                                    borderRadius: 20,
                                    url:
                                        'https://rmc.edu.in/wp-content/uploads/2023/07/FYBSC.pdf',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bschs.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Science In Hospitality Studies (BSc.H.S.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FY-HOSPITLITY-STUDIES.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FYBScHospitality-Studies.pdf',
                                      ),
                                    ],
                                  ),
                                  Button(
                                    text: '3rd List',
                                    fontSize: 16,
                                    buttonWidth: double.nan,
                                    borderRadius: 20,
                                    url:
                                        'https://rmc.edu.in/wp-content/uploads/2023/07/FYBSCHOSPITALITY-STUDIES.pdf',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bscds.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Science In Data Science (BSc.D.S.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FY-DATA-SCIENCE.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bscit.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Science In Information Technology (BSc.I.T.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FYIT.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2023/06/FYBScIT.pdf',
                                      ),
                                    ],
                                  ),
                                  Button(
                                    text: '2nd List',
                                    fontSize: 16,
                                    buttonWidth: double.nan,
                                    borderRadius: 20,
                                    url:
                                        'https://rmc.edu.in/wp-content/uploads/2023/07/FYBSCIT.pdf',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: SmallText(
                        text:
                            'Merit List for the Academic Year 2022 – 2023 for First Year Admissions',
                        textSize: 16,
                        textColor: Colors.black,
                      ),
                    ),
                    SmallContainer(
                      height: 335,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: [
                          HeaderTitle(
                            text: 'Faculty Of Arts',
                            showUnderline: false,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/ba.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SmallText(
                                    text: 'Programs',
                                    textSize: 20,
                                    textColor: Colors.black,
                                  ),
                                  SmallText(
                                    text: 'Bachelor Of Arts (B.A.)',
                                    textSize: 18,
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/06/FYBA.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/07/FYBA-1.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bammc.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Arts In Multimedia And Mass Communication (B.A.M.M.C.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/06/FYBAMMC.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/07/FYBAMMC.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 600,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 15.0),
                      child: Column(
                        children: [
                          HeaderTitle(
                            text: 'Faculty Of Commerce',
                            showUnderline: false,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bcom.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SmallText(
                                    text: 'Programs',
                                    textSize: 20,
                                    textColor: Colors.black,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text: 'Bachelor Of Commerce (B.C.O.M.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/06/FYBCOM.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/07/FYBCOM.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/baf.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Commerce In Accounting And Finance (B.A.F.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/06/FYBCOM-AF.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/07/FYBCOM-AF.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bammc.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Commerce In Management Studies (B.M.S.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/06/FYBMS.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/07/FYBMS-1.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bbi.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Commerce In Banking And Insurance (B.B.I.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/06/FYBCOM-BI.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/07/FYBCOM-BI.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 580,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 15.0),
                      child: Column(
                        children: [
                          HeaderTitle(
                            text: 'Faculty Of Science',
                            showUnderline: false,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bsc.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SmallText(
                                    text: 'Programs',
                                    textSize: 20,
                                    textColor: Colors.black,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text: 'Bachelor Of Science (BSc.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/06/FYBSC.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/07/FYBSC-1.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bschs.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Science In Hospitality Studies (BSc.H.S.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/06/FYBSCHospitality-Studies.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/07/FYBSC-HS.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bscds.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Science In Data Science (BSc.D.S.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/06/FYBSCData-Science.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bscit.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Science In Information Technology (BSc.I.T.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/06/FYBSC-IT.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2022/07/FYBSC-IT.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: SmallText(
                        text:
                            'Merit List for the Academic Year 2021 – 2022 for First Year Admissions',
                        textSize: 16,
                        textColor: Colors.black,
                      ),
                    ),
                    SmallContainer(
                      height: 335,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: [
                          HeaderTitle(
                            text: 'Faculty Of Arts',
                            showUnderline: false,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/ba.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SmallText(
                                    text: 'Programs',
                                    textSize: 20,
                                    textColor: Colors.black,
                                  ),
                                  SmallText(
                                    text: 'Bachelor Of Arts (B.A.)',
                                    textSize: 18,
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FIRST_FYBA.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FYBA-2.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bammc.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Arts In Multimedia And Mass Communication (B.A.M.M.C.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FIRST_FYBAMMC.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FYBAMMC-1.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 600,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 15.0),
                      child: Column(
                        children: [
                          HeaderTitle(
                            text: 'Faculty Of Commerce',
                            showUnderline: false,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bcom.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SmallText(
                                    text: 'Programs',
                                    textSize: 20,
                                    textColor: Colors.black,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text: 'Bachelor Of Commerce (B.C.O.M.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FIRST_FYBCOM.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FYBCOM-2.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/baf.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Commerce In Accounting And Finance (B.A.F.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FIRST_FYBAF.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FYBAF-2.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bammc.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Commerce In Management Studies (B.M.S.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FIRST_FYBMS.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FYBMS-2.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bbi.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Commerce In Banking And Insurance (B.B.I.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FIRST_FYBBI.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FYBBI-2.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 580,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 15.0),
                      child: Column(
                        children: [
                          HeaderTitle(
                            text: 'Faculty Of Science',
                            showUnderline: false,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bsc.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SmallText(
                                    text: 'Programs',
                                    textSize: 20,
                                    textColor: Colors.black,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text: 'Bachelor Of Science (BSc.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FIRST_FYBSC.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FYBSC-2.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bschs.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Science In Hospitality Studies (BSc.H.S.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FYBSC.HOSPITALITY-STUDIES.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bscds.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Science In Data Science (BSc.D.S.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FYBSC.-DATA-SCIENCE.pdf',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/merit_list/bscit.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.6,
                                    child: SmallText(
                                      text:
                                          'Bachelor Of Science In Information Technology (BSc.I.T.)',
                                      textSize: 18,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Button(
                                        text: '1st List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FYBSC.IT_FIRST.pdf',
                                      ),
                                      SizedBox(width: 5),
                                      Button(
                                        text: '2nd List',
                                        fontSize: 16,
                                        buttonWidth: double.nan,
                                        borderRadius: 20,
                                        url:
                                            'https://rmc.edu.in/wp-content/uploads/2021/08/FYBSCIT-1.pdf',
                                      ),
                                    ],
                                  ),
                                ],
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
