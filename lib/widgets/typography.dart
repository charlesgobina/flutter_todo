import 'package:flutter/material.dart';

// class that returns text widget
class Texto extends StatelessWidget {
  final String text;
  final TextStyle style;
  const Texto({super.key, required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style,);
  }
}