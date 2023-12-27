import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inquire/widgets/home_screen_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.result,
    required this.questionLength,
    required this.startOver,
  });

  final int result;
  final int questionLength;
  final Function() startOver;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

        content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'Total Score',
        style: GoogleFonts.nunito(
            color: const Color(0xFF1D2445),
            fontWeight: FontWeight.w500,
            fontSize: 18),
      ),
      const SizedBox(
        height: 10,
      ),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            '$result/$questionLength',
            textAlign: TextAlign.center,
            style:
                GoogleFonts.nunito(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      const SizedBox(height: 10),
      HomepageButtons(
          buttonText: 'Retry Past Question',
          buttonTextColor: Colors.white,
          buttonColor: const Color(0xFF1D2445),
          onPressed: startOver),
      const SizedBox(height: 10),
      HomepageButtons(
          buttonText: 'Go to Homepage',
          buttonTextColor: const Color(0xFF1D2445),
          buttonColor: Colors.orange,
          onPressed: () {}),
    ]));
  }
}
