import 'package:book_your_doctor/authenticate/sign_in.dart';
import 'package:book_your_doctor/helpers/basic_app_btn.dart';
import 'package:book_your_doctor/home/homepage.dart';
import 'package:flutter/material.dart';

class WelcomeScreen3 extends StatelessWidget {
  const WelcomeScreen3 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: double.infinity,
            child: Image.asset(
              "assets/images/greenmandoc.png",
              fit: BoxFit.cover, // Keeps the zoomed-in effect
            ),
          ),
          SizedBox(height: 40,),
          const Center(
            child: Text('Thousands of Online Specialists', style: TextStyle(
                fontFamily: "Inter",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff374151)
            ),
            ),
          ),
          SizedBox(height: 5,),
          Center(
            child: Text(" Explore a Vast Array of Online Medical\n Specialists, Offering an Extensive Range of\n Expertise Tailored to Your Healthcare Needs..",
              style: TextStyle(
                fontFamily: "Inter" ,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 18,),
          BasicAppBtn(label: "Next", onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignIn()
           )
           );
          }
          ),
          SizedBox(height: 12,),
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignIn(),
            ),
            );
          },
              child: Text("Skip")
          )
        ],
      ),
    );
  }
}
