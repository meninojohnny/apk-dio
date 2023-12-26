import 'package:apk1/pages/configuracoes_page.dart';
import 'package:flutter/material.dart';

import '../../pages/date_page.dart';
import '../../pages/login_page.dart';
import '../../pages/numeros_aleatorios_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                  context: context, 
                  builder: (BuildContext bc) => Wrap(
                    children: const [
                      ListTile(
                        title: Text('Camera'),
                        leading: Icon(Icons.camera),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Galeria'),
                        leading: Icon(Icons.photo),
                      ),
                    ],
                  ),
                );
              },
              child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 74, 19, 83),
              ),
              currentAccountPicture: Image.asset('assets/images/user1.png'),
                accountName: const Text('Johnny Vitor'), 
                accountEmail: const Text('Pereirajoaovitor85@gmail.com'), 
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DatePage()),
                );                
              },
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: const [
                    Icon(Icons.person, size: 25),
                    SizedBox(width: 5),
                    Text('Dados Cadastrais'),
                  ],
                ),
              ),
            ),
            const Divider(),

            InkWell(
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                  context: context, 
                  builder: (BuildContext bc) => Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: const [
                        Text('Termo de compromisso', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                        SizedBox(height: 15),
                        Text(                    
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15),
                        ),
                      ],
                    )
                  )
                );
              },
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: const [
                    Icon(Icons.info, size: 25),
                    SizedBox(width: 5),
                    Text('Termos de compromisso'),
                  ],
                ),
              ),
            ),
            const Divider(),

            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ConfiguracoesPage()),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: const [
                    Icon(Icons.settings, size: 25),
                    SizedBox(width: 5),
                    Text('Configurações'),
                  ],
                ),
              ),
            ),
            const Divider(),

            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NumerosAleatoriosPage()),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: const [
                    Icon(Icons.numbers, size: 25),
                    SizedBox(width: 5),
                    Text('Gerador de numeros'),
                  ],
                ),
              ),
            ),
            const Divider(),

            InkWell(
              onTap: () {
                showDialog(context: context, builder: (BuildContext bc) => 
                  AlertDialog(
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    title: const Text('Meu App', style: TextStyle(fontWeight: FontWeight.bold),),
                    content: Wrap(
                      children: const [
                        Text('Realmente deseja sair do aplicativo?')
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          print('não');
                        }, 
                        child: const Text('Não'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, 
                            MaterialPageRoute(builder: (context) => LoginPage())
                          );
                        }, 
                        child: const Text('Sim'),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: const [
                    Icon(Icons.exit_to_app, size: 25),
                    SizedBox(width: 5),
                    Text('Sair'),
                  ],
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Deseja realment sair do aplicativo?');
  }
}