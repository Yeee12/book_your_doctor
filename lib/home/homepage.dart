import 'package:book_your_doctor/home/location.dart';
import 'package:book_your_doctor/home/my_bookings.dart';
import 'package:book_your_doctor/screen/see_all.dart';
import 'package:flutter/material.dart';
import 'package:book_your_doctor/helpers/categories_card.dart';
import 'package:book_your_doctor/helpers/nearby_medicals_card.dart';
import 'package:book_your_doctor/screen/profile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0; // Track the selected index for BottomNavigationBar

  // Define a method that returns the current screen based on the selected index
  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return _homeScreen(); // Home screen widget
      case 1:
        return  const Location();
      case 2:
        return const MyBookings(); // Custom content for Appointments
      case 3:
        return const Profile(); // Custom content for Profile
      default:
        return _homeScreen(); // Default to home screen if index is unknown
    }
  }

  // Home screen widget
  Widget _homeScreen() {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    labelText: "Search Doctor",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xff4D9B91),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Looking for\nSpecialist Doctors?",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          "Schedule an appointment with\nour top doctors.",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'assets/images/genivivdoc.png',
                      height: 150.0,
                      width: 110.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1C2A3A),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SeeAll()
                      ),
                      );
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                CategoriesCard(
                    imagePath: "assets/images/Image.png", title: "Dentistry"),
                CategoriesCard(imagePath: "assets/images/Image (1).png",
                    title: "Cardiology"),
                CategoriesCard(imagePath: "assets/images/Image (2).png",
                    title: "Pulmonology"),
                CategoriesCard(
                    imagePath: "assets/images/Image (3).png", title: "General"),
                CategoriesCard(imagePath: "assets/images/Image (4).png",
                    title: "Neurology"),
                CategoriesCard(imagePath: "assets/images/Image (5).png",
                    title: "Gastroenterology"),
                CategoriesCard(imagePath: "assets/images/Image (6).png",
                    title: "Laboratory"),
                CategoriesCard(imagePath: "assets/images/Image (7).png",
                    title: "Vacination"),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nearby Medical Centers",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1C2A3A),
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    NearbyMedicalsCard(
                      imagePath: "assets/images/sunflower.png",
                      title: "Sunrise Health Clinic",
                    ),
                    SizedBox(width: 10), // Add spacing between cards
                    NearbyMedicalsCard(
                      imagePath: "assets/images/1409.png",
                      title: "Golden Care Center",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0 // Show AppBar only on the home page
          ? AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Location",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on),
                    Text(
                      "Seattle, USA",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff374151),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down_sharp),
                  ],
                ),
                Icon(Icons.notification_add),
              ],
            ),
          ],
        ),
      )
          : null,
      // AppBar is null (hidden) for other pages
      body: _getSelectedScreen(),
      // Display the selected screen based on the index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        // Track the selected index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index; // Update the selected index on tap
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "Location",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Appointments",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        selectedItemColor: Colors.green,
        // Color for the selected icon
        unselectedItemColor: Colors.grey, // Color for unselected icons
      ),
    );
  }
}
