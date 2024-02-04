import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  // Variável que mantém o índice da pergunta atual
  var perguntaSelecionada = 0;

  // Método para manipular a resposta
  void responder() {
    // Atualiza o estado para reconstruir o widget com a nova pergunta
    setState(() {
      perguntaSelecionada++;
    });
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    // Lista de perguntas
    final List<String> perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
      'Qual é a sua comida favorita?',
    ];

    // Estrutura principal da interface do usuário
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            // Exibe a pergunta atual com base na perguntaSelecionada
            Text(perguntas[perguntaSelecionada]),
            // Botões de resposta
            ElevatedButton(
              child: Text('Resposta 1'),
              onPressed: responder,
            ),
            ElevatedButton(
              child: Text('Resposta 2'),
              onPressed: responder,
            ),
            ElevatedButton(
              child: Text('Resposta 3'),
              onPressed: responder,
            ),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  // Método que cria um Estado para o widget PerguntaApp
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}

// Alguns componentes recebem mais de um widget, como listas
