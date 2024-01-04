import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inquire/components/custom_colors.dart';
import 'package:inquire/models/db_model.dart';
import 'package:inquire/screens/add_question_pages/result_page.dart';
import 'package:inquire/screens/home_page.dart';
import 'package:inquire/widgets/answer_options.dart';
import 'package:inquire/widgets/auth_buttons.dart';
import 'package:inquire/widgets/question_widgets.dart';

import '../../models/question_model.dart';

class DBPastQuestion extends StatefulWidget {
  const DBPastQuestion({Key? key}) : super(key: key);

  @override
  State<DBPastQuestion> createState() => _DBPastQuestionState();
}

class _DBPastQuestionState extends State<DBPastQuestion> {

  var dbConnect = DBconnect();
  late Future _questions;

  Future<List<QuestionModel>> getQuestions() async {
    // db method to fetch questions
    return dbConnect.getDBManagementQuestions();
  }

  int questionIndex = 0;

  // Score to track the user's progress
  int score = 0;

  // Flag to check if an answer has been pressed
  bool isPressed = false;

  // Flag to check if an option has already been selected
  bool isAlreadySelected = false;

  // Function to move to the next question or show the result page
  void nextQuestion(int questionLength) {
    if (questionIndex == questionLength - 1) {
      // If it's the last question, show the result page
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => ResultPage(
          result: score,
          questionLength: questionLength,
          startOver: () {
            startOver();
          },
          goToHomePage: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Homepage()));
          },
        ),
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
  void startOver() {
    setState(() {
      questionIndex = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    _questions = getQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Using the FutureBuilder widget to build data coming from the database

    return FutureBuilder(
      future: _questions as Future<List<QuestionModel>>,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<QuestionModel>;
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'DB management',
                  style: GoogleFonts.nunito(color: Colors.white),
                ),
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: const Color(0xFF1D2445),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      'Score $score',
                      style:
                      GoogleFonts.nunito(color: Colors.white, fontSize: 18),
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
                                question: extractedData[questionIndex].questionTitle),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Display answer options
                    for (int i = 0;
                    i < extractedData[questionIndex].options.length;
                    i++)
                      GestureDetector(
                        onTap: () {
                          // Handle option selection
                          updateQuestionScoreAndChangeAnswerCardColor(snapshot
                              .data![questionIndex].options.values
                              .toList()[i]);
                        },
                        child: AnswerOptionCard(
                          option: extractedData[questionIndex].options.keys
                              .toList()[i],
                          // Change color based on whether the answer is correct or incorrect
                          color: isPressed
                              ? extractedData[questionIndex].options.values
                              .toList()[i] ==
                              true
                              ? Colors.lightGreen
                              : Colors.redAccent
                              : Colors.transparent,
                        ),
                      ),
                    const SizedBox(height: 20),
                    // Button to move to the next question
                    AuthButtons(
                      buttonText: Text('Next Question',  textAlign: TextAlign.center,
        style: GoogleFonts.nunito(color: Colors.white)),
                      onPressed: () {
                        nextQuestion(extractedData.length);
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          );
        }

        return const Center(
          child: Text('No Data'),
        );
      },
    );
  }
}
