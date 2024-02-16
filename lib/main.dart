import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './components/questionnaire.dart';
import './components/result.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _selectedquestion = 0;
  var _scoreTotal = 0;
  final _questions = const [
    {
      'text': 'Whats my favorite color?',
      'answers': [
        {'text': 'Black', 'score': 0},
        {'text': 'Purple', 'score': 0},
        {'text': 'Blue', 'score': 10},
        {'text': 'White', 'score': 0},
      ],
    },
    {
      'text': 'Whats my favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 0},
        {'text': 'Rabbit', 'score': 0},
        {'text': 'Bird', 'score': 0},
      ],
    },
    {
      'text': 'Whats my favorite food?',
      'answers': [
        {'text': 'Feijoada', 'score': 10},
        {'text': 'Strogonoff', 'score': 0},
        {'text': 'Cheese Ball', 'score': 10},
        {'text': 'Chicken pie', 'score': 0},
      ],
    }
  ];

  void _answer(int score) {
    if (questionIsSelected) {
      setState(() {
        _selectedquestion++;
        _scoreTotal += score;
      });
    }
  }

  void _restartQuestionnaire() {
    setState(() {
      _selectedquestion = 0;
      _scoreTotal = 0;
    });
  }

  bool get questionIsSelected {
    return _selectedquestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('questions'),
        ),
        body: questionIsSelected
            ? Questionnaire(
                questions: _questions,
                selectedquestion: _selectedquestion,
                whenToAnswer: _answer,
              )
            : Result(_scoreTotal, _restartQuestionnaire),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
