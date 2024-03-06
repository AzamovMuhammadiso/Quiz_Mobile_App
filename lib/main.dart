import 'package:flutter/material.dart';
import 'package:quiz_app/screens/loading_screen.dart';
import 'package:quiz_app/screens/subject_selection_screen.dart';
import 'package:quiz_app/screens/welcome_screen.dart';

void main() async {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => LoadingScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/subject_selection': (context) => SubjectSelectionScreen(),
      },
    );
  }
}
