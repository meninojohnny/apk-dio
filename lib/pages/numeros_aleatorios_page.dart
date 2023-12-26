import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumerosAleatoriosPage extends StatefulWidget {
  const NumerosAleatoriosPage({super.key});

  @override
  State<NumerosAleatoriosPage> createState() => _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosPage> {

  int numeroGerado = 0;

  late SharedPreferences storage;

  final CHAVE_NUMERO_GERADO = 'CHAVE_NUMERO_GERADO';

  @override
  void initState() {
    super.initState();
    carregarNumero();
  } 

  carregarNumero() async {
    storage = await SharedPreferences.getInstance();
    numeroGerado = await storage.getInt(CHAVE_NUMERO_GERADO) ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gerador de numeros aleatórios'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final storage = await SharedPreferences.getInstance();
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
            });
            storage.setInt(CHAVE_NUMERO_GERADO, numeroGerado);
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                numeroGerado.toString(), 
                style: const TextStyle(
                  fontSize: 30, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}