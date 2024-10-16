import 'package:flutter/material.dart';

class AddAnotherProfileButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color color;

  AddAnotherProfileButton(
      {required this.title,
      required this.onPress,
      this.color = const Color(0xff54668E)});

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
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
