import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inquire/add_questions_pages/project_management_question.dart';
import 'package:inquire/screens/answer_pages/answer_courses_screen.dart';
import 'package:inquire/widgets/home_screen_button.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Homepage',
            style: GoogleFonts.nunito(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF1D2445),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Column(
                  children: [
                    HomepageButtons(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
                      },
                      buttonText: 'Submit Questions',
                      buttonTextColor: Colors.white,
                      buttonColor: const Color(0xFF1D2445),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    HomepageButtons(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ListOfAnswerCourses()));
                      },
                      buttonText: 'Past Questions',
                      buttonTextColor: const Color(0xFF1D2445),
                      buttonColor: Colors.orange,
                    )
                  ],
                )
              ]),
        ));
  }
}
