import 'package:flutter/material.dart';

class DoctorsCard extends StatelessWidget {
  final String name;
  final String speciality;
  final String location;
  final double rating;
  final int reviews;
  final String image;
  final VoidCallback onTap; // This callback will be triggered on tap

  const DoctorsCard({
    super.key,
    required this.image,
    required this.location,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.speciality,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onTap, // Call the onTap function when the card is tapped
        child: Stack(
          children: [
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  width: 50,
                  height: 95,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                name,
                style: const TextStyle(
                  fontSize: 16, // Change the font size
                  fontWeight: FontWeight.bold, // Change the font weight
                  color: Colors.black, // Change the text color
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    speciality,
                    style: const TextStyle(fontSize: 16), // Style for speciality
                  ),
                  Text(
                    location,
                    style: const TextStyle(fontSize: 14), // Style for location
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.orangeAccent,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text("$rating  ($reviews Reviews)"),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  // Handle favorite action here if needed
                },
                icon: const Icon(Icons.favorite_border),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
