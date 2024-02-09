import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  // Variável que mantém o índice da pergunta atual
  var _perguntaSelecionada = 0;

  final _perguntas = const [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['Vermelho', 'Azul', 'Preto', 'Roxo']
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['Cachorro', 'Gato', 'Coelho', 'Passarinho']
      },
      {
        'texto': 'Qual é a sua comida favorita?',
        'respostas': ['Strogonoff', 'Lasanha', 'Bolinha de Queijo', 'Escondidinho']
      }
    ];

  // Método para manipular a resposta
  void _responder() {
    if (temPerguntaSelecionada){
    // Atualiza o estado para reconstruir o widget com a nova pergunta
      setState(() {
      _perguntaSelecionada++;
    });
  }
}



  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // Lista de perguntas
  

    List<String> respostas = 
    temPerguntaSelecionada ? _perguntas[_perguntaSelecionada]
    .cast()['respostas']:[];

    List<Widget> widgets = respostas
    .map((t) => Resposta(t,_responder))
    .toList();


    // for (String textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }



    // Estrutura principal da interface do usuário
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada ? Column(
          children: <Widget>[
            // Exibe a pergunta atual com base na _perguntaSelecionada
            Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
            /*
            Pegando as respostas (string) e usando o map para converter a 
            lista em lista de widgets, e transformando o resultado do map em uma lista
            ... = pegar cada elemento da lista e jogar dentro da lista Questao
            */ 
            ...respostas.map((t) => Resposta(t,_responder)).toList(),
          ],
        ) 
        : Resultado()
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  // Método que cria um Estado para o widget PerguntaApp
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

// Alguns componentes recebem mais de um widget, como listas
