import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

// Tornando PerguntaApp um Widget
class PerguntaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
      'Qual é a sua comida favorita?',
    ];

    //Filho widget de PerguntaApp é MaterialApp
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas.elementAt(0)),
            ElevatedButton(
              child: Text('Resposta 1'),
              onPressed: null,
            ),
            ElevatedButton(
              child: Text('Resposta 2'),
              onPressed: null,
            ),
            ElevatedButton(
              child: Text('Resposta 3'),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}


//Alguns componentes recebem mais que um widget.... (listas)