import 'package:flutter/material.dart';
import 'package:quiz_app/data/quiz_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/screens/subject_selection_screen.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'dart:convert';

class QuizAttempt {
  final int correctAnswers;
  final int elapsedTime;

  QuizAttempt({
    required this.correctAnswers,
    required this.elapsedTime,
  });
}

class ResultScreen extends StatefulWidget {
  final int correctAnswers;
  final int totalQuestions;
  final String subject;
  final int elapsedTime;
  final List<Quiz> questions;
  final int totalQuizzes; // Add this property

  ResultScreen({
    required this.correctAnswers,
    required this.totalQuestions,
    required this.subject,
    required this.elapsedTime,
    required this.questions,
    required this.totalQuizzes, // Add this parameter
  });

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late List<QuizAttempt> quizAttempts;
  int bestTime = 0;

  @override
  void initState() {
    super.initState();
    loadQuizAttempts();
  }

  Future<void> loadQuizAttempts() async {
    final prefs = await SharedPreferences.getInstance();
    final quizAttemptsJson = prefs.getString('${widget.subject}-quiz-attempts');
    if (quizAttemptsJson != null) {
      final List<dynamic> quizAttemptsData = jsonDecode(quizAttemptsJson);
      quizAttempts = quizAttemptsData
          .map((data) => QuizAttempt(
              correctAnswers: data['correctAnswers'],
              elapsedTime: data['elapsedTime']))
          .toList();

      quizAttempts.sort((a, b) {
        return a.elapsedTime.compareTo(b.elapsedTime);
      });
      bestTime = quizAttempts.first.elapsedTime;
    } else {
      quizAttempts = [];
    }
  }

  Future<void> saveQuizAttempts(List<QuizAttempt> quizAttempts) async {
    final prefs = await SharedPreferences.getInstance();
    final quizAttemptsJson = jsonEncode(quizAttempts
        .map((attempt) => {
              'correctAnswers': attempt.correctAnswers,
              'elapsedTime': attempt.elapsedTime
            })
        .toList());
    await prefs.setString('${widget.subject}-quiz-attempts', quizAttemptsJson);
  }

  @override
  Widget build(BuildContext context) {
    String imageAsset;
    String scoreText;
    Color scoreColor;

    if (widget.correctAnswers < widget.totalQuestions * 0.6) {
      imageAsset = 'images/bad.gif';
      scoreText = 'Bad';
      scoreColor = Color(0xFFFF0062);
    } else if (widget.correctAnswers < widget.totalQuestions * 0.86) {
      imageAsset = 'images/good.gif';
      scoreText = 'Average';
      scoreColor = Color(0xFFfeb60a);
    } else {
      imageAsset = 'images/win.gif';
      scoreText = 'Excellent';
      scoreColor = Color(0xFF0FC89B);
    }

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'WowQuiz Result',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Image.asset(
                  imageAsset,
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  '$scoreText',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: scoreColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Center(
                child: Text(
                  'Congratulations',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 30,
                      color: scoreColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Center(
                child: Text(
                  'YOUR SCORE',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF585D79),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${widget.correctAnswers}',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 35,
                            color: scoreColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '/${widget.totalQuestions}',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(
                          subject: widget.subject,
                          questions: widget.questions,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0FC89B),
                    onPrimary: Colors.white,
                    elevation: 3,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 45, vertical: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Start Again',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    elevation: 3,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 45, vertical: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Go Back',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
