import 'package:book_your_doctor/home/create_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String? fullName;

  @override
  void initState() {
    super.initState();
    getFullName();
  }

  void getFullName() {
    // Fetch the user's display name from FirebaseAuth
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      fullName = user?.displayName ?? 'No Name'; // Default to 'No Name' if null
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap the content with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30), // Add some top padding to make up for no AppBar
              Text(
                "Profile",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Stack(
                alignment: Alignment.bottomRight, // Align the icon to the bottom right
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("assets/images/Vector.png"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff1F2A37), // Background color for the icon
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                fullName ?? "loading..",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Additional Profile Options
              ListTile(
                leading: Icon(Icons.edit_note),
                title: Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 18, color: Color(0xff6B7280)),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>CreateProfile()
                      ),
                      );
                    },
                    icon: Icon(Icons.keyboard_arrow_right_rounded)),
              ),
              Divider(),
              ListTile(
                  leading: Icon(Icons.favorite_border),
                  title: Text(
                    "Favourite",
                    style: TextStyle(fontSize: 18, color: Color(0xff6B7280)),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_right_rounded))),
              Divider(),
              ListTile(
                  leading: Icon(Icons.notification_add_outlined),
                  title: Text(
                    "Notifications",
                    style: TextStyle(fontSize: 18, color: Color(0xff6B7280)),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_right_rounded))),
              Divider(),
              ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(
                    "Settings",
                    style: TextStyle(fontSize: 18, color: Color(0xff6B7280)),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_right_rounded))),
              Divider(),
              ListTile(
                  leading: Icon(Icons.help_center_outlined),
                  title: Text(
                    "Help and Support",
                    style: TextStyle(fontSize: 18, color: Color(0xff6B7280)),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_right_rounded))),
              Divider(),
              ListTile(
                  leading: Icon(Icons.lock_open_outlined),
                  title: Text(
                    "Terms and Condition",
                    style: TextStyle(fontSize: 18, color: Color(0xff6B7280)),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_right_rounded))),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout_outlined),
                title: Text(
                  "Log Out",
                  style: TextStyle(fontSize: 18, color: Color(0xff6B7280)),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.keyboard_arrow_right_rounded),
                  onPressed: () {
                    // Show the bottom sheet when "Log Out" is pressed
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Are you sure you want to log out?",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context); // Close the bottom sheet on cancel
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey[300],
                                      foregroundColor: Colors.black, // Text color
                                    ),
                                    child: Text("Cancel"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      try {
                                        // Firebase log out logic
                                        await FirebaseAuth.instance.signOut();

                                        // Navigate to the login screen after logout
                                        Navigator.pop(context); // Close the bottom sheet
                                        Navigator.pushReplacementNamed(context,
                                            '/Sign In'); // Assuming you have a login route
                                      } catch (e) {
                                        // Handle logout error (if any)
                                        print("Error logging out: $e");
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black, // Log out button color
                                      foregroundColor: Colors.white, // Text color
                                    ),
                                    child: Text("Log Out"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
