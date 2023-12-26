
import 'package:apk1/pages/tarefa_page.dart';
import 'package:flutter/material.dart';

import '../shared/widgets/custom_drawer.dart';
import 'card_page1.dart';
import 'image_assets.dart';
import 'list_view_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State {
  int posicaoPage = 0;

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  posicaoPage = value;
                });
              },
              children: const [
                CardPage(),
                ImageAssetsPage(),
                ListViewPage(),
                TarefaPage()
              ],
            ),
          ),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              controller.jumpToPage(value);
            },
            currentIndex: posicaoPage,
            items: const [
              BottomNavigationBarItem(
                label: 'home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'add',
                icon: Icon(Icons.add),
              ),
              BottomNavigationBarItem(
                label: 'person',
                icon: Icon(Icons.person),
              ),
              BottomNavigationBarItem(
                label: 'alarm',
                icon: Icon(Icons.alarm),
              )
            ],
          ),
        ],
      ),
    );
  }
}