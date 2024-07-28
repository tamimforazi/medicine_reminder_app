import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/components/green_button.dart';

class Profile_Setup_Screen extends StatelessWidget {
  const Profile_Setup_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GreenButton(title: "Continue", onPress: () {}),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 25, right: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 25,
                    image: AssetImage("images/logo 1.png"),
                  ),
                  Text(
                    "MediCare",
                    style: TextStyle(color: Color(0xffBDBDBD), fontSize: 39),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Setup Profile",
                    style: TextStyle(color: Color(0xff000000), fontSize: 36),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      fillColor: Color(0xffd9dde6),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Age',
                                fillColor: Color(0xffd9dde6),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Sex',
                                hintStyle: TextStyle(color: Color(0xff7C7C7C)),
                                fillColor: Color(0xffd9dde6),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 140,
                        height: 145, // height equal to two text fields
                        decoration: BoxDecoration(
                          color: Color(0xffd9dde6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Icon(Icons.camera_alt,
                              color: Colors.white, size: 40),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Weight',
                      fillColor: Color(0xffd9dde6),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Height',
                      fillColor: Color(0xffd9dde6),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
