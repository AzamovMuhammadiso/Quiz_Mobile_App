import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/subject_selection_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF141A33),
        title: Text(
          'WowQuiz',
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0FC89B),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Color(0xFF465CC2),
                fontFamily: 'Roboto',
              ),
            ),
            const Text(
              'WowQuiz',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: Color(0xFF0FC89B),
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 25),
            Image.asset(
              'images/background.png',
              height: 300,
            ),
            const SizedBox(height: 60),
            const Text(
              'Let\'s learn',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Roboto',
                color: Color(0xFF465CC2),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubjectSelectionScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF465CC2),
                textStyle: const TextStyle(
                  fontFamily: 'Roboto',
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 25, horizontal: 65),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Get started',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
