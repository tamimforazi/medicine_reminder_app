import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicine_reminder_app/screens/profile_setup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image(
              width: MediaQuery.of(context).size.width,
              image: AssetImage("images/00072ba0-1600 1.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width,
                image: AssetImage("images/logo 1.png"),
              ),
              SizedBox(height: 25),
              Center(
                child: Text(
                  "MediCare",
                  style: TextStyle(color: Color(0xffBDBDBD), fontSize: 39),
                ),
              ),
              Spacer(), // This pushes the last image to the bottom
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Profile_Setup_Screen(),
        ),
      ),
    );
  }
}
