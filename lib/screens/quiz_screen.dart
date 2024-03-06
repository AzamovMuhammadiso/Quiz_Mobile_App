import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/quiz_data.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class QuizScreen extends StatefulWidget {
  final String subject;
  final List<Quiz> questions;

  QuizScreen({
    required this.subject,
    required this.questions,
  });

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  bool isQuizFinished = false;
  int elapsedSeconds = 0;
  int? selectedOption;
  late Timer timer;
  bool isCorrect = false;
  int bestRecord = 0;
  int bestTime = 0;
  int totalQuizzes = 0;
  int totalElapsedTime = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
    loadBestRecord();
    loadBestTime();
    loadTotalQuizzes();
    loadTotalElapsedTime();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!isQuizFinished) {
        setState(() {
          elapsedSeconds++;
        });
      }
    });
  }

  void handleAnswer(int selectedOptionIndex) {
    if (isQuizFinished) {
      return;
    }

    isCorrect = selectedOptionIndex ==
        widget.questions[currentQuestionIndex].correctIndex;

    if (isCorrect) {
      correctAnswers++;
    }

    setState(() {
      selectedOption = selectedOptionIndex;
    });

    Future.delayed(Duration(seconds: 1), () {
      if (currentQuestionIndex < widget.questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          selectedOption = null;
        });
      } else {
        setState(() {
          isQuizFinished = true;
        });
        timer.cancel();
        showResultScreen();
      }
    });
  }

  void showResultScreen() async {
    final int currentQuizElapsedTime = elapsedSeconds;
    int totalElapsedTime = await getTotalElapsedTime();

    if (correctAnswers > 0) {
      if (correctAnswers > bestRecord) {
        bestRecord = correctAnswers;
        await saveBestRecord(bestRecord);

        totalElapsedTime = currentQuizElapsedTime;
      } else {
        totalElapsedTime += currentQuizElapsedTime;
      }
      if (totalElapsedTime < bestTime || bestTime == 0) {
        bestTime = totalElapsedTime;
        await saveBestTime(bestTime);
      }
      await updateTotalElapsedTime(totalElapsedTime);
    }

    totalQuizzes++;
    saveTotalQuizzes();
    Navigator.push(
      context,
       MaterialPageRoute(
        builder: (context) => ResultScreen(
          correctAnswers: correctAnswers,
          totalQuestions: widget.questions.length,
          subject: widget.subject,
          questions: widget.questions,
          elapsedTime: currentQuizElapsedTime,
          totalQuizzes: totalQuizzes,
        ),
      ),
    );
  }

  Future<void> saveBestRecord(int bestRecord) async {
    final prefs = await SharedPreferences.getInstance();
    final bestRecordKey = '${widget.subject}-best-record';
    await prefs.setInt(bestRecordKey, bestRecord);
  }

  Future<void> saveBestTime(int bestTime) async {
    final prefs = await SharedPreferences.getInstance();
    final bestTimeKey = '${widget.subject}-best-time';
    await prefs.setInt(bestTimeKey, bestTime);
  }

  Future<void> loadBestRecord() async {
    final prefs = await SharedPreferences.getInstance();
    final bestRecordKey = '${widget.subject}-best-record';
    final savedBestRecord = prefs.getInt(bestRecordKey) ?? 0;
    setState(() {
      bestRecord = savedBestRecord;
    });
  }

  Future<void> loadBestTime() async {
    final prefs = await SharedPreferences.getInstance();
    final bestTimeKey = '${widget.subject}-best-time';
    final savedBestTime = prefs.getInt(bestTimeKey) ?? 0;
    setState(() {
      bestTime = savedBestTime;
    });
  }

  Future<void> loadTotalQuizzes() async {
    final prefs = await SharedPreferences.getInstance();
    final totalQuizzesKey = '${widget.subject}-total-quizzes';
    final savedTotalQuizzes = prefs.getInt(totalQuizzesKey) ?? 0;
    setState(() {
      totalQuizzes = savedTotalQuizzes;
    });
  }

  Future<void> loadTotalElapsedTime() async {
    final prefs = await SharedPreferences.getInstance();
    final totalElapsedTimeKey = '${widget.subject}-total-elapsed-time';
    final savedTotalElapsedTime = prefs.getInt(totalElapsedTimeKey) ?? 0;
    setState(() {
      totalElapsedTime = savedTotalElapsedTime;
    });
  }

  Future<void> saveTotalQuizzes() async {
    final prefs = await SharedPreferences.getInstance();
    final totalQuizzesKey = '${widget.subject}-total-quizzes';
    await prefs.setInt(totalQuizzesKey, totalQuizzes);
  }

  Future<int> getTotalElapsedTime() async {
    final prefs = await SharedPreferences.getInstance();
    final totalElapsedTimeKey = '${widget.subject}-total-elapsed-time';
    return prefs.getInt(totalElapsedTimeKey) ?? 0;
  }

  Future<void> updateTotalElapsedTime(int updatedTotalElapsedTime) async {
    final prefs = await SharedPreferences.getInstance();
    final totalElapsedTimeKey = '${widget.subject}-total-elapsed-time';
    await prefs.setInt(totalElapsedTimeKey, updatedTotalElapsedTime);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

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
          children: [
            Text(
              '${widget.subject[0].toUpperCase()}${widget.subject.substring(1)} quiz',
              style: const TextStyle(
                fontSize: 25,
                color: Color(0xFF0FC89B),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Question ${currentQuestionIndex + 1}/${widget.questions.length}',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              widget.questions[currentQuestionIndex].question,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: isQuizFinished
                  ? Container()
                  : ListView.builder(
                      itemCount:
                          widget.questions[currentQuestionIndex].options.length,
                      itemBuilder: (context, index) {
                        final optionText = widget
                            .questions[currentQuestionIndex].options[index];
                        final isOptionSelected = selectedOption == index;
                        final isOptionCorrect = isOptionSelected && isCorrect;

                        return Column(
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isOptionSelected
                                      ? (isOptionCorrect
                                          ? Color(0xFF0FC89B)
                                          : Color(0xFFFF0062))
                                      : Color(0xFF585D79),
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  handleAnswer(index);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      optionText,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: isOptionSelected
                                            ? (isOptionCorrect
                                                ? Color(0xFF0FC89B)
                                                : Color(0xFFFF0062))
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Time: $elapsedSeconds',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFFF0062),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
