// ignore_for_file: unused_local_variable
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';

class AwardsOfPrincipal extends StatelessWidget {
  const AwardsOfPrincipal({super.key});

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
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  height: 225,
                  width: screenWidth * 0.95,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/awards.png',
                      ), // replace with your image path
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                BigContainer(
                  height: 910,
                  width: screenWidth * 0.95,
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: HeaderTitle(
                            text: 'Awards & Achievements Of Our Principal',
                            underlineHeight: 4,
                            underlineTop: 32,
                            underlineWidth: screenWidth * 0.83,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: BulletedList(
                          style: TextStyle(
                            color: Color(0xFF545454),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          listItems: [
                            'Shoeb Junior College Best Teacher for Outstanding Performance in Result (2004-2005).',
                            'National Award Rashtriya Shiksha Ratan Award 25th August, 2013.',
                            'Nelson Mandela Peace Award 19th April, 2014.',
                            'PhD Guide in the Subject “Management and Commerce” Reg No:- JJT/2Kg/CMG/835, Guiding: 7 students for PhD',
                            'Attended Orientation Program from University of Kashmir “A” Grade.',
                            'Member of Indian Commerce Association 20/10/2015, Membership No. ANL1515',
                            'Editorial Board Member of International Journal in Management & Social Science. (Journal with Impact Factor)',
                            'External Referee for PhD Thesis (Evaluated 8 Thesis).',
                            'Giving guidance for NAAC preparation.',
                            'Taken guest lecture for Women Development Cell.',
                            'Member of All India Principal Association. (No:- LM 563)',
                            'Completed Refresher Course from University of Mumbai with B Grade from 6th march to 26th March, 2019.',
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
