import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inquire/screens/add_question_pages/past_questions.dart';
import 'package:inquire/widgets/home_screen_button.dart';

class ListOfAnswerCourses extends StatefulWidget {
  const ListOfAnswerCourses({super.key});

  @override
  State<ListOfAnswerCourses> createState() => _ListOfAnswerCoursesState();
}

class _ListOfAnswerCoursesState extends State<ListOfAnswerCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1D2445),
          title: Text('Which Course?',
              style: GoogleFonts.nunito(color: Colors.white)),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomepageButtons(
                    buttonText: 'Project Management',
                    buttonTextColor: Color(0xFF1D2445),
                    buttonColor: Colors.orange,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProjectManagementQuizPage()));
                    }),
                const SizedBox(
                  height: 10,
                ),
                HomepageButtons(
                    buttonText: 'Human Computer Interface',
                    buttonTextColor: Colors.white,
                    buttonColor: Color(0xFF1D2445),
                    onPressed: () {}),
                const SizedBox(
                  height: 10,
                ),
                HomepageButtons(
                    buttonText: 'Database Management',
                    buttonTextColor: Color(0xFF1D2445),
                    buttonColor: Colors.orange,
                    onPressed: () {}),
                const SizedBox(
                  height: 10,
                ),
                HomepageButtons(
                    buttonText: 'Operating Systems I',
                    buttonTextColor: Colors.white,
                    buttonColor: Color(0xFF1D2445),
                    onPressed: () {}),
                const SizedBox(
                  height: 10,
                ),
                             ],
            ),
          ),
        ));
  }
}
