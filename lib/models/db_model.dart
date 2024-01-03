import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:inquire/models/question_model.dart';

class DBconnect {
  // Project management endpoint url
  final projectManagementUrl = Uri.parse(
      'https://inquire-24d6d-default-rtdb.firebaseio.com/project_management.json');

  // HCI endpoint url
  final hciUrl =
      Uri.parse('https://inquire-24d6d-default-rtdb.firebaseio.com/hci.json');

  // Database endpoint url
  final databaseUrl = Uri.parse(
      'https://inquire-24d6d-default-rtdb.firebaseio.com/database.json');

  // HCI endpoint url
  final osUrl = Uri.parse(
      'https://inquire-24d6d-default-rtdb.firebaseio.com/operating_systems.json');

  Future<void> addProjectManagementQuestions(
      QuestionModel questionModel) async {
    // Adding Project Management question to the Database using HTTP post method
    http.post(projectManagementUrl,
        body: json.encode({
          'title': questionModel.questionTitle,
          'options': questionModel.options,
        }));
  }

  // Method for adding HCI question to database
  Future<void> addHCIQuestions(QuestionModel questionModel) async {
    // Adding question to the Database using HTTP post method
    http.post(hciUrl,
        body: json.encode({
          'title': questionModel.questionTitle,
          'options': questionModel.options,
        }));
  }

  // Method for adding Database question to database
  Future<void> addDBQuestions(QuestionModel questionModel) async {
    // Adding question to the Database using HTTP post method
    http.post(databaseUrl,
        body: json.encode({
          'title': questionModel.questionTitle,
          'options': questionModel.options,
        }));
  }

  // Method for adding OS question to database
  Future<void> addOSQuestions(QuestionModel questionModel) async {
    // Adding question to the Database using HTTP post method
    http.post(osUrl,
        body: json.encode({
          'title': questionModel.questionTitle,
          'options': questionModel.options,
        }));
  }

  // Function to Get Project Management questions from the database
  Future<List<QuestionModel>> getProjectManagementQuestions() async {
    print('The get method has been initiated');

    try {
      var response = await http.get(projectManagementUrl);

      print('HTTP response received');

      if (response.statusCode == 200) {
        var questionData = json.decode(response.body) as Map<String, dynamic>;
        List<QuestionModel> newQuestions = [];

        // Picking all the questions from the Database
        questionData.forEach((key, value) {
          var newQuestion = QuestionModel(
            id: key,
            questionTitle: value['title'],
            options: Map.castFrom(value['options']),
          );

          // Add new questions from the database to the list of Questions
          newQuestions.add(newQuestion);
        });

        return newQuestions;
      } else {
        print('Failed to load questions. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error loading questions: $error');
    }
    return [];
  }


  // Function to Get DB Management questions from the database
  Future<List<QuestionModel>> getDBManagementQuestions() async {
    print('The get method has been initiated');

    try {
      var response = await http.get(databaseUrl);

      print('HTTP response received');
      if (response.statusCode == 200) {
        var questionData = json.decode(response.body) as Map<String, dynamic>;
        List<QuestionModel> newQuestions = [];

        // Picking all the questions from the Database
        questionData.forEach((key, value) {
          var newQuestion = QuestionModel(
            id: key,
            questionTitle: value['title'],
            options: Map.castFrom(value['options']),
          );

          // Add new questions from the database to the list of Questions
          newQuestions.add(newQuestion);
        });

        return newQuestions;
      } else {
        print('Failed to load questions. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error loading questions: $error');
    }
    return [];
  }


  // Function to Get HCI questions from the database
  Future<List<QuestionModel>> getHCIQuestions() async {
    print('The get method has been initiated');

    try {
      var response = await http.get(hciUrl);

      print('HTTP response received');

      if (response.statusCode == 200) {
        var questionData = json.decode(response.body) as Map<String, dynamic>;
        List<QuestionModel> newQuestions = [];

        // Picking all the questions from the Database
        questionData.forEach((key, value) {
          var newQuestion = QuestionModel(
            id: key,
            questionTitle: value['title'],
            options: Map.castFrom(value['options']),
          );

          // Add new questions from the database to the list of Questions
          newQuestions.add(newQuestion);
        });

        return newQuestions;
      } else {
        print('Failed to load questions. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error loading questions: $error');
    }
    return [];
  }


  // Function to Get OS questions from the database
  Future<List<QuestionModel>> getOSQuestions() async {
    print('The get method has been initiated');

    try {
      var response = await http.get(osUrl);

      print('HTTP response received');

      if (response.statusCode == 200) {
        var questionData = json.decode(response.body) as Map<String, dynamic>;
        List<QuestionModel> newQuestions = [];

        // Picking all the questions from the Database
        questionData.forEach((key, value) {
          var newQuestion = QuestionModel(
            id: key,
            questionTitle: value['title'],
            options: Map.castFrom(value['options']),
          );

          // Add new questions from the database to the list of Questions
          newQuestions.add(newQuestion);
        });

        return newQuestions;
      } else {
        print('Failed to load questions. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error loading questions: $error');
    }
    return [];
  }
}
