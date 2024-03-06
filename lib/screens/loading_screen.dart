import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/welcome_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF141A33),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 40),),
              SizedBox(
                // height: 20,
                child: Text("WowQuiz",style: TextStyle(color: Color(0xFF0FC89B),fontWeight: FontWeight.w800,fontSize: 40),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
