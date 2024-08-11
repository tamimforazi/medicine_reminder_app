import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const CustomListTile({
    required this.imagePath,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff98A3BB),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
