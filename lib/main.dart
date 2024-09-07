// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:io';

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

  void _toggleEscolha() {
    bool _isPedra = false;
    bool _isPapel = false;
    bool _isTesoura = false;
    
    if (!_isPedra) {
      _isPedra = true;
    } else if (!_isPapel) {
      _isPapel = true;
    } else {
      _isTesoura = false;
    }
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
                GestureDetector(
                  child: Container(
                    child: Center(
                      child: Text('Pedra')
                    ),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                Container(
                  // child:  TextButton.icon(
                  //   onPressed: _toggleEscolha,
                  //   label: ElevatedButton(
                  //     onPressed: _toggleEscolha,
                  //   ),
                  // ),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('Tesoura'),
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
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Text('Resultado'),
            Text('Talvez eu tenha que colocar um TextField!!'),
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
                      Text('5')
                    ]
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('PC'),
                      Text('5')
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