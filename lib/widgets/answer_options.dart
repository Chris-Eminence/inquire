import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerOptionCard extends StatelessWidget {
  const AnswerOptionCard({
    super.key,
    required this.option,
    required this.color,
  });

  final String option;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
          title: Text(
        option,
        style: GoogleFonts.nunito(fontSize: 20),
      )),
    );
  }
}
