import 'package:flutter/material.dart';

class CategoriesCard extends StatelessWidget {
  final String imagePath; // Explicitly define the type
  final String title;

  const CategoriesCard({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath, // Use the image path
            height: 70,
          ),
          Text(
            title, // Use the title text
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis, // Ensures no overflow
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
