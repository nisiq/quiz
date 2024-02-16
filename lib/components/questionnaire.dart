import 'package:flutter/material.dart';
import './question.dart';
import 'answer.dart';

class Questionnaire extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedquestion;
  final void Function(int) whenToAnswer;

  const Questionnaire({
    required this.questions,
    required this.selectedquestion,
    required this.whenToAnswer,
    super.key,
  });

  bool get questionIsSelected {
    return selectedquestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = questionIsSelected
        ? questions[selectedquestion]['answers']
          as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Question(questions[selectedquestion]['text'] as String),
        ...answers.map((resp) {
          return Answer(
            resp['text'].toString(),
            () => whenToAnswer(int.parse(resp['score'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
