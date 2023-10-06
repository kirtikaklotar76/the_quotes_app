import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: AnimatedSplashScreen(
          splash: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "MyQu",
                  style: GoogleFonts.aBeeZee(
                      color: const Color(0xff09203F),
                      fontSize: 30,
                      letterSpacing: 1),
                ),
                const SizedBox(
                  width: 2,
                ),
                const Icon(
                  Icons.all_inclusive,
                  size: 50,
                  color: Color(0xff09203F),
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  "tes",
                  style: GoogleFonts.aBeeZee(
                    color: const Color(0xff09203F),
                    fontSize: 30,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          nextScreen: HomePage(),
          splashTransition: SplashTransition.fadeTransition,
        ),
      ),
    );
  }
}

// Color(0xff537895);
