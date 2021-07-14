import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
  {'texto' : 'Preto', 'pontuacao' : 10},
  {'texto' : 'Vermelho','pontuacao' : 6},
  {'texto' : 'Verde','pontuacao' : 5},
  {'texto' : 'Branco', 'pontuacao' : 1},
  ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
  {'texto' : 'Coelho', 'pontuacao' : 10},
  {'texto' : 'Cobra', 'pontuacao' : 7},
  {'texto': 'Elefante', 'pontuacao' : 4},
  {'texto' :'Leão', 'pontuacao' : 2},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
    {'texto' : 'Maria', 'pontuacao' : 10},
    {'texto' : 'João', 'pontuacao' : 6},
    {'texto' : 'Leo', 'pontuacao' : 4},
    {'texto' : 'Pedro', 'pontuacao' : 3},
    ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
            perguntas: _perguntas,
            perguntaSelecionada: _perguntaSelecionada,
            responder: _responder,
        )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
          ),
        );
      }
    }

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
