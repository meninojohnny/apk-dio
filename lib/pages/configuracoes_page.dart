import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {

  late SharedPreferences storage;

  bool receberPushNotification = false;
  bool temaEscuro = false;

  final CHAVE_NOME_USUARIO = "CHAVE_NOME_USUARIO";
  final CHAVE_ALTURA_USUARIO = "CHAVE_ALTURA_USUARIO";
  final CHAVE_RECEBER_NOTIFICACOES = "CHAVE_RECEBER_NOTIFICACOES";
  final CHAVE_MODO_ESCURO = "CHAVE_MODO_ESCURO";

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaUsuarioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    storage = await SharedPreferences.getInstance();
    nomeUsuarioController.text = storage.getString( CHAVE_NOME_USUARIO) ?? '';
    alturaUsuarioController.text = (storage.getDouble(CHAVE_ALTURA_USUARIO) ?? 0).toString();
    receberPushNotification = storage.getBool(CHAVE_RECEBER_NOTIFICACOES) ?? false;
    temaEscuro = storage.getBool(CHAVE_MODO_ESCURO) ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea( 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: nomeUsuarioController,
                  decoration: const InputDecoration(
                    hintText: 'Nome do usuário'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: alturaUsuarioController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Altura do usuario'
                  ),
                ),
              ),
              SwitchListTile(
              title: const Text('Receber notificações'),
                value: receberPushNotification, 
                onChanged: (value) {
                  receberPushNotification = value;
                  setState(() {});
                },
              ),
              SwitchListTile(
                title: const Text('tema escuro'),
                value: temaEscuro, 
                onChanged: (value) {
                  temaEscuro = value;
                  setState(() {});
                },
              ),
              TextButton(
                onPressed: () async {
                  // FocusManager.instance.primaryFocus?.unfocus();
                  await storage.setString(CHAVE_NOME_USUARIO, nomeUsuarioController.text);
                  try {
                    await storage.setDouble(CHAVE_ALTURA_USUARIO, double.parse(alturaUsuarioController.text) ?? 0);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Digite uma altura válida! Ex: 1.6',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ),
                    );
                    return;
                  }
                  
                  await storage.setBool(CHAVE_RECEBER_NOTIFICACOES, receberPushNotification);
                  await storage.setBool(CHAVE_MODO_ESCURO, temaEscuro);
                  Navigator.pop(context);
                }, 
                child: const Text('Salvar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}