import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;

  final void Function() whenStartQuestionnaire;

  const Result(this.score, this.whenStartQuestionnaire);

  String get resultphrase {
    if (score < 1) {
      return 'I hate you!';
    } else if (score < 12) {
      return 'You dont know me that well! :(';
    } else {
      return 'You really know me <3';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, //centralizar
      children: <Widget>[
        Center(
          child: Text(
            resultphrase,
            style: const TextStyle(fontSize: 28,
            ),
          ),
        ),
        TextButton(
          child: Text('Restart?',
          style: TextStyle(fontSize: 18)),
          style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.red)),
          onPressed: whenStartQuestionnaire,
        )
      ],
    );
  }
}
