import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/const/constant.dart';
import 'package:medicine_reminder_app/screens/login_screen.dart';
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
      backgroundColor: AppColors.backgroundColor,
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
                  style:
                      TextStyle(color: AppColors.subtitleColor, fontSize: 39),
                ),
              ),
              Spacer(),
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
      AppDurations.splashDuration,
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      ),
    );
  }
}
