
class QuestionModel{

  final String id;
  final String questionTitle;
  final Map<String, bool> options;

  QuestionModel({required this.id, required this.questionTitle, required this.options});

  @override
  String toString() {
    // TODO: implement toString
    return 'QuestionModel(I.D: $id, \nQuestion title: $questionTitle, \nOptions: $options)';
  }

}