import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/record_screen.dart';
import 'package:quiz_app/screens/subject_selection_screen.dart';
import 'package:quiz_app/widgets/custom_bottom_navigation_bar.dart';

class AboutScreen extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'My Quiz App',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0FC89B),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Version 1.0.0',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Text(
                'App Description:',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF465CC2),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Welcome to "WowQuiz" – Your Ultimate Learning Companion!',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0FC89B),
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              Text(
                'WowQuiz is a dynamic and engaging quiz application designed with the sole purpose of helping students improve their skills in various subjects, including Math, English, and Physics. Developed in collaboration with a charitable organization dedicated to educational empowerment, WowQuiz is tailored to provide an enriching and enjoyable learning experience.',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF141A33),
                  ),
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 12.0),
              Text(
                'Key Features:',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF465CC2),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                "Subject Selection: WowQuiz offers a seamless subject selection screen where users can choose their preferred subject to start their learning journey. Comprehensive Quizzes: Dive into subject-specific quizzes, each comprising a minimum of 10 thoughtfully crafted questions to challenge and expand your knowledge. Quiz Timer: Stay on track with our built-in timer, allowing you to monitor and manage your time effectively during quizzes. Interactive Results: Receive instant feedback on your performance with our results page. Depending on your score, you'll be categorized into one of three levels: 'Bad Score' (Less than 60% correct answers) 'Average Score' (Between 60% and 85% correct answers) 'Best Score' (86% or more correct answers) Local Score Saving: Your achievements matter! WowQuiz stores your best score locally, motivating you to continually strive for improvement. Visual Delight: Experience an aesthetically pleasing design with captivating graphics, engaging animations, and a user-friendly interface that makes learning a joy. WowQuiz is more than just a quiz app; it's your pathway to academic excellence and self-improvement. Whether you're preparing for exams or simply seeking to enhance your knowledge, WowQuiz is your trusted companion on your educational journey. Download WowQuiz today and embark on a fun-filled, enlightening adventure to become a true subject master!",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF141A33),
                  ),
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 24.0),
              const Text(
                'Contact Us:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF465CC2),
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Email: azamovmuhammadiso@gmail.com',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xFF0FC89B),
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Website: https://my-portfolioapp.netlify.app',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xFF0FC89B),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2, 
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => SubjectSelectionScreen()));
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => RecordScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}
