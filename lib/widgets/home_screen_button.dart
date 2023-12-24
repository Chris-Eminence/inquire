import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomepageButtons extends StatelessWidget {
  HomepageButtons(
      {required this.buttonText,
        required this.buttonTextColor,
        required this.buttonColor,
        required this.onPressed});

  final String buttonText;
  final Color buttonTextColor, buttonColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(color: buttonTextColor),
        ),
      ),
    );
  }
}
