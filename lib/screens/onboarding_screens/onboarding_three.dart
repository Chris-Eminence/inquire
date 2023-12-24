import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThirdOnboarding extends StatelessWidget {

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xFF1D2445),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(''),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/o3.png'),
                Text(
                  'Make learning fun',
                  style: GoogleFonts.nunito(color: Colors.white, fontSize: 25),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
