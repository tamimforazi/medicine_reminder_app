import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/const/constant.dart';

class DeleteButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color color;

  DeleteButton(
      {required this.title,
      required this.onPress,
      this.color = AppColors.deleteColour});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          height: MediaQuery.of(context).size.height * .075,
          width: MediaQuery.of(context).size.width * .90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.delete, color: Color(0xffFFFFFF), size: 20),
              Text(
                title,
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
