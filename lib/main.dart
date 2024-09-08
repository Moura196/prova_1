// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    // theme: ThemeData(
    //   textTheme: GoogleFonts.pixelifySansTextTheme(),
    // ), 
    // _buildTheme(Brightness.light),
  ));
}

// ThemeData _buildTheme(brightness) {
//   var baseTheme = ThemeData(brightness: brightness);

//   return baseTheme.copyWith(
//     textTheme: GoogleFonts.pixelifySansTextTheme(baseTheme.textTheme),
//   );
// }

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
          resultado = 'Você ganhou!';
          meuPlacar++;
          corTexto(resultado);
      } else {
        resultado = 'Você perdeu!';
        placarPC++;
        corTexto(resultado);
      }
    });
  }

  Color corTexto(String _resultado) {
    if (_resultado == 'Você ganhou!') {
      return Colors.green;
    } else if (_resultado == 'Você perdeu!') {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  Color corFundo() {
    if (meuPlacar > placarPC) {
      return Colors.green;
    } else if (meuPlacar < placarPC) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Center(
          child: Text(
            'Prova 1 - Pedra, Papel e Tesoura',
            style: GoogleFonts.pixelifySans(
              textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.grey[400],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Sua Jogada',
                style: GoogleFonts.pixelifySans(
                  textStyle: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Center(
                      child: GestureDetector(
                        child: TextButton(
                          onPressed: () {comecarJogo('Pedra');},
                          child: Text(
                            'Pedra',
                            style: GoogleFonts.pixelifySans(
                              textStyle: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          )
                        )
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
                          child: Text(
                            'Papel',
                            style: GoogleFonts.pixelifySans(
                              textStyle: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          )
                        ),
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
                        child: Text(
                          'Tesoura',
                          style: GoogleFonts.pixelifySans(
                              textStyle: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          )
                        ),
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
              Text(
                'Jogada do Computador',
                style: GoogleFonts.pixelifySans(
                  textStyle: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Text(
                    '$escolhaPC',
                    style: GoogleFonts.pixelifySans(
                              textStyle: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                  )
                ),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Text(
                'Resultado',
                style: GoogleFonts.pixelifySans(
                  textStyle: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              Text(
                '$resultado',
                style: GoogleFonts.pixelifySans(
                  textStyle: TextStyle(
                    color: corTexto(resultado),
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                width: 250,
                height: 90,
                decoration: BoxDecoration(
                  color: corFundo(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Você',
                          style: GoogleFonts.pixelifySans(
                            textStyle: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Text(
                          '$meuPlacar',
                          style: GoogleFonts.pixelifySans(
                            textStyle: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )
                      ]
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PC',
                          style: GoogleFonts.pixelifySans(
                            textStyle: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Text(
                          '$placarPC',
                          style: GoogleFonts.pixelifySans(
                            textStyle: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ] 
          ),
        )
      ),
    );
  }
}