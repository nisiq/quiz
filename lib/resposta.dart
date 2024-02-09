import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {

  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 20, 231, 231)),
        child: Text(
          texto,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: quandoSelecionado,
      ),
    );
  }
}