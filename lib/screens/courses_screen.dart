import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inquire/screens/quiz_pages/past_questions.dart';
import 'package:inquire/widgets/home_screen_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
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
                    buttonText: 'Theory of Computing',
                    buttonTextColor: Color(0xFF1D2445),
                    buttonColor: Colors.orange,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PastQuestionPage()));
                    }),
                const SizedBox(
                  height: 10,
                ),
                HomepageButtons(
                    buttonText: 'Numerical Methods',
                    buttonTextColor: Colors.white,
                    buttonColor: Color(0xFF1D2445),
                    onPressed: () {}),
                const SizedBox(
                  height: 10,
                ),
                HomepageButtons(
                    buttonText: 'System Architecture and Designs',
                    buttonTextColor: Color(0xFF1D2445),
                    buttonColor: Colors.orange,
                    onPressed: () {}),
                const SizedBox(
                  height: 10,
                ),
                HomepageButtons(
                    buttonText: 'Project Management',
                    buttonTextColor: Colors.white,
                    buttonColor: Color(0xFF1D2445),
                    onPressed: () {}),
                const SizedBox(
                  height: 10,
                ),
                HomepageButtons(
                    buttonText: 'Computer Hardware',
                    buttonTextColor: Color(0xFF1D2445),
                    buttonColor: Colors.orange,
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
