import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inquire/screens/authentication_screens/registration_screen.dart';
import 'package:inquire/screens/home_page.dart';
import 'package:inquire/widgets/auth_buttons.dart';
import 'package:inquire/widgets/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                        hintsText: 'Email address',
                        obscureTexts: false,
                        keyboardTypes: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFields(
                        hintsText: 'Password',
                        obscureTexts: false,
                        keyboardTypes: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 30),
                      AuthButtons(
                        buttonText: 'Login',
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Homepage()));
                        },
                      ),
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
                              Navigator.push(
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
}
