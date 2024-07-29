import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/components/green_button.dart';
import 'package:medicine_reminder_app/const/constant.dart';

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
                  Image(
                    image: AssetImage("images/Group 1.png"),
                    height: 30,
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
