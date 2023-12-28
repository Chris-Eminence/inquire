import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inquire/components/custom_colors.dart';
import 'package:inquire/models/db_connect.dart';
import 'package:inquire/models/question_model.dart';
import 'dart:convert';

import 'package:inquire/widgets/home_screen_button.dart';

class DBQuestion extends StatefulWidget {
  @override
  _DBQuestionState createState() => _DBQuestionState();
}

class _DBQuestionState extends State<DBQuestion> {
  TextEditingController idController = TextEditingController();
  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController option4Controller = TextEditingController();

  bool isOption1Correct = false;
  bool isOption2Correct = false;
  bool isOption3Correct = false;
  bool isOption4Correct = false;

  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database Questions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFE1DAE1)
                ),
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: questionController,
                    decoration: const InputDecoration(
                      labelText: 'Question Text',
                      hintText: 'Question text here',
                      labelStyle: TextStyle(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              buildOptionTextField(
                  option1Controller, 'Option 1', isOption1Correct),
              const SizedBox(
                height: 10,
              ),
              buildOptionTextField(
                  option2Controller, 'Option 2', isOption2Correct),
              const SizedBox(
                height: 10,
              ),
              buildOptionTextField(
                  option3Controller, 'Option 3', isOption3Correct),
              const SizedBox(
                height: 10,
              ),
              buildOptionTextField(
                  option4Controller, 'Option 4', isOption4Correct),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(height: 10),

              Stack(
                children: [
                  HomepageButtons(
                    buttonText: 'Submit',
                    buttonTextColor: primaryColor,
                    buttonColor: Colors.orange,
                    onPressed: () async {
                      // Show loading indicator
                      setState(() {
                        isLoading = true;
                      });

                      // Convert options to a Map with correct answers
                      Map<String, bool> options = {
                        option1Controller.text: isOption1Correct,
                        option2Controller.text: isOption2Correct,
                        option3Controller.text: isOption3Correct,
                        option4Controller.text: isOption4Correct,
                      };

                      DBconnect db = DBconnect();
                      // Use a try-catch block to handle errors during database interaction
                      try {
                        await db.addHCIQuestions(QuestionModel(
                          id: idController.text,
                          questionTitle: questionController.text,
                          options: options,
                        ));

                        // Database operation was successful, hide loading indicator and clear text fields
                        setState(() {
                          isLoading = false;
                          questionController.clear();
                          option1Controller.clear();
                          option2Controller.clear();
                          option3Controller.clear();
                          option4Controller.clear();
                          isOption1Correct = false;
                          isOption2Correct = false;
                          isOption3Correct = false;
                          isOption4Correct = false;
                        });
                      } catch (error) {
                        // Handle errors, e.g., show an error message
                        print('Error adding question to the database: $error');
                        // Optionally, you can still hide the loading indicator here if needed
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                  ),

                  if (isLoading)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        color: primaryColor,
                        strokeWidth: 6.0,
                      ),
                    ),
                ],
              ),




            ],
          ),
        ),
      ),
    );
  }

  Widget buildOptionTextField(
      TextEditingController controller, String label, bool isCorrect) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: label,
              hintStyle: const TextStyle(color: Colors.black54),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF1D2445)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF1D2445)),
              ),
            ),
          ),
        ),
        Checkbox(
          activeColor: primaryColor,
          value: isCorrect,
          onChanged: (value) {
            setState(() {
              // Uncheck all other options when one is checked
              isOption1Correct = false;
              isOption2Correct = false;
              isOption3Correct = false;
              isOption4Correct = false;

              // Update the correct option
              if (label == 'Option 1') {
                isOption1Correct = value!;
              } else if (label == 'Option 2') {
                isOption2Correct = value!;
              } else if (label == 'Option 3') {
                isOption3Correct = value!;
              } else if (label == 'Option 4') {
                isOption4Correct = value!;
              }
            });
          },
        ),
      ],
    );
  }
}
