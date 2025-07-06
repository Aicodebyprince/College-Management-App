// ignore_for_file: unused_local_variable, depend_on_referenced_packages, deprecated_member_use
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/button.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/image_title.dart';
import 'package:princeproject/components/small_container.dart';
import 'package:princeproject/components/small_text.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package

class Library extends StatelessWidget {
  const Library({super.key});

  // Method to generate clickable links
  List<Widget> generateClickableLinks(List<String> urls) {
    return urls.map((url) {
      return GestureDetector(
        onTap: () {
          launch(url); // Use the url_launcher package to open the link
        },
        child: Text(
          url,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }).toList();
  }

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
                        'assets/library/library.png',
                      ), // replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: ImageTitle(
                      text: 'About Library',
                      showUnderline: false,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 590,
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Knowlegde Resource Center',
                        fontSize: 28,
                        underlineHeight: 4,
                        underlineTop: 40,
                        underlineWidth: 265,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: SmallText(
                        text:
                            'Library is the heart of institution. As a knowledge Resource Center Reena Mehta College Library has serve the needs of faculty, students and other stakeholders by providing most specific, relevant and exhaustive information. Library is an integral part of the education process and plays a pivotal role in promoting and improving the education standards, research and in overall development of the society.\n\nFrom the academic year 2021-2022 the professional course collection from the existing library has been shifted to a new location and a second library has been set up on the third floor. The Library has spacious reading room. Library is well equipped with Wi-Fi facility.',
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
                          'Library collection rich with Over 12000 thousand books',
                          'Journals/Magazines:– 12',
                          'Newspapers:– 7',
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              HeaderTitle(
                text: 'Library Working Hours',
                fontSize: 28,
                underlineHeight: 4,
                underlineTop: 36,
                underlineWidth: 285,
              ),
              SmallContainer(
                height: 100,
                width: 330,
                boxColor: Colors.white,
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: const Padding(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: BulletedList(
                    bulletColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    listItems: [
                      'Monday To Friday: 8:30 AM To 5.00 PM',
                      'Saturday: 9.00 AM To 4.00PM',
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: HeaderTitle(
                  text: 'Library Rules & Regulations',
                  fontSize: 28,
                  underlineTop: 36,
                  underlineHeight: 4,
                  underlineWidth: 190,
                ),
              ),
              BigContainer(
                height: 540,
                width: screenWidth * 0.92,
                color: Colors.red,
                padding: EdgeInsets.only(top: 0, left: 10, right: 10),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: BulletedList(
                      bulletColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      listItems: [
                        'Complete silence and strict discipline should be maintained in the library.',
                        'Library card is non- transferable.',
                        'Students must carry their ID card/Library card with him or her.',
                        'Only two books can be issued against the library card for the period of seven days.',
                        'Book must be return on or before the due date, otherwise per day 1/- Rs. Fine will be charged.',
                        'While calculating fine Sundays and Holidays will be counted.',
                        'Library books, periodicals and other library materials should be used with utmost care.',
                        'Eatables, mobile phones are strictly prohibited.',
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: HeaderTitle(
                  text: 'Open Access Resources',
                  fontSize: 28,
                  underlineTop: 36,
                  underlineHeight: 4,
                  underlineWidth: 305,
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 10),
                  BigContainer(
                    height: 310,
                    width: screenWidth * 0.95,
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SmallText(
                                            text: 'https://ndl.iitkgp.ac.in/',
                                            textSize: 18,
                                            textColor: Colors.black,
                                            url: 'https://ndl.iitkgp.ac.in/',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 312,
                                            child: SmallText(
                                              text:
                                                  'https://storage.googleapis.com/uniquecourses/online.html',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Colors.black,
                                              url:
                                                  'https://storage.googleapis.com/uniquecourses/online.html',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SmallText(
                                            text:
                                                'https://infoport.inflibnet.ac.in/',
                                            textSize: 18,
                                            textColor: Colors.black,
                                            url:
                                                'https://infoport.inflibnet.ac.in/',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SmallText(
                                            text:
                                                'https://www.it.iitb.ac.in/oscar/',
                                            textSize: 18,
                                            textColor: Colors.black,
                                            url:
                                                'https://www.it.iitb.ac.in/oscar/',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 312,
                                            child: SmallText(
                                              text:
                                                  'http://ncert.nic.in/textbook/textbook.htm',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Colors.black,
                                              url:
                                                  'http://ncert.nic.in/textbook/textbook.htm',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SmallText(
                                            text: 'https://www.doabooks.org/',
                                            textSize: 18,
                                            textColor: Colors.black,
                                            url: 'https://www.doabooks.org/',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SmallText(
                                            text: 'https://doaj.org/',
                                            textSize: 18,
                                            textAlign: TextAlign.left,
                                            textColor: Colors.black,
                                            url: 'https://doaj.org/',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 312,
                                            child: SmallText(
                                              text:
                                                  'https://openknowledge.worldbank.org/',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Colors.black,
                                              url:
                                                  'https://openknowledge.worldbank.org/',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 312,
                                            child: SmallText(
                                              text:
                                                  'http://ugcmoocs.inflibnet.ac.in/ugcmoocs/moocs_courses.php',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Colors.black,
                                              url:
                                                  'http://ugcmoocs.inflibnet.ac.in/ugcmoocs/moocs_courses.php',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 312,
                                            child: SmallText(
                                              text:
                                                  'https://epgp.inflibnet.ac.in/',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Colors.black,
                                              url:
                                                  'https://epgp.inflibnet.ac.in/',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 312,
                                            child: SmallText(
                                              text:
                                                  'https://epathshala.nic.in/index.php?ln=en',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Colors.black,
                                              url:
                                                  'https://epathshala.nic.in/index.php?ln=en',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SmallText(
                                            text:
                                                'https://www.swayamprabha.gov.in/',
                                            textSize: 18,
                                            textColor: Colors.black,
                                            url:
                                                'https://www.swayamprabha.gov.in/',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 312,
                                            child: SmallText(
                                              text:
                                                  'https://ess.inflibnet.ac.in/',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Colors.black,
                                              url:
                                                  'https://ess.inflibnet.ac.in/',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 312,
                                            child: SmallText(
                                              text:
                                                  'https://vidwan.inflibnet.ac.in/',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Colors.black,
                                              url:
                                                  'https://vidwan.inflibnet.ac.in/',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 312,
                                            child: SmallText(
                                              text:
                                                  'https://academic.oup.com/journals/pages/open_access',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Colors.black,
                                              url:
                                                  'https://academic.oup.com/journals/pages/open_access',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 312,
                                            child: SmallText(
                                              text:
                                                  'https://www.cambridge.org/core/what-we-publish/open-access',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Colors.black,
                                              url:
                                                  'https://www.cambridge.org/core/what-we-publish/open-access',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 312,
                                            child: SmallText(
                                              text:
                                                  'https://www.sciencedirect.com/book/9781843342038/open-access',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Colors.black,
                                              url:
                                                  'https://www.sciencedirect.com/book/9781843342038/open-access',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 312,
                                            child: SmallText(
                                              text:
                                                  'https://www.springeropen.com/journals',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Colors.black,
                                              url:
                                                  'https://www.springeropen.com/journals',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 312,
                                            child: SmallText(
                                              text:
                                                  'https://www.tandfonline.com/openaccess',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Colors.black,
                                              url:
                                                  'https://www.tandfonline.com/openaccess',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 312,
                                            child: SmallText(
                                              text: 'https://librivox.org/',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Colors.black,
                                              url: 'https://librivox.org/',
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
                                              fontSize: 32,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 312,
                                            child: SmallText(
                                              text:
                                                  'https://authorservices.wiley.com/open-research/open-access/browse-journals.html',
                                              textSize: 18,
                                              textAlign: TextAlign.left,
                                              textColor: Colors.black,
                                              url:
                                                  'https://authorservices.wiley.com/open-research/open-access/browse-journals.html',
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
              Padding(padding: EdgeInsets.only(top: 15.0)),
              Container(
                height: 225,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('assets/library/infrastructure.png'),
                    fit: BoxFit.fitWidth,
                    opacity: 0.6,
                  ),
                ),
                child: Center(
                  child: ImageTitle(
                    text: 'Infrastructure',
                    textColor: Colors.white,
                    textSize: 34,
                    showUnderline: false,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: SmallText(
                  text:
                      'The library facilities at RMC are a testament to the college’s dedication to academic excellence and holistic learning. The First Library, located on the ground floor, offers an inviting and resource-rich environment, designed to provide maximum comfort and convenience for students. With spacious seating arrangements, air-conditioned interiors, and a well-organized collection of books spanning diverse academic streams, it ensures a productive atmosphere for individual and collaborative study.',
                  textSize: 14,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 200,
                          width: screenWidth * 0.40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/library/ground_floor_library.png',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.55,
                          child: SmallText(
                            text:
                                'On the other hand, the Second Library, situated on the third floor, stands as a tranquil haven for research and learning. It is characterized by its serene ambiance, ample natural light, and an equally impressive collection of academic resources. This library, while slightly removed',
                            textSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SmallText(
                      text:
                          'from the hustle and bustle of the ground floor, offers students a peaceful retreat to focus on their studies.',
                      textSize: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.55,
                          child: SmallText(
                            text:
                                'Both libraries are equipped with modern amenities, including Wi-Fi access, to support the academic endeavors of students and faculty alike. Together, they form a cornerstone of the college’s commitment to fostering intellectual growth and providing top-notch educational facilities.',
                            textSize: 14,
                          ),
                        ),
                        Container(
                          height: 200,
                          width: screenWidth * 0.40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/library/third_floor_library.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              HeaderTitle(
                text: 'Digital Resource Library',
                fontSize: 30,
                underlineTop: 38.5,
                underlineHeight: 4,
                underlineWidth: 330,
              ),
              BigContainer(
                height: 590,
                width: screenWidth * 0.95,
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    HeaderTitle(
                      text: 'Literature Reviews',
                      fontSize: 30,
                      underlineTop: 38.5,
                      underlineHeight: 4,
                      underlineWidth: 250,
                    ),
                    SmallContainer(
                      height: 250,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Container(
                                  height: 175,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/library/digital_resource_library/writing_literature_reviews.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 160,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(
                                      text:
                                          'Writing Literature Reviews A Guide for Students of the Social and Behavioral Sciences - by Jose L. Galvan (Author), Melisa C. Galvan (Author)\n12, April, 2017',
                                      textSize: 14,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Button(
                                text: 'View',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/Writing-Literature-Reviews-A-Guide-for-Students-of-the-Social-and-Behavioral-Sciences-by-Jose-L.-Galvan-Melisa-C.-Galvan-z-lib.org_.pdf',
                              ),
                              Button(
                                text: 'Download',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/Writing-Literature-Reviews-A-Guide-for-Students-of-the-Social-and-Behavioral-Sciences-by-Jose-L.-Galvan-Melisa-C.-Galvan-z-lib.org_.pdf',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    SmallContainer(
                      height: 250,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Container(
                                  height: 175,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/library/digital_resource_library/the_literature_review.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 160,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(
                                      text:
                                          'The Literature Review: Six Steps to Success - by Lawrence A. Machi (Author), Brenda T. McEvoy (Author)\n04 May, 2016',
                                      textSize: 14,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Button(
                                text: 'View',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/The-literature-review-six-steps-to-success-by-Machi-Lawrence-A.-McEvoy-Brenda-T-z-lib.org_.pdf',
                              ),
                              Button(
                                text: 'Download',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/The-literature-review-six-steps-to-success-by-Machi-Lawrence-A.-McEvoy-Brenda-T-z-lib.org_.pdf',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BigContainer(
                height: 1370,
                width: screenWidth * 0.95,
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    HeaderTitle(
                      text: 'Research Methodology',
                      fontSize: 30,
                      underlineTop: 38.5,
                      underlineHeight: 4,
                      underlineWidth: 350,
                    ),
                    SmallContainer(
                      height: 250,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Container(
                                  height: 175,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/library/digital_resource_library/research_methodology.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 160,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(
                                      text:
                                          'Research Methodology: The Aims, Practices and Ethics of Science - by Peter Pruzan (Author)\n22 February, 2016',
                                      textSize: 14,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Button(
                                text: 'View',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/Research-Methodology-The-Aims-Practices-and-Ethics-of-Science-by-Peter-Pruzan-auth.-z-lib.org_.pdf',
                              ),
                              Button(
                                text: 'Download',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/Research-Methodology-The-Aims-Practices-and-Ethics-of-Science-by-Peter-Pruzan-auth.-z-lib.org_.pdf',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    SmallContainer(
                      height: 250,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Container(
                                  height: 175,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/library/digital_resource_library/research_methodology_and_scientific_writing.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 160,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(
                                      text:
                                          'Research Methodology and Scientific Writing - by C. George Thomas (Author)\n24 February, 2021',
                                      textSize: 14,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Button(
                                text: 'View',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/Research-Methodology-And-Scientific-Writing-by-C.-George-Thomas-z-lib.org_.pdf',
                              ),
                              Button(
                                text: 'Download',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/Research-Methodology-And-Scientific-Writing-by-C.-George-Thomas-z-lib.org_.pdf',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    SmallContainer(
                      height: 250,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Container(
                                  height: 175,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/library/digital_resource_library/research_methodologies.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 160,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(
                                      text:
                                          'Research Methodologies for Beginners - by Kitsakorn Locharoenrat (Author)\n03 April, 2017',
                                      textSize: 14,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Button(
                                text: 'View',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/Research-Methodologies-for-Beginners-by-Kitsakorn-Locharoenrat-z-lib.org_.pdf',
                              ),
                              Button(
                                text: 'Download',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/Research-Methodologies-for-Beginners-by-Kitsakorn-Locharoenrat-z-lib.org_.pdf',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    SmallContainer(
                      height: 250,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Container(
                                  height: 175,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/library/digital_resource_library/fundamental_of_research_methodology.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 160,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(
                                      text:
                                          'Fundamental of Research Methodology and Statistics - by Y.K. Singh (Author)\n01 January, 2006',
                                      textSize: 14,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Button(
                                text: 'View',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/Fundamental-of-Research-Methodology-and-Statistics.pdf-PDFDrive-.pdf',
                              ),
                              Button(
                                text: 'Download',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/Fundamental-of-Research-Methodology-and-Statistics.pdf-PDFDrive-.pdf',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    SmallContainer(
                      height: 250,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Container(
                                  height: 175,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/library/digital_resource_library/a_guide_to_research_methodology.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 160,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(
                                      text:
                                          'A Guide to Research Methodology: An Overview of Research Problems, Tasks and Methods - by Shyama Prasad Mukherjee (Author)\n04 September, 2019',
                                      textSize: 14,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Button(
                                text: 'View',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/A-Guide-To-Research-Methodology-An-Overview-Of-Research-Problems-Tasks-And-Methods-by-Shyama-Prasad-Mukherjee-z-lib.org_.pdf',
                              ),
                              Button(
                                text: 'Download',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/A-Guide-To-Research-Methodology-An-Overview-Of-Research-Problems-Tasks-And-Methods-by-Shyama-Prasad-Mukherjee-z-lib.org_.pdf',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BigContainer(
                height: 330,
                width: screenWidth * 0.95,
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    HeaderTitle(
                      text: 'Research Design',
                      fontSize: 30,
                      underlineTop: 38.5,
                      underlineHeight: 4,
                      underlineWidth: 245,
                    ),
                    SmallContainer(
                      height: 250,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Container(
                                  height: 175,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/library/digital_resource_library/research_design.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 160,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(
                                      text:
                                          'Research Design: Qualitative, Quantitative, and Mixed Methods Approaches - by John W. Creswell (Author)\n12 May, 2013',
                                      textSize: 14,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Button(
                                text: 'View',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/Qualitative-Quantitative-and-Mixed-Methods-Approaches-PDFDrive-.pdf',
                              ),
                              Button(
                                text: 'Download',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/Qualitative-Quantitative-and-Mixed-Methods-Approaches-PDFDrive-.pdf',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BigContainer(
                height: 370,
                width: screenWidth * 0.95,
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    HeaderTitle(
                      text: 'Introduction To Research',
                      fontSize: 30,
                      underlineTop: 38.5,
                      underlineHeight: 4,
                      underlineWidth: 205,
                    ),
                    SmallContainer(
                      height: 250,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Container(
                                  height: 175,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/library/digital_resource_library/research_methods.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 160,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(
                                      text:
                                          'Introduction to Research Methods A Practical Guide for Anyone Undertaking a Research Project - by Catherine Dawson (Author)\n15 November, 2009',
                                      textSize: 14,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Button(
                                text: 'View',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/Introduction-to-Research-Methods-A-Practical-Guide-for-Anyone-Undertaking-a-Research-Project-by-Catherine-Dawson-z-lib.org_.pdf',
                              ),
                              Button(
                                text: 'Download',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/Introduction-to-Research-Methods-A-Practical-Guide-for-Anyone-Undertaking-a-Research-Project-by-Catherine-Dawson-z-lib.org_.pdf',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BigContainer(
                height: 590,
                width: screenWidth * 0.95,
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    HeaderTitle(
                      text: 'Thesis Preparation',
                      fontSize: 30,
                      underlineTop: 38.5,
                      underlineHeight: 4,
                      underlineWidth: 255,
                    ),
                    SmallContainer(
                      height: 250,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Container(
                                  height: 175,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/library/digital_resource_library/how_to_write_a_thesis.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 160,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(
                                      text:
                                          'How to Write a Thesis - by Umberto Eco (Author), Caterina Mongiat Farina (Translator), Geoff Farina (Translator)\n27 February, 2015',
                                      textSize: 14,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Button(
                                text: 'View',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/How-to-Write-a-Thesis-PDFDrive-.pdf',
                              ),
                              Button(
                                text: 'Download',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/How-to-Write-a-Thesis-PDFDrive-.pdf',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    SmallContainer(
                      height: 250,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Container(
                                  height: 175,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/library/digital_resource_library/how_to_write_a_better_thesis.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 160,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(
                                      text:
                                          'How to Write a Better Thesis: Luke’s Apologetic Strategy in the Depiction of Paul as Messenger of God - by David G. Evans (Author), Paul Gruba (Author), Justin Zobel (Author)\n08 April, 2014',
                                      textSize: 14,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Button(
                                text: 'View',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/01-How-to-Write-a-Better-Thesis-Springer-International-Publishing-2014.pdf',
                              ),
                              Button(
                                text: 'Download',
                                borderRadius: 30,
                                url:
                                    'https://rmc.edu.in/wp-content/uploads/2022/12/01-How-to-Write-a-Better-Thesis-Springer-International-Publishing-2014.pdf',
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
