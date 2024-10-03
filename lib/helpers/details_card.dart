import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 120,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/olkd2.png",
                height:  140,
                width: 95,
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr David Patel",
                  style: TextStyle(fontWeight: FontWeight.bold), // Optional: Make the name bold
                ),
                SizedBox(height: 10), // Add some space above the Divider
                Text("Cardiologist", style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff4B5563)
                ),), // Corrected the spelling to "Dentist"
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 4),
                    Text("Golden Cardiology Center", style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff4B5563),
                      fontWeight: FontWeight.normal
                    ),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
