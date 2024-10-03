import 'package:book_your_doctor/helpers/basic_app_btn.dart';
import 'package:book_your_doctor/screen/welcome_screen3.dart';
import 'package:flutter/material.dart';

class WelcomeScreen2 extends StatelessWidget {
const WelcomeScreen2({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
body: Column(
children: [
Container(
height: MediaQuery.of(context).size.height * 0.65,
width: double.infinity,
child: Image.asset(
"assets/images/blakidoc.png",
fit: BoxFit.cover, // Keeps the zoomed-in effect
),
),
SizedBox(height: 40,),
const Center(
child: Text('Connect with Specialist', style: TextStyle(
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
Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>WelcomeScreen3()
)
);
}
),
SizedBox(height: 12,),
TextButton(onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>WelcomeScreen3()
)
);
},
child: Text("Skip")
)
],
),
);
}
}