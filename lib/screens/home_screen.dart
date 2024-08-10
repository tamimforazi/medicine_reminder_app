import 'package:flutter/material.dart';
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
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   iconTheme: IconThemeData(color: Colors.black),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Column(
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
                          // Text(
                          //   "Profiles",
                          //   style: TextStyle(color: Colors.black, fontSize: 36),
                          // ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                ],
              ),
              SizedBox(height: 30),
              ListTile(
                leading: Icon(Icons.description, size: 40),
                title: Text('Prescription', style: TextStyle(fontSize: 20)),
                onTap: () {
                  // Navigate to Prescription screen
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.medication, size: 40),
                title: Text('Medicine', style: TextStyle(fontSize: 20)),
                onTap: () {
                  // Navigate to Medicine screen
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.alarm, size: 40),
                title: Text('Reminder', style: TextStyle(fontSize: 20)),
                onTap: () {
                  // Navigate to Reminder screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
