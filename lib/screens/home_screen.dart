import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/components/listTile.dart';
import 'package:medicine_reminder_app/const/constant.dart';

class HomeScreen extends StatelessWidget {
  final String profileName;
  final String profileImage;

  const HomeScreen({
    Key? key,
    required this.profileName,
    required this.profileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Image(
                              height: 15,
                              image: AssetImage("images/logo 1.png"),
                            ),
                            Text(
                              "MediCare",
                              style: TextStyle(
                                  color: AppColors.subtitleColor, fontSize: 22),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              profileName,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(profileImage),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "Home",
                      style: TextStyle(color: Colors.black, fontSize: 36),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                CustomListTile(
                  imagePath: 'images/prescription.png',
                  title: 'Prescription',
                  onTap: () {
                    // Navigate to Prescription screen
                  },
                ),
                SizedBox(height: 15),
                CustomListTile(
                  imagePath: 'images/medicine.png',
                  title: 'Medicine',
                  onTap: () {
                    // Navigate to Medicine screen
                  },
                ),
                SizedBox(height: 15),
                CustomListTile(
                  imagePath: 'images/reminder.png',
                  title: 'Reminder',
                  onTap: () {
                    // Navigate to Reminder screen
                  },
                ),
              ],
            )),
      ),
    );
  }
}
