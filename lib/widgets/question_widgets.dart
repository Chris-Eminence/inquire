import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {super.key,
      required this.question,
       this.indexAction,
       this.totalQuestion});

  final String question;
  final int? indexAction;
  final int? totalQuestion;

  @override
  Widget build(BuildContext context) {
    return Text(question,
      textAlign: TextAlign.center,
      style: GoogleFonts.nunito(
        fontSize: 22,
        color: const Color(0xFF1D2445),
        fontWeight: FontWeight.bold
      ),);
  }
}
