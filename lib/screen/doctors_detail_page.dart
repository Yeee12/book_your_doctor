import 'package:book_your_doctor/helpers/basic_app_btn.dart';
import 'package:book_your_doctor/helpers/details_card.dart';
import 'package:book_your_doctor/screen/book_appointment.dart';
import 'package:flutter/material.dart';

class DoctorsDetailPage extends StatelessWidget {
  final Map<String, dynamic> doctor;

  const DoctorsDetailPage({required this.doctor, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor Details"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsCard(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              InfoCard(
                icon: Icons.people,
                value: "2000+",
                label: "patients",
              ),   InfoCard(
                icon: Icons.school,
                value: "10+",
                label: "experience",
              ),
              InfoCard(
                icon: Icons.star,
                value: "5",
                label: "rating",
              ),
              InfoCard(
                icon: Icons.comment_outlined,
                value: "1,872",
                label: "reviews",
              ),
            ],
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About Me",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff1F2A37),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10), // Add space
                RichText(
                  text: TextSpan(
                    text:
                    "Dr. David Patel, a dedicated cardiologist, brings a wealth of experience to Golden Gate Cardiology Center in Golden Gate, CA. ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff1F2A37),
                    ),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            // Add functionality for "view more"
                            // For example: navigate to a detailed page or expand text
                          },
                          child: Text(
                            "view more",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
 SizedBox(height: 10,),
 Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    "Working Time",
    style: TextStyle(
    fontSize: 20,
    color: Color(0xff1F2A37),
    fontWeight: FontWeight.w500,
    ),
    ),
      SizedBox(height: 6,),
      Text("Monday-Friday, 08.00 AM-18.00 PM")
        ],
      ),
 ),
          SizedBox(height: 6,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Reviews",
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
          SizedBox(height: 10,),
       ReviewCard(imagePath: "assets/images/Frame.png",
           comment: "Dr. Patel is a true professional who genuinely cares \n about his patients. I highly recommend Dr. Patel to anyone seeking exceptional cardiac care.",
           name: "Emily Anderson",
           rating: 5.0),
          SizedBox(height:10 ,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BasicAppBtn(label: "Book Appointment", onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>BookAppointment()
              ),
              );
            }
            ),
          )
      ],
    ),
    );
  }
}






class InfoCard extends StatelessWidget { // Now it extends StatelessWidget
  final IconData icon;
  final String value;
  final String label;

  const InfoCard({
    required this.icon,
    required this.value,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(
            icon,
            size: 25,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xff4B5563)
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff6B7280)
          ),
        ),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String comment;
  final double rating;

  ReviewCard({
    required this.imagePath,
    required this.comment,
    required this.name,
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0, // No shadow or elevation
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(imagePath), // Profile image
                ),
                SizedBox(width: 10), // Add spacing between the image and text
                Expanded( // Allows the text to take the available space
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: List.generate(
                          rating.toInt(),
                              (index) => Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              comment,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                  letterSpacing: -0.9
              ),
            ),
          ],
        ),
      ),
    );
  }
}
