import 'package:fleetride/first.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.jpeg'), fit: BoxFit.fill)),
          child: Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'FLEET RIDE',
                  textStyle: GoogleFonts.aclonica(fontSize: 40, color: Colors.red),
                  speed: const Duration(milliseconds: 230),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
              onFinished: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => FirstPage()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
