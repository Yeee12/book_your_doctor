import 'package:book_your_doctor/helpers/basic_app_btn.dart';
import 'package:book_your_doctor/screen/welcome_screen2.dart';
import 'package:flutter/material.dart';

class WlcomeScreen extends StatelessWidget {
  const WlcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: double.infinity,
            child: Image.asset(
              "assets/images/olddidoc.png",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 40,),
          const Center(
              child: Text('Meet Doctors Online', style: TextStyle(
              fontFamily: "Inter",
              fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff374151)
              ),
              ),
          ),
          SizedBox(height: 5,),
          Center(
            child: Text("Connect with Specialized Doctors Online for\n Convenient and Comprehensive Medical\n Consultations.",
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
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>WelcomeScreen2()
            )
            );
          }
          ),
          SizedBox(height: 12,),
          TextButton(onPressed: () {}, 
              child: Text("Skip")
          )
        ],
      ),
    );
  }
}
