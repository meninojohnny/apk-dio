
import 'package:apk1/repositories/tarefa_repository.dart';
import 'package:flutter/material.dart';

import '../model/tarefa.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {

  TextEditingController descricaoController = TextEditingController();
  TarefaRepository tarefaRepository = TarefaRepository();
  List tarefas = [];
  bool apenasNaoConcluido = false;

  @override
  void initState() {
    super.initState();
    obtertarefas();
  }

  void obtertarefas() async {
    if (apenasNaoConcluido) {
      tarefas = await tarefaRepository.listarNaoConcluido();
    } else {
      tarefas = await tarefaRepository.listar();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          descricaoController.text = '';
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Adicionar tarefa'),
              content: TextField(
                controller: descricaoController,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () async {
                    await tarefaRepository.adicionart(
                      Tarefa(descricaoController.text, false),
                    );
                    Navigator.pop(context);
                    setState(() {});
                  }, 
                  child: const Text('Salvar'),
                ),
              ],
            );
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  Tarefa tarefa = tarefas[index];
                  return Dismissible(
                    onDismissed: (DismissDirection dismissDirection) async {
                      await tarefaRepository.remove(tarefa.id);
                      print(tarefas);
                    },
                    key: Key(tarefa.id),
                    child: ListTile(
                      title: Text(tarefa.descricao),
                      trailing: Switch(
                        onChanged: (value) async {
                          await tarefaRepository.alterar(tarefa.id, value);
                          obtertarefas();
                        }, 
                        value: tarefa.concluido,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}