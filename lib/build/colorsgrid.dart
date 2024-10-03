import 'package:flutter/material.dart';

class ColorsGrid extends StatelessWidget {
  final Color color;

  const ColorsGrid({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}