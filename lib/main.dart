import 'package:flutter/material.dart';
import 'package:inquire/add_questions_pages/project_management_question.dart';
import 'package:inquire/models/db_connect.dart';
import 'package:inquire/models/question_model.dart';
import 'package:inquire/screens/authentication_screens/login_screen.dart';
import 'package:inquire/screens/authentication_screens/registration_screen.dart';
import 'package:inquire/screens/answer_pages/answer_courses_screen.dart';
import 'package:inquire/screens/home_page.dart';
import 'package:inquire/screens/onboarding_screens/onboarding_one.dart';
import 'package:inquire/screens/onboarding_screens/onboarding_three.dart';
import 'package:inquire/screens/onboarding_screens/onboarding_two.dart';
import 'package:inquire/screens/onboarding_screens/primary_screen.dart';
import 'package:inquire/screens/onboarding_screens/splash_screen.dart';

void main() {

  var db = DBconnect();
  db.getQuestions();
  // db.addQuestions(QuestionModel(id: '15', questionTitle: '10 + 10', options: {
  //   '1010' : false,
  //   '02' : false,
  //   '20' : true,
  //   '200' : false,
  // })
// );


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ListOfAnswerCourses(),
    );
  }
}
