import 'package:flutter/material.dart';

class Appbarwidgets extends StatelessWidget {
  const Appbarwidgets({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Color.fromARGB(255, 60, 133, 12),
            fontWeight: FontWeight.bold,
            fontSize: 25),
      ),
    );
  }
}
