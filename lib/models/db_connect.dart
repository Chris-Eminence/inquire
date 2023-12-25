import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:inquire/models/question_model.dart';

class DBconnect{

  // Function to add more question to database
  final url = Uri.parse('https://inquire-24d6d-default-rtdb.firebaseio.com/project_management.json');
  Future<void> addQuestions (QuestionModel questionModel) async {

    // Adding question to the Database using HTTP post method
    http.post(url, body: json.encode({
      'title' : questionModel.questionTitle,
      'options' : questionModel.options,
    }));
  }

  // Function to Get questions from the database
  Future<void> getQuestions() async {
    http.get(url).then((response){
      // The 'then' method returns a response of our database body(data)
      // Then to actually get the data, we need to decode it first
      var questionData = json.decode(response.body);
      print(questionData);
    });
  }
}