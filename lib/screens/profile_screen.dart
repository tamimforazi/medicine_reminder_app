import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medicine_reminder_app/components/add_another_profile_button.dart';
import 'package:medicine_reminder_app/const/constant.dart';
import 'package:medicine_reminder_app/screens/profile_setup_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Image(
                      height: 15,
                      image: AssetImage("images/logo 1.png"),
                    ),
                    Text(
                      "MediCare",
                      style: TextStyle(
                          color: AppColors.subtitleColor, fontSize: 22),
                    ),
                    Text(
                      "Profiles",
                      style: TextStyle(color: Colors.black, fontSize: 36),
                    ),
                    Expanded(
                      child: ListView(
                        children: List.generate(
                          6,
                          (index) {
                            return Slidable(
                              key: ValueKey(index),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                dismissible:
                                    DismissiblePane(onDismissed: () {}),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {},
                                    backgroundColor: const Color(0xffED4E4E),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(15.0),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                decoration: BoxDecoration(
                                  color: const Color(0xff98A3BB),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              "images/Mask group.png"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "FARHAD E HASAN FEH",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "30",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(width: 20),
                                              Text(
                                                "(M)",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "70kg",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(width: 20),
                                              Text(
                                                "180cm",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
