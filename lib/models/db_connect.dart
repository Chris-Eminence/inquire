import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:inquire/models/question_model.dart';

class DBconnect {

  // Function to add more question to database
  final projectManagementUrl = Uri.parse(
      'https://inquire-24d6d-default-rtdb.firebaseio.com/project_management.json');
  final hciUrl = Uri.parse(
      'https://inquire-24d6d-default-rtdb.firebaseio.com/hci.json');


  Future<void> addProjectManagementQuestions(QuestionModel questionModel) async {
    // Adding question to the Database using HTTP post method
    http.post(projectManagementUrl, body: json.encode({
      'title': questionModel.questionTitle,
      'options': questionModel.options,
    }));
  }

  Future<void> addHCIQuestions(QuestionModel questionModel) async {
    // Adding question to the Database using HTTP post method
    http.post(hciUrl, body: json.encode({
      'title': questionModel.questionTitle,
      'options': questionModel.options,
    }));
  }


  // Function to Get questions from the database
  Future<void> getQuestions() async {
    http.get(projectManagementUrl).then((response){
      // The 'then' method returns a response of our database body(data)
      // Then to actually get the data, we need to decode it first
      var questionData = json.decode(response.body);
      print(questionData);
    });
  }
}