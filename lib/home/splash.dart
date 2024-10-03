import 'package:book_your_doctor/build/colorsgrid.dart';
import 'package:book_your_doctor/build/doctor_image.dart';
import 'package:book_your_doctor/screen/wlcome_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF000000),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 10,
          childAspectRatio: 0.48,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return ColorsGrid(color: Color(0xffACA1CD));
            case 1:
              return DoctorImage(imagePath: "assets/images/Image 02.png");
            case 2:
              return ColorsGrid(color: Color(0xffDC9497));
            case 3:
              return DoctorImage(imagePath: "assets/images/Image 04.png");
            case 4:
              return DoctorImage(imagePath: "assets/images/Logo.png");
            case 5:
              return DoctorImage(imagePath: "assets/images/Image 06.png");
            case 6:
              return ColorsGrid(color: Color(0xffD7A99C));
            case 7:
              return DoctorImage(imagePath: "assets/images/Image 08.png");
            default:
              return ColorsGrid(color: Color(0xff4D9B91));
          }
        },
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WlcomeScreen()));
  }
}