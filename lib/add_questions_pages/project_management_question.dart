import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inquire/components/custom_colors.dart';
import 'dart:convert';

import 'package:inquire/widgets/home_screen_button.dart';

class ProjectManagementQuestion extends StatefulWidget {
  @override
  _ProjectManagementQuestionState createState() => _ProjectManagementQuestionState();
}

class _ProjectManagementQuestionState extends State<ProjectManagementQuestion> {
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
        title: const Text('Add Question'),
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
                      final url = Uri.parse(
                          'https://inquire-24d6d-default-rtdb.firebaseio.com/project_management.json');

                      // Add data to the database
                      await http.post(
                        url,
                        body: json.encode(
                          {
                            'title': questionController.text,
                            'options': options,
                          },
                        ),
                      );

                      // Hide loading indicator and clear text fields
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
