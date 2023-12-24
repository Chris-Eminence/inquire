import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthButtons extends StatelessWidget {
  AuthButtons({required this.buttonText, this.onPressed});

  final String buttonText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Color(0xFF1D2445),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(buttonText,
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(color: Colors.white)),
      ),
    );
  }
}