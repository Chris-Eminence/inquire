import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inquire/screens/add_question_pages/db_question.dart';
import 'package:inquire/screens/add_question_pages/hci_question.dart';
import 'package:inquire/screens/add_question_pages/os_question.dart';
import 'package:inquire/screens/add_question_pages/project_management_question.dart';
import 'package:inquire/screens/answer_pages/project_management_past_questions.dart';
import 'package:inquire/widgets/home_screen_button.dart';

class ListOfQuestionCourses extends StatefulWidget {
  const ListOfQuestionCourses({super.key});

  @override
  State<ListOfQuestionCourses> createState() => _ListOfQuestionCoursesState();
}

class _ListOfQuestionCoursesState extends State<ListOfQuestionCourses> {
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
                              builder: (context) => ProjectManagementQuestion()));
                    }),
                const SizedBox(
                  height: 10,
                ),
                HomepageButtons(
                    buttonText: 'Human Computer Interface',
                    buttonTextColor: Colors.white,
                    buttonColor: Color(0xFF1D2445),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HCIQuestion()));
                    }),
                const SizedBox(
                  height: 10,
                ),
                HomepageButtons(
                    buttonText: 'Database Management',
                    buttonTextColor: Color(0xFF1D2445),
                    buttonColor: Colors.orange,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DBQuestion()));
                    }),
                const SizedBox(
                  height: 10,
                ),
                HomepageButtons(
                    buttonText: 'Operating Systems I',
                    buttonTextColor: Colors.white,
                    buttonColor: Color(0xFF1D2445),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OSquestion()));
                    }),
                const SizedBox(
                  height: 10,
                ),
                             ],
            ),
          ),
        ));
  }
}
