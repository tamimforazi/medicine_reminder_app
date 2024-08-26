import 'package:flutter/material.dart';

class MedicineItem extends StatelessWidget {
  final String serial;
  final String name;
  final String time;
  final String quantity;
  final bool isEvenIndex;

  const MedicineItem({
    Key? key,
    required this.serial,
    required this.name,
    required this.time,
    required this.quantity,
    required this.isEvenIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = isEvenIndex ? Color(0xffD9DDE9) : Colors.white;
    final textColor = Color(0xff7C7C7C);

    return Container(
      padding: EdgeInsets.all(10),
      color: bgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$serial.',
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
          Text(
            name,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
          Text(
            time,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
          Text(
            quantity,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
