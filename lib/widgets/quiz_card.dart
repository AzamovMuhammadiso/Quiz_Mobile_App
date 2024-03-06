import 'package:flutter/material.dart';
import 'package:quiz_app/data/quiz_data.dart';

class QuizCard extends StatelessWidget {
  final Quiz quiz;
  final void Function(int?) onAnswerSelected;

  QuizCard({
    required this.quiz,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text(
            quiz.question,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 16),
          Column(
            children: quiz.options.asMap().entries.map((entry) {
              final index = entry.key;
              final option = entry.value;
              return RadioListTile<int>(
                title: Text(option),
                value: index,
                groupValue: null,
                onChanged: onAnswerSelected,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
