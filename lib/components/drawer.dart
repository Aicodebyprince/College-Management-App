import 'package:princeproject/landing_page.dart';
import 'package:princeproject/loginpage.dart';
import 'package:princeproject/pages/abc.dart';
import 'package:princeproject/pages/about_us.dart';
import 'package:princeproject/pages/alumni_committee.dart';
import 'package:princeproject/pages/alumni_testimonials.dart';
import 'package:princeproject/pages/awards_of_principal.dart';
import 'package:princeproject/pages/code_of_conduct.dart';
import 'package:princeproject/pages/college_development.dart';
import 'package:princeproject/pages/examination_committee.dart';
import 'package:princeproject/pages/facilities.dart';
import 'package:princeproject/pages/feedback_forms.dart';
import 'package:princeproject/pages/iqac_committee.dart';
import 'package:princeproject/pages/library.dart';
import 'package:princeproject/pages/merit_lists.dart';
import 'package:princeproject/pages/nss_unit.dart';
import 'package:princeproject/pages/placement.dart';
import 'package:princeproject/pages/policy_procedures.dart';
import 'package:princeproject/pages/rti.dart';
import 'package:princeproject/pages/students_corner.dart';
import 'package:flutter/material.dart';
import 'package:princeproject/pages/skill_development_program.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 130,
                  width: 130,
                  child: const Image(image: AssetImage('assets/logo.png')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: SizedBox(
                    height: 90,
                    width: 60,
                    child: Column(
                      children: [
                        IconButton(
                          color: Colors.black,
                          icon: const Icon(Icons.power_settings_new),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            ); // Navigate to Announcements page
                          },
                        ),
                        Text('LOGIN'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LandingPage()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'About Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => const AboutUs()));
            },
          ),
          ListTile(
            title: const Text(
              'Our Facilities',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Facilities()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Student’s Corner',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const StudentsCorner()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Merit Lists',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MeritLists()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Placement',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Placement()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Alumni Testimonials',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AlumniTestimonials(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Alumni Committee',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AlumniCommittee(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Skill Development Program',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SkillDevelopmentProgram(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Library',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => const Library()));
            },
          ),
          ListTile(
            title: const Text(
              'Examintion Committee',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ExaminationCommittee(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              'NSS Unit',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => const NSSUnit()));
            },
          ),
          ListTile(
            title: const Text(
              'IQAC Committee',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const IQACCommittee()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'College Development Committee',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CollegeDevelopment(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Code Of Conduct',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CodeOfConduct()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'RTI',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => const RTI()));
            },
          ),
          ListTile(
            title: const Text(
              'Awards Of Our Principal',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AwardsOfPrincipal(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              'ABC',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => const ABC()));
            },
          ),
          ListTile(
            title: const Text(
              'Policy & Procedures',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PolicyProcedures(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Feedback',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FeedbackForms()),
              );
            },
          ),
        ],
      ),
    );
  }
}
