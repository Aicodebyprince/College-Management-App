// ignore_for_file: unused_local_variable
import 'package:princeproject/components/app_bar.dart';
import 'package:princeproject/components/big_container.dart';
import 'package:princeproject/components/drawer.dart';
import 'package:princeproject/components/header_title.dart';
import 'package:princeproject/components/small_container.dart';
import 'package:princeproject/components/small_text.dart';
import 'package:flutter/material.dart';

class AlumniTestimonials extends StatelessWidget {
  const AlumniTestimonials({super.key});

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
                        'assets/alumni_testimonials.png',
                      ), // replace with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              BigContainer(
                height: 4215,
                width: screenWidth * 0.95,
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: HeaderTitle(
                        text: 'Alumni Testimonials',
                        fontSize: 28,
                        underlineHeight: 4,
                        underlineTop: 35,
                        underlineWidth: 300,
                      ),
                    ),
                    SmallContainer(
                      height: 445,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 5),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'I am thankful for the opportunity I got to express my gratitude to the college. Education is the most important part of college, but it can be very challenging. I felt that the way that classes pushed me to be a better student, and they taught me how to manage my time and priorities. Once I graduate from college, I will be grateful that I have the ability from the very strong education I yearned for, that I will have the chance to start a career from it. I can’t express how fortunate I am for obtaining a quality education from RMC college. It is one of the best places that got me to form strong relationships that lasted three years. Not only I gained friendships among peers, but also got the chance to get close with my professors, and even faculties and staff. I felt that the most important aspect of living college life to its fullest is to get good people to surround yourself with, for these relationships help one’s college experience to be one of the best experiences, and I am privileged that I got that life. Personally, I thank professors and faculties that made a big impact on my life, and I also admire the friendships I made throughout my college years.',
                              textAlign: TextAlign.left,
                              textSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'Zain Salim Virani - T.Y. B.M.S. (Batch: 2019-2022)',
                              textAlign: TextAlign.right,
                              textSize: 16,
                              textColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 360,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'I have been a part of RMC for past three years, it is hard to believe how time has gone by in the blink of an eye. It has truly been an honour to be a part of this wonderful institution. RMC has helped me deliver my best, I credit my growth as an individual to the most caring and supportive teachers, and the various curricular and extra-curricular events held by RMC, where I made unforgettable memories.\nIt would be unfair and miserly if we, the students of RMC, fail to acknowledge the unwavering support rendered to us by the college and the precious faculty members during the pandemic. such treatment is quite unlikely at the degree level, and this is what has been reported by most students.\nRMC, and our beloved teachers definitely deserve a huge round of applause.\nI shall forever cherish my years at RMC.',
                              textAlign: TextAlign.left,
                              textSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'Iqra Naushad Khan - T.Y. B.M.S. (Batch: 2019-2022)',
                              textAlign: TextAlign.right,
                              textSize: 16,
                              textColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 240,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'Guidance is an essential component when it comes to a life of a student. My experience in Reena Mehta College has been one of the most memorable one. The guidance from our faculties has helped me to overcome the barriers. I have been given the opportunities which aided me to gain experiences which definitely will help me in my future career. I am very grateful for the knowledge I have gained and the experiences I have experienced during the three years of my undergraduate degree.',
                              textAlign: TextAlign.left,
                              textSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'Aniket Manna - T.Y. B.A.F. (Batch: 2019-2022)',
                              textAlign: TextAlign.right,
                              textSize: 16,
                              textColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 225,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'It’s my pleasure to share my experiences at Reena Mehta college. We have great memories with RMC. The mentors at RMC helped us enhance my academic and interpersonal skills. This institute provides numerous opportunities to grow, explore and improve skills, through academic and/or extra-curricular activities & have always gives a positive and healthy environment. All the faculty members are also highly supportive.',
                              textAlign: TextAlign.left,
                              textSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'Rinky Prajapati - T.Y. B.A.F. (Batch: 2019-2022)',
                              textAlign: TextAlign.right,
                              textSize: 16,
                              textColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 460,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'I have completed my Bachelor of Mass Media (class of 2022) from Reena Mehta College. I feel immensely grateful to this institution for shaping not just my career, but also my individuality.\nStaying true to its vision, the institution serves as a great platform for knowledge, skill, and character development. During the course of my graduation, it has presented me with a multitude of opportunities aimed towards enhancing my socio-cultural and ethical awareness.\nThe faculty here possesses deep knowledge of their subject matter, making the process of learning an intellectually stimulating endeavour. The culture here is open and friendly, and the atmosphere is conducive to learning – thanks to the state-of-the-art infrastructure, a host of cultural events, and continuous interaction with industry.\nAll of these attributes have shaped this institution into a breeding ground for a strong, immensely talented, and fun alumni network (which I am now pleased to be a part of).\nI am highly indebted to this institution for giving me some of the best years of my life.',
                              textAlign: TextAlign.left,
                              textSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'Yash Ketan Doshi - T.Y. B.A.M.M.C. (Batch: 2019-2022)',
                              textAlign: TextAlign.right,
                              textSize: 16,
                              textColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 250,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'Since the first moment I came to RMC I Came across immense energy and enthusiasm. The faculty and staff at this college are one of the best I couldn’t make it without their help and guidance.\nCollege has so many opportunities for the students to explore themselves. You will not be let down. I really feel privileged in being a part of this college and I am so glad I made this decision.\nI feel proud to be a part of RMC since the last 4 years. I would like to thanks to my Director, Co-ordinator my professor for their valuable support extended to me whenever I needed.',
                              textAlign: TextAlign.left,
                              textSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text: 'Ankush Sharma - T.Y. B.M.S.',
                              textAlign: TextAlign.right,
                              textSize: 16,
                              textColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 300,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'What I most like about RMC is the close student professor and student relationships. Professors are ready to put all their efforts into supporting students academically and helping them achieve their goals. I found RMC charging reasonable fees and truly focused on quality of education, course content and the commitment to offer an industry exposure to the students via internships with the quality education. RMC is the right place to gain and enhance your career, learning and knowledge.\nMy experience at RMC is definitely that one I will never regret. It was quite possibly one of best decision of my life and I am so grateful that I had the opportunity to get admission at RMC. I would like to recommend this to everybody.',
                              textAlign: TextAlign.left,
                              textSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text: 'Saif Vakhani - T.Y. B.A.F.',
                              textAlign: TextAlign.right,
                              textSize: 16,
                              textColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 350,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'I feel immensely glad to be writing this testimony for RMC because it gives me a way to show my gratitude to college. I would like to thank to my co-ordinator, without whose valuable guidance and assistance I would not have been able to make such confident decision about choosing BAMMC. RMC is an institute which inculcated in me a spirit of professionalism, diligence, responsibility, sincerity and integrity.\nI could feel the changes in myself within a year of joining RMC. The demanding schedule, tight, deadlines, high expectations that professor have from students, the importance given to punctuality and freedom to explore our creativity all played a part a in moulding me into the confident and self assured individual that I am today.\nThe awesome work which RMC has been doing since years, I would like to wish them all the very best for the decades to come. RMC Rockzzz!',
                              textAlign: TextAlign.left,
                              textSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text: 'Himanshu Jaiswal - S.Y. B.M.M.',
                              textAlign: TextAlign.right,
                              textSize: 16,
                              textColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 315,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'There are many undertake graduate degree but the decision to commit your time and resources to further study will always be a major one. If you are ready to invest in your future by studying at graduate level, then at RMC we can offer you all the support and encouragement you need.\nWe are energetic, forward looking college, consistently raising our standard of the betterment of the student as a whole. We strive hard to provide you the best quality education and wide range if well structured courses and thriving culture provides a friendly and supportive environment for you to undertake degree.\nThis prospects provides practical information to help you choose your career at RMC. It will also give you an idea of what it’s like to study.',
                              textAlign: TextAlign.left,
                              textSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text: 'Ritesh Sheth - Faculty',
                              textAlign: TextAlign.right,
                              textSize: 16,
                              textColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 255,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'It was my great privilege to be a part of RMC Where I could grow. The entire faculty and department leave no stone unturned to shape our future. Every skill and door leave a lasting impression on the future of an individual. My three years in RMC have been a wonderful experience of leaning with the most exposure outside. Huge respect, love and dedication for entire faculty an all members of the intelligence and department. It is their efforts that made me consider myself a better professional. Overall, it was a great experience and a lifetime memory at RMC.',
                              textAlign: TextAlign.left,
                              textSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'Atiya Fatima - T.Y. B.M.S. (Batch 2019-2020)',
                              textAlign: TextAlign.right,
                              textSize: 16,
                              textColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 340,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'RMC is a place where you create some astounding memories which you can cherish throughout your life. Its not just an institution, instead its your personal motivator that brings out the best in you which can help you to taste success at every step. The moment I stepped in, my whole life changed in a good way because of the positive and helping atmosphere. Because of such an amazing surrounding we experienced a new way of achieving success. These 3 years were the best years of my life because I got such amazing professors to teach, my amazing classmates, and all the whole staff was so co-operative enough to help whenever we needed them. I truly thank everyone for whatever I have gained during these 3 years. I was luckiest person to come in this college and create some of the best of memories.',
                              textAlign: TextAlign.left,
                              textSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'Kamal Mathur - T.Y. B.B.I. (Batch 2019-2020)',
                              textAlign: TextAlign.right,
                              textSize: 16,
                              textColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 220,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'Studying from RMC offers unique a combination of learning and self-development. The institute provided me the best possible platform and infrastructure to excel in my career interest. Especially the relationships between the faculty and students is very cordial. Various guidance lectures and seminars helped me a lot to boost my career. Beyond academies, industrial visit also assisted me to know about practical working environment.',
                              textAlign: TextAlign.left,
                              textSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'Vipul Agrawal - T.Y. B.A.F. (Batch 2019-2020)',
                              textAlign: TextAlign.right,
                              textSize: 16,
                              textColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmallContainer(
                      height: 255,
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'RMC is a place where you can find an amalgamation of leaning. I feel proud while saying that RMC has contributed towards my success. I thank my HOD and the entire team of RMC faculty who always supported and motivated us to have positive attitude of go getter , who always pushed me to improve our knowledge and perception better than before. The homely environment, co-operative seniors and dedicating teachers makes the BMS fresher students feel that they have selected the exact and the best college for their undergraduate degree.',
                              textAlign: TextAlign.left,
                              textSize: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 8,
                              right: 8,
                            ),
                            child: SmallText(
                              text:
                                  'Mohit Kumar - T.Y. B.M.S. (Batch 2019-2020)',
                              textAlign: TextAlign.right,
                              textSize: 16,
                              textColor: Colors.red,
                            ),
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
