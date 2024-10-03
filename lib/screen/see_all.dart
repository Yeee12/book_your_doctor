import 'package:book_your_doctor/screen/doctors_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:book_your_doctor/helpers/doctors_card.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({super.key});

  // Sample doctor data (replace with your actual data)
  final List<Map<String, dynamic>> doctors = const [
    {
      'name': 'Dr. David Pathel',
      'speciality': 'Cardiologist',
      'location': 'New York, USA',
      'rating': 4.5,
      'reviews': 120,
      'image': 'assets/images/olkd2.png',
    },
    {
      'name': 'Dr. Jessica Tunner',
      'speciality': 'Gynecologist',
      'location': 'Los Angeles, USA',
      'rating': 4.8,
      'reviews': 90,
      'image': 'assets/images/orangedoc.png',
    },
    {
      'name': 'Dr. Michael Johnson',
      'speciality': 'Orthopedic',
      'location': 'San Francisco, USA',
      'rating': 4.2,
      'reviews': 130,
      'image': 'assets/images/greenmandoc.png',
    },
    {
      'name': 'Dr. Emilly Stones',
      'speciality': 'General',
      'location': 'Chicago, USA',
      'rating': 4.2,
      'reviews': 130,
      'image': 'assets/images/smillingdoc.png',
    },
    {
      'name': 'Dr. Anabella Oshodi',
      'speciality': 'Orthopedic',
      'location': 'Lake Chad, Nigeria',
      'rating': 4.2,
      'reviews': 130,
      'image': 'assets/images/shinningdoc.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Doctors"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Field
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  labelText: "Search Doctor",
                  labelStyle: TextStyle(color: Colors.grey[700]),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),

          // Filter Chips
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip("All"),
                  _buildFilterChip("General"),
                  _buildFilterChip("Cardiologist"),
                  _buildFilterChip("Laboratory"),
                  _buildFilterChip("Dentistry"),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),
          // Doctors count and sorting
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${doctors.length} found",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1C2A3A),
                  ),
                ),
                Text(
                  "Default",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Doctors List View
          Expanded(
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];

                // Define the specific onTap logic for each doctor
                VoidCallback onTapAction;

                // Unique navigation logic for each doctor
                {
                  onTapAction = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => DoctorsDetailPage(doctor: doctor,),
                      ),
                    );
                  };
                }


                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: DoctorsCard(
                    name: doctor['name'],
                    speciality: doctor['speciality'],
                    location: doctor['location'],
                    rating: doctor['rating'],
                    reviews: doctor['reviews'],
                    image: doctor['image'],
                    onTap: onTapAction, // Call the specific onTapAction
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a FilterChip with selection state
  Widget _buildFilterChip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: FilterChip(
        label: Text(label),
        onSelected: (bool isSelected) {
          // Normally, you'd handle chip selection logic here
        },
        backgroundColor: Colors.grey[300],
        selectedColor: Colors.black26,  // Changes color when selected
      ),
    );
  }
}
