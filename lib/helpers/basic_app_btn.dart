import 'package:flutter/material.dart';

class BasicAppBtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double paddingHorizontal;
  final double paddingVertical;
  final double borderRadius;
  final Color buttonColor;

  const BasicAppBtn({
    Key? key,
    required this.label,
    required this.onPressed,
    this.paddingHorizontal = 120.0,
    this.paddingVertical = 13.0,
    this.borderRadius = 22.0,
    this.buttonColor = const Color(0xFF1C2A3A),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        backgroundColor: buttonColor,
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
        fontFamily: "Inter",
        color: Color(0xffFFFFFF)),
      ),
    );
  }
}
