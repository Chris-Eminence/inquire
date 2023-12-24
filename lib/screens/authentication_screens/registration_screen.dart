import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inquire/widgets/auth_buttons.dart';
import 'package:inquire/widgets/auth_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('images/register.gif'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Welcome 👋',
                      style: GoogleFonts.nunito(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Register',
                      style: GoogleFonts.nunito(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthTextFields(
                      hintsText: 'Surname',
                      obscureTexts: false,
                      keyboardTypes: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthTextFields(
                      hintsText: 'Firstname',
                      obscureTexts: false,
                      keyboardTypes: TextInputType.name,
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
                      buttonText: 'Register',
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?  ',
                          style: GoogleFonts.nunito(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login here',
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
        ),
      )),
    );
  }
}




