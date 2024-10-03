import 'package:flutter/material.dart';
class DoctorImage extends StatelessWidget {
  final String imagePath;

  const DoctorImage({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}


