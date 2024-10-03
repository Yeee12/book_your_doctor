import 'package:flutter/material.dart';

class ButtonForLogin extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double paddingHorizontal;
  final double paddingVertical;
  final double borderRadius;
  final String imagePath; // Keep it as String for asset path

  const ButtonForLogin({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.imagePath, // Now it's treated as a path for the image
    this.paddingHorizontal = 60.0, // Adjusted padding for better layout
    this.paddingVertical = 13.0,
    this.borderRadius = 16.0,
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
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Ensures the button adjusts to content size
        children: [
          Image.asset(
            imagePath, // Load the image using Image.asset
            width: 24, // Adjust image size as needed
            height: 24,
          ),
          const SizedBox(width: 10), // Space between image and text
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: "Inter",
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
