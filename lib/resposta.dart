import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;
  Resposta(this.texto, this.quandoSelecionado);

  Widget build(BuildContext contex) {
   return Container(
     width: double.infinity,
     child: ElevatedButton(
        child: Text(texto),
        onPressed:quandoSelecionado,
      ),
   );
  }
}
