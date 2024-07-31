import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/components/add_another_profile_button.dart';
import 'package:medicine_reminder_app/components/green_button.dart';
import 'package:medicine_reminder_app/const/constant.dart';
import 'package:medicine_reminder_app/screens/profile_setup_screen.dart';

class SetUpCompleteScreen extends StatelessWidget {
  const SetUpCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35),
                  Image(
                    height: 25,
                    image: AssetImage("images/logo 1.png"),
                  ),
                  Text(
                    "MediCare",
                    style:
                        TextStyle(color: AppColors.subtitleColor, fontSize: 39),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Image(
                      image: AssetImage("images/Group 1.png"),
                      height: 140,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Setup",
                      style: TextStyle(color: Colors.black, fontSize: 36),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Completed",
                      style: TextStyle(color: Colors.black, fontSize: 36),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: AddAnotherProfileButton(
                title: "Add Another Profile",
                onPress: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileSetupScreen(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: GreenButton(
                title: "Continue",
                onPress: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SetUpCompleteScreen(),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
