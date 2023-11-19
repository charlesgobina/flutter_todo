import 'package:flutter/material.dart';

class Arch extends StatelessWidget {
  final String text;
  final double height;
  final double textHeight;
  const Arch({super.key, required this.text, required this.height, this.textHeight = 0.2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * height,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * textHeight,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class LayoutGaps extends StatelessWidget {
  final double gap;
  const LayoutGaps({super.key, required this.gap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * gap,
    );
  }
}