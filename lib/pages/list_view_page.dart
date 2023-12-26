import 'package:apk1/pages/app_images.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State createState() => _StateViewPage();
}

class _StateViewPage extends State {
  @override
  Widget build(BuildContext contex) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user1),
          title: const Text('Regilane'),
          subtitle: const Text('86988345712'),
          trailing: PopupMenuButton(
            onSelected: (menu) {
              print(menu);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(value: 'editar', child: Text('Editar'),),
                const PopupMenuItem(value: 'excluir', child: Text('Excluir'),),
                const PopupMenuItem(value: 'compartilhar', child: Text('Compartilhar'),),
              ];
            },
          ),
        ),

        ListTile(
          leading: Image.asset(AppImages.user2),
          title: const Text('Malu'),
          subtitle: const Text('85987231245'),
          trailing: const Icon(Icons.menu),
        ),

        ListTile(
          leading: Image.asset(AppImages.user3),
          title: const Text('Evelyn'),
          subtitle: const Text('85673423456'),
          trailing: const Icon(Icons.menu),
        ),
      ],
    );
  }
}