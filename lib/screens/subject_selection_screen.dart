import 'package:flutter/material.dart';
import 'package:quiz_app/screens/about_screen.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/data/quiz_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/record_screen.dart';
import 'package:quiz_app/widgets/custom_bottom_navigation_bar.dart';

class SubjectSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
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
      backgroundColor: Color(0xFF141A33),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Let's Play",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0FC89B),
                ),
              ),
            ),
            Text(
              "Be the first!",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  customSubjectButton(
                    context: context,
                    label: 'English quiz',
                    imageAsset: 'images/english.png',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            subject: 'English',
                            questions: englishQuestions,
                          ),
                        ),
                      );
                    },
                    colorIndex: 1,
                  ),
                  customSubjectButton(
                    context: context,
                    label: 'Math quiz',
                    imageAsset: 'images/math.png',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            subject: 'Math',
                            questions: mathQuestions,
                          ),
                        ),
                      );
                    },
                    colorIndex: 0,
                  ),
                  customSubjectButton(
                    context: context,
                    label: 'Physics quiz',
                    imageAsset: 'images/physics.png',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            subject: 'Physics',
                            questions: physicsQuestions,
                          ),
                        ),
                      );
                    },
                    colorIndex: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0, 
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => RecordScreen(),
              ),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AboutScreen(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget customSubjectButton({
    required BuildContext context,
    required String label,
    required String imageAsset,
    required VoidCallback onPressed,
    double buttonHeight = 180.0,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16.0),
    required int colorIndex,
  }) {
    final List<Color> buttonColors = [
      Color(0xFF465CC2),
      Color(0xFF0FC89B),
      Color(0xFF06D3F6),
    ];

    if (colorIndex >= buttonColors.length) {
      colorIndex = 0;
    }

    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: buttonColors[colorIndex],
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: padding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: const Icon(
                    Icons.check, // Tick icon
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Level 1',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  imageAsset,
                  width: 150,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
