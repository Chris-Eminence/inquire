import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:inquire/widgets/home_screen_button.dart';

class AddQuestionScreen extends StatefulWidget {
  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
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
              TextField(
                controller: idController,
                decoration: const InputDecoration(labelText: 'Question ID'),
              ),
              TextField(
                controller: questionController,
                decoration: const InputDecoration(labelText: 'Question Text',

                ),

              ),
              buildOptionTextField(
                  option1Controller, 'Option 1', isOption1Correct),
              const SizedBox(height: 10,),
              buildOptionTextField(
                  option2Controller, 'Option 2', isOption2Correct),
              const SizedBox(height: 10,),
              buildOptionTextField(
                  option3Controller, 'Option 3', isOption3Correct),
              const SizedBox(height: 10,),
              buildOptionTextField(
                  option4Controller, 'Option 4', isOption4Correct),
              const SizedBox(height: 10,),

              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  // Convert options to a Map with correct answers
                  Map<String, bool> options = {
                    option1Controller.text: isOption1Correct,
                    option2Controller.text: isOption2Correct,
                    option3Controller.text: isOption3Correct,
                    option4Controller.text: isOption4Correct,
                  };
                  final url = Uri.parse(
                      'https://inquire-24d6d-default-rtdb.firebaseio.com/project_management.json');

                  http.post(
                    url,
                    body: json.encode(
                      {
                        'title': questionController.text,
                        'options': options,
                      },
                    ),
                  );

                },
                child: const Text('Add Question'),
              ),
              HomepageButtons(buttonText: 'Submit', buttonTextColor: Colors.orange, buttonColor: priam, onPressed: onPressed)
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
              hintStyle: TextStyle(color: Colors.black54),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF1D2445)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF1D2445)),
              ),),
          ),
        ),
        Checkbox(
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
