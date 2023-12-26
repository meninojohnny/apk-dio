import 'package:apk1/pages/app_images.dart';
import 'package:flutter/material.dart';

class ImageAssetsPage extends StatefulWidget {
  const ImageAssetsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ImageAssetsPageState();
}

class _ImageAssetsPageState extends State {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(AppImages.user1, width: 100),
          Image.asset(AppImages.user2, width: 200),
          Image.asset(AppImages.user3, width: 300),
          
        ],
      ),
    );
  }
}