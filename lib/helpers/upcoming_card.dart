import 'package:flutter/material.dart';
class UpcomingCard extends StatelessWidget {
  final String status;

  UpcomingCard({required this.status});

  final List<Map<String, String>> bookingData = [
    {
      'date': 'May 22, 2023 - 10.00 AM',
      'doctorName': 'Dr. James Robinson',
      'specialty': 'Orthopedic Surgery',
      'location': 'Elite Ortho Clinic, USA',
      'image': 'assets/images/oldmanai.png' // Placeholder image URL
    },
    {
      'date': 'June 14, 2023 - 03.00 PM',
      'doctorName': 'Dr. Daniel Lee',
      'specialty': 'Gastroenterologist',
      'location': 'Digestive Institute, USA',
      'image': 'assets/images/nosmiledoc.png' // Placeholder image URL
    },
    {
      'date': 'June 21, 2023 - 10.00 AM',
      'doctorName': 'Dr. Martha Lewis',
      'specialty': 'Cardiologist',
      'location': 'Heart Care Clinic, USA',
      'image': 'assets/images/aidoc.png' // Placeholder image URL
    },
    {
      'date': 'June 21, 2023 - 10.00 AM',
      'doctorName': 'Dr. Martha Lewis',
      'specialty': 'Cardiologist',
      'location': 'Heart Care Clinic, USA',
      'image': 'assets/images/lastdoc.png' // Placeholder image URL
    },
    {
      'date': 'June 21, 2023 - 10.00 AM',
      'doctorName': 'Dr. Martha Lewis',
      'specialty': 'Cardiologist',
      'location': 'Heart Care Clinic, USA',
      'image': 'assets/images/genivivdoc.png' // Placeholder image URL
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: bookingData.length,
        itemBuilder: (context, index) {
          final booking = bookingData[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Doctor Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      booking['image']!,
                      width: 60,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  // Doctor Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          booking['date']!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          booking['doctorName']!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          booking['specialty']!,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          booking['location']!,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 10,),
                  // Action Buttons
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          // Add cancel functionality here
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Add reschedule functionality here
                        },
                        child: Text("Reschedule"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
          },
    );
    }
}