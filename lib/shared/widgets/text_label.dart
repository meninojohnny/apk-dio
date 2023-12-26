import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String text;

  const TextLabel(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
      ),
    );
  }
}