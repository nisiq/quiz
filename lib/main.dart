import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

// Tornando PerguntaApp um Widget
class PerguntaApp extends StatelessWidget {

  var perguntaSelecionada = 0;


  void responder() {
    perguntaSelecionada++;
    print(perguntaSelecionada);
  }


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
            Text(perguntas[perguntaSelecionada]),
            ElevatedButton(
              child: Text('Resposta 1'),
              onPressed: responder,
            ),
            ElevatedButton(
              child: Text('Resposta 2'),
              // função que n recebe nenhum parametro ()
              onPressed: responder,
            ),
            ElevatedButton(
              child: Text('Resposta 3'),
              //funçaõ arrow =>
              onPressed: responder,
            ),
          ],
        ),
      ),
    );
  }
}


//Alguns componentes recebem mais que um widget.... (listas)