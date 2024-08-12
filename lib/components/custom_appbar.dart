import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/const/constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String profileName;
  final String profileImage;
  final VoidCallback? onBackButtonPressed;

  const CustomAppBar({
    Key? key,
    required this.profileName,
    required this.profileImage,
    this.onBackButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, size: 20, color: Colors.black),
        onPressed: onBackButtonPressed ?? () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                height: 15,
                image: AssetImage("images/logo 1.png"),
              ),
              Text(
                "MediCare",
                style: TextStyle(
                  color: AppColors.subtitleColor,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Text(
                profileName,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.profileName),
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
