
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/widgets/text_label.dart';
import '../repositories/nivel_repository.dart';
import '../repositories/linguagem_repository.dart';

class DatePage extends StatefulWidget {
  const DatePage({super.key});

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {

  TextEditingController nomeController = TextEditingController();
  TextEditingController dataNasciController = TextEditingController();
  DateTime? dataNascimento;
  List niveis = [];
  String? nivelSelecionado;
  List linguagens = [];
  List linguagensSelecionadas = [];
  double salarioEscolhido = 2500;
  int tempoExperiencia = 0;
  bool salvar = true;
  bool salvando = false;

  late SharedPreferences storage;

  final String CHAVE_DADOS_CADASTRAIS_NOME = 'CHAVE_DADOS_CADASTRAIS_NOME';
  final String CHAVE_DADOS_CADASTRAIS_DATA_NASCI = 'CHAVE_DADOS_CADASTRAIS_DATA_NASCI';
  final String CHAVE_DADOS_CADASTRAIS_NIVEL = 'CHAVE_DADOS_CADASTRAIS_NIVEL';
  final String CHAVE_DADOS_CADASTRAIS_EXPERIENCIA = 'CHAVE_DADOS_CADASTRAIS_EXPERIENCIA';
  final String CHAVE_DADOS_CADASTRAIS_LINGUAGENS = 'CHAVE_DADOS_CADASTRAIS_LINGUAGENS';
  final String CHAVE_DADOS_CADASTRAIS_SALARIO = 'CHAVE_DADOS_CADASTRAIS_SALARIO';

  @override
  void initState() {
    niveis = NivelRepository().retornaNiveis();
    linguagens = LinguagemRepository().retornaLinguagens();
    carregarDados();
  }

  carregarDados() async {
    storage = await SharedPreferences.getInstance();
    nomeController.text = storage.getString(CHAVE_DADOS_CADASTRAIS_NOME) ?? '';
    nivelSelecionado = storage.getString(CHAVE_DADOS_CADASTRAIS_NIVEL) ?? '';
  }

  List<DropdownMenuItem> returnItens(maximo) {
    List<DropdownMenuItem> itens = [];
    for (int i = 0;i <= maximo; i++) {
      itens.add(DropdownMenuItem(
      child: Text('$i'),
      value: i,
      ));
    }
    return itens;
  }

  void validacao({required bool exprecao, required String mensagem}) {
    if (exprecao) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mensagem),
        ),
      );
      salvar = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus dados')),
      body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextLabel('Nome:'),
            TextField(
              controller: nomeController,
            ),
      
            const TextLabel('Data nascimento:'),
            TextField(
              controller: dataNasciController,
              readOnly: true,
              onTap: () async {
                var data = await showDatePicker (
                  context: context, 
                  initialDate: DateTime(2023, 1, 1), 
                  firstDate: DateTime(1950, 1, 1),
                  lastDate: DateTime(2023, 12, 31),
                );
                if (data != null) {
                  dataNascimento = data;
                  dataNasciController.text = data.toString();
                }
              },
            ),
      
            const TextLabel('Nivel de Experiência:'),
            Column(
              children:
                niveis.map(
                  (e) => RadioListTile(
                    dense: true,
                    title: Text(e),
                    selected: e == nivelSelecionado,
                    value: e, 
                    groupValue: nivelSelecionado, 
                    onChanged: (value) {
                      setState(() {
                        nivelSelecionado = e;
                      });
                    
                    },
                  )
                ).toList()
            ),
      
            const TextLabel('Linguagens Preferidas'),
            Column(
              children: 
                linguagens.map(
                  (e) => CheckboxListTile(
                    title: Text(e),
                    dense: true,
                    value: linguagensSelecionadas.contains(e), 
                    onChanged: (value) {
                      setState(() {
                        if (value!) {
                        linguagensSelecionadas.add(e);
                        } else {
                          linguagensSelecionadas.remove(e);
                        }
                      });                      
                    },
                  )
              ).toList()
            ),

            const TextLabel('Tempo de Experiência:'),
            DropdownButton(
              isExpanded: true,
              items: returnItens(50),
              onChanged: (value) {
                setState(() {
                  tempoExperiencia = int.parse(value.toString());
                });
              },
            ),

            TextLabel('Pretenção Salarial:  ${salarioEscolhido.round()}'),
            Slider(
              min: 0,
              max: 5000,
              value: salarioEscolhido, 
              onChanged: (value) {
                setState(() {
                  salarioEscolhido = value;
                });
              },
            ),

            salvando ? const CircularProgressIndicator() : TextButton(
              onPressed: () {
                validacao(
                  exprecao: nomeController.text.trim().length < 3, 
                  mensagem: 'O nome deve ser preenchido',
                );

                validacao(
                  exprecao: dataNasciController.text == '', 
                  mensagem: 'Data de nascimento inválida',
                );        

                validacao(
                  exprecao: linguagensSelecionadas.length == 0, 
                  mensagem: 'Selecione pelo menos uma linguagem',
                );

                validacao(
                  exprecao: tempoExperiencia == 0, 
                  mensagem: 'Tempo de experiência inválido',
                );

                if (salvar) {
                  setState(() {
                    salvando = true;                    
                  });

                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      salvando = false;
                    });
                    Navigator.pop(context);
                  });            
                }

              }, 
              child: const Text('Salvar'),
            )
            

          ],
        ),
      ),
      )
    );
  }
}
