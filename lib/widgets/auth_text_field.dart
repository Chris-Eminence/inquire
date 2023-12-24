import 'package:flutter/material.dart';

class AuthTextFields extends StatelessWidget {
  AuthTextFields(
      {required this.hintsText,
        required this.obscureTexts,
        required this.keyboardTypes});

  final String hintsText;
  final bool obscureTexts;
  final TextInputType keyboardTypes;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardTypes,
      obscureText: obscureTexts,
      style: const TextStyle(
        color: Color(0xFF1D2445),
      ),
      decoration: InputDecoration(
        hintText: hintsText,
        hintStyle: const TextStyle(color: Colors.black54),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF1D2445)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF1D2445)),
        ),
      ),
    );
  }
}