import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/components/green_button.dart';

class Profile_Setup_Screen extends StatelessWidget {
  const Profile_Setup_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: GreenButton(title: "Continue", onPress: () {})),
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
            ]),
      ]),
    );
  }
}
