import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/components/custom_appbar.dart';
import 'package:medicine_reminder_app/components/listTile.dart';
import 'package:medicine_reminder_app/const/constant.dart';
import 'package:medicine_reminder_app/screens/prescription_screen.dart';

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
      appBar: CustomAppBar(
        profileName: profileName,
        profileImage: profileImage,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Home",
                style: TextStyle(color: Colors.black, fontSize: 36),
              ),
              SizedBox(height: 25),
              CustomListTile(
                imagePath: 'images/prescription.png',
                title: 'Prescription',
                subTitle: '',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrescriptionScreen(
                        profileName: 'FARHAD E HASAN FEH',
                        profileImage: 'images/Mask group.png',
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              CustomListTile(
                imagePath: 'images/medicine.png',
                title: 'Medicine',
                subTitle: '',
                onTap: () {
                  // Navigate to Medicine screen
                },
              ),
              SizedBox(height: 20),
              CustomListTile(
                imagePath: 'images/reminder.png',
                title: 'Reminder',
                subTitle: '',
                onTap: () {
                  // Navigate to Reminder screen
                },
              ),
            ],
          )),
    );
  }
}
