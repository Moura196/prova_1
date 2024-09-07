// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int meuPlacar = 0;
  int placarPC = 0;
  String resultado = '';
  String minhaEscolha = '';
  String escolhaPC = '';

  String _jogadaPCAleatoria() {
    Random random = Random();
    int alaetoria = random.nextInt(3);
    if (alaetoria == 0) {
      return 'Pedra';
    } else if (alaetoria == 1) {
      return 'Papel';
    } else {
      return 'Tesoura';
    }
  }

  void comecarJogo(String _minhaEscolha) {
    setState(() {
      minhaEscolha = _minhaEscolha;
      escolhaPC = _jogadaPCAleatoria();

      if (minhaEscolha == escolhaPC) {
        resultado = 'Empate';
      } else if (
        (minhaEscolha == 'Pedra' && escolhaPC == 'Tesoura') ||
        (minhaEscolha == 'Papel' && escolhaPC == 'Pedra') ||
        (minhaEscolha == 'Tesoura' && escolhaPC == 'Papel')) {
          print(resultado);
          resultado = 'Você ganhou!';
          meuPlacar++;
      } else {
        resultado = "Você perdeu!";
        placarPC++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Prova 1 - Pedra, Papel e Tesoura')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Sua Jogada'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Center(
                    child: GestureDetector(
                      child: TextButton(
                        onPressed: () {comecarJogo('Pedra');},
                        child: Text('Pedra'))
                    )
                  ),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Container(
                  child: Center(
                    child: GestureDetector(
                      child: TextButton(
                        onPressed: () {comecarJogo('Papel');},
                        child: Text('Papel')),
                    )
                  ),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Container(
                  child: Center(
                    child: TextButton(
                      onPressed: () {comecarJogo('Tesoura');},
                      child: Text('Tesoura')),
                  ),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ]
            ),
            Text('Jogada do Computador'),
            Container(
              child: Center(
                child: Text('$escolhaPC')),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Text('Resultado: $resultado'),
            Container(
              width: 250,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Você'),
                      Text('$meuPlacar')
                    ]
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('PC'),
                      Text('$placarPC')
                    ],
                  ),
                ],
              ),
            )
          ] 
        )
      ),
    );
  }
}