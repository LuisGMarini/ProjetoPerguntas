
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if(pontuacao < 10) {
      return "Parabéns!";
    } else if(pontuacao < 15) {
      return "Muito bom!";
    } else if(pontuacao < 22){
      return "Sensacional!";
    } else {
      return "Fenomenal!";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
        ),
        ),
        TextButton(
          style: TextButton.styleFrom(),
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ), onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}