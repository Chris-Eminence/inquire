import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inquire/models/authentication_model.dart';
import 'package:inquire/screens/add_question_pages/question_courses_screen.dart';
import 'package:inquire/screens/answer_pages/answer_courses_screen.dart';
import 'package:inquire/screens/authentication_screens/login_screen.dart';
import 'package:inquire/widgets/home_screen_button.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Homepage',
                style: GoogleFonts.nunito(color: Colors.white),
              ),
              IconButton(onPressed: (){
                logoutUser();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
              }, icon: Icon(Icons.logout))
            ],
          ),
          backgroundColor: const Color(0xFF1D2445),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('images/homepages.png'),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Welcome to ',
                                style: GoogleFonts.nunito(
                                    color: const Color(0xFF1D2445), fontSize: 20),
                              ),
                              Text(
                                'InQuire',
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF1D2445),
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                              'A safe space to learn using past questions\nAlso upload past questions for others to use')
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      HomepageButtons(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ListOfQuestionCourses()));
                        },
                        buttonText: 'Submit Questions',
                        buttonTextColor: Colors.white,
                        buttonColor: const Color(0xFF1D2445),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      HomepageButtons(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ListOfAnswerCourses(),
                            ),
                          );
                        },
                        buttonText: 'Past Questions',
                        buttonTextColor: const Color(0xFF1D2445),
                        buttonColor: Colors.orange,
                      ),
                      ],
                  )
                ]),
          ),
        ));
  }
}
