// ignore_for_file: unused_local_variable

import 'package:bulleted_list/bulleted_list.dart';
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:flutter/material.dart';

class CodeOfConduct extends StatelessWidget {
  const CodeOfConduct({super.key});

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
                        'assets/code_of_conduct.png',
                      ), // replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 2150,
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 10.0),
                child: const Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Code of Conduct',
                        fontSize: 28,
                        underlineHeight: 4,
                        underlineTop: 32,
                        underlineWidth: 215,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: BulletedList(
                        style: TextStyle(
                          color: Color(0xFF545454),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        listItems: [
                          'Students joining the College are expected to accept and observe all the rules and regulations, which will be subject to strict enforcement by the College authorities.',
                          'According to Ordinance 119 for granting terms in each subject minimum attendance of 75% of the theory, lectures, practicals and tutorials (Wherever prescribed) separately will be required out of the total number lectures, practicals and tutorials in the subject conducted in the terms as declared by the University of Mumbai.',
                          'In case of sickness, a leave application shall have to be submitted to the college office along with a medical certificate within two days of resuming the College.',
                          'The College attaches great importance to discipline and the same must be scrupulously observed by the Failure to comply with any of the rules, regulation or requirement notified from time to time will lead to strict disciplinary action including removing the name of the student from the college roll.',
                          'All students must wear their valid identity cards issued by the college when they are on the college campus even on Sundays and holidays or else strict disciplinary action will be taken against them. Use of mobile phone is strictly prohibited in the college campus, any loss of mobile phone is the absolute responsibility of students, and no complaints of loss of mobile will be entertained by the staff of the College. Use of cell phones in any form in the class rooms and corridors is strictly prohibited. On breach of this discipline, the cell-phone holder will be liable for a penalty of 500/- for the first offence. In case of a repetition of the offence the cell-phone shall be liable to be confiscated',
                          'If the student is found indulging in anti- national activities contrary to the provision of acts and laws enforced by government or join any activity contrary to rules of discipline will be liable to be expelled from the college without any notice by the Management of the college.',
                          'Whosoever directly or indirectly commits,participates in, abets or propagates ragging within or outside educational institution shall,on conviction,be punished with imprisonment for a term up to 2 years and or penalty which may extend to ten thousand rupees. Any students convicted of an offence of ragging shall be dismissed from the educational institution and such students shall not be admitted in any other educational institution for five years from the date of order of such',
                          'All College activities require prior permission of the Principal. No society or association shall be formed in the College and no person shall be invited',
                          'Students are expected to a take good care of College property and to help in keeping the College premises clean. Any breach of discipline in this regards will be dealt with very severely.',
                          'Any form of gambling, smoking, consumption of alcohol or carrying such items is strictly prohibited in the College premises',
                          'Students should read all the notice boards regularly for getting proper and relevant information',
                          'Matters not covered as a part of the above-mentioned rules and regulations shall rest at the absolute discretion of the College authorities.',
                          'Students are expected to wear decent clothes.',
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
    );
  }
}
