import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/components/custom_appbar.dart';

class AddPrescriptionScreen extends StatefulWidget {
  final String profileName;
  final String profileImage;

  const AddPrescriptionScreen({
    Key? key,
    required this.profileName,
    required this.profileImage,
  }) : super(key: key);

  @override
  State<AddPrescriptionScreen> createState() => _AddPrescriptionScreenState();
}

class _AddPrescriptionScreenState extends State<AddPrescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        profileName: widget.profileName,
        profileImage: widget.profileImage,
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
                "Add Prescription",
                style: TextStyle(color: Colors.black, fontSize: 36),
              ),
              SizedBox(height: 25),
            ],
          )),
    );
  }
}
