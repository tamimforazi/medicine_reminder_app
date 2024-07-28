import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color color;

  GreenButton(
      {required this.title,
      required this.onPress,
      this.color = const Color(0xff266643)});

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
          height: MediaQuery.of(context).size.height * .085,
          width: MediaQuery.of(context).size.width * .84,
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
