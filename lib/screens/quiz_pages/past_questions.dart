import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inquire/screens/quiz_pages/result_page.dart';
import 'package:inquire/widgets/answer_options.dart';
import 'package:inquire/widgets/auth_buttons.dart';
import 'package:inquire/widgets/question_widgets.dart';

import '../../models/question_model.dart';

class PastQuestionPage extends StatefulWidget {
  const PastQuestionPage({Key? key}) : super(key: key);

  @override
  State<PastQuestionPage> createState() => _PastQuestionPageState();
}

class _PastQuestionPageState extends State<PastQuestionPage> {
  // List of questions with their options and correct answers
  final List<QuestionModel> _questions = [
    QuestionModel(id: '10', questionTitle: '2+2', options: {
      '5': false,
      '1': false,
      '4': true,
      '22': false,
    }),
    QuestionModel(id: '11', questionTitle: '2+20', options: {
      '5': false,
      '1': false,
      '4': false,
      '22': true,
    })
  ];

  // Index to track the current question
  int questionIndex = 0;

  // Score to track the user's progress
  int score = 0;

  // Flag to check if an answer has been pressed
  bool isPressed = false;

  // Flag to check if an option has already been selected
  bool isAlreadySelected = false;

  // Function to move to the next question or show the result page
  void nextQuestion() {
    if (questionIndex == _questions.length - 1) {
      // If it's the last question, show the result page
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) =>
            ResultPage(result: score, questionLength: _questions.length, startOver: () { startOver(); },),
      );
    } else {
      // If not the last question
      if (isPressed) {
        // If an answer has been pressed, move to the next question
        setState(() {
          questionIndex++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        // If no answer has been pressed, show a Snack bar
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: const Color(0xFFF7F1FB),
          content: Text(
            'Please Attempt the question',
            style: GoogleFonts.nunito(
                color: Colors.indigo[900], fontWeight: FontWeight.w600),
          ),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(35.0), // Adjust the radius as needed
          ),
        ));
      }
    }
  }

  // Function to update the score and handle answer card color change
  void updateQuestionScoreAndChangeAnswerCardColor(bool value) {
    if (isAlreadySelected) {
      return; // If an option has already been selected, do nothing
    } else {
      if (value == true) {
        // If the selected option is correct, increment the score
        score++;
      }

        setState(() {
          isPressed = true;
          isAlreadySelected = true;
        });
    }
  }

  // Function tha handles the starting over of the current quiz
  void startOver(){
    setState(() {
      questionIndex = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Questions',
          style: GoogleFonts.nunito(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF1D2445),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              'Score $score',
              style: GoogleFonts.nunito(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Widget to display the current question
                    QuestionWidget(
                        question: _questions[questionIndex].questionTitle),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Display answer options
            for (int i = 0; i < _questions[questionIndex].options.length; i++)
              GestureDetector(
                onTap: () {
                  // Handle option selection
                  updateQuestionScoreAndChangeAnswerCardColor(
                      _questions[questionIndex].options.values.toList()[i]);
                },
                child: AnswerOptionCard(
                  option: _questions[questionIndex].options.keys.toList()[i],
                  // Change color based on whether the answer is correct or incorrect
                  color: isPressed
                      ? _questions[questionIndex].options.values.toList()[i] ==
                      true
                      ? Colors.lightGreen
                      : Colors.redAccent
                      : Colors.transparent,
                ),
              ),
            const SizedBox(height: 20),
            // Button to move to the next question
            AuthButtons(
              buttonText: 'Next Question',
              onPressed: () {
                nextQuestion();
              },
            ),
          ],
        ),
      ),
    );
  }
}
