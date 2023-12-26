import '../model/tarefa.dart';

class TarefaRepository {
  List<Tarefa> _tarefas = [];

  Future<void> adicionart(Tarefa tarefa) async{
    await Future.delayed(const Duration(seconds: 0));
    _tarefas.add(tarefa);
  }

  Future<void> alterar(String id, bool concluido) async {
    await Future.delayed(const Duration(seconds: 0));
    _tarefas.where((tarefa) => tarefa.id == id).first.setConcluido(concluido);
  }

  Future<void> remove(String id) async {
    await Future.delayed(const Duration(seconds: 0));
    _tarefas.remove(_tarefas.where((tarefa) => tarefa.id == id).first);
  }

  Future<List<Tarefa>> listar() async {
    await Future.delayed(Duration(seconds: 1));
    return _tarefas;
  }

  Future<List<Tarefa>> listarNaoConcluido() async {
    await Future.delayed(Duration(seconds: 1));
    return _tarefas.where((tarefa) => !tarefa.concluido).toList();
  }


}