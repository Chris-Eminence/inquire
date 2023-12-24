import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inquire/screens/onboarding_screens/primary_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigationHome();
  }

  _navigationHome() async {
    await Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => PrimaryOnboardingScreen()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color(0xFF1D2445),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/splash.png'),
            Text('InQuire',
              style: GoogleFonts.nunito(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
