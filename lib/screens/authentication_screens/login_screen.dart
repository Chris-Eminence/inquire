import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inquire/screens/authentication_screens/registration_screen.dart';
import 'package:inquire/screens/home_page.dart';
import 'package:inquire/widgets/auth_buttons.dart';
import 'package:inquire/widgets/auth_text_field.dart';

import '../../models/authentication_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String? email;
  String? password;
  bool isLoading = false; // Added loading indicator state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('images/login.gif'),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Welcome back 😁',
                        style: GoogleFonts.nunito(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Login',
                        style: GoogleFonts.nunito(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFields(
                        onChange: (value){
                          email = value;
                        },
                        hintsText: 'Email address',
                        obscureTexts: false,
                        keyboardTypes: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFields(
                        onChange: (value){
                          password = value;
                        },
                        hintsText: 'Password',
                        obscureTexts: true,
                        keyboardTypes: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 30),
                      AuthButtons(
                        onPressed: isLoading ? null : () async => await _login(),
                        buttonText: isLoading
                            ? const CircularProgressIndicator() // Show circular indicator if loading
                            : Text('Login',  textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(color: Colors.white)),),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?  ',
                            style: GoogleFonts.nunito(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RegistrationScreen()));
                            },
                            child: Text(
                              'Register here',
                              style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  Future<void> _login() async {
    setState(() {
      isLoading = true; // Set loading to true when login starts
    });

    try {
      if (email == null || password == null) {
        // Handle the case where email or password is null
        print('Email or password is null');
        return;
      }

      // Example: Sign In
      UserCredential userCredential = await signInWithEmailAndPassword(email!, password!);
      print("Signed in: ${userCredential.user?.uid}");

      // Navigate to the homepage or handle success as needed
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Homepage()));
    } catch (e) {
      // Handle errors
      print('Some error occurred, contact support: $e');
    } finally {
      setState(() {
        isLoading = false; // Set loading to false when login finishes (success or error)
      });
    }
  }

}
