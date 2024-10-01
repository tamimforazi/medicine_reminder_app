import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:medicine_reminder_app/components/custom_appbar.dart';
import 'package:medicine_reminder_app/components/add_another_profile_button.dart';
import 'package:medicine_reminder_app/const/constant.dart';

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
  final TextEditingController _doctorNameController = TextEditingController();
  DateTime? _selectedDate;
  File? _image;

  final ImagePicker _picker = ImagePicker();

  void _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _captureImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final boxHeight = MediaQuery.of(context).size.height * 0.075;
    final boxWidth = MediaQuery.of(context).size.width * 0.90;

    return Scaffold(
      appBar: CustomAppBar(
        profileName: widget.profileName,
        profileImage: widget.profileImage,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Prescription",
              style: TextStyle(color: Colors.black, fontSize: 36),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _doctorNameController,
              style: TextStyle(color: AppColors.boxTextColour),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffD9DDE6),
                hintText: 'Doctor\'s Name',
                hintStyle: TextStyle(color: AppColors.boxTextColour),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _pickDate(context),
              child: Container(
                height: boxHeight,
                width: boxWidth,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xffD9DDE6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _selectedDate != null
                        ? _selectedDate.toString().split(' ')[0]
                        : 'Select Date',
                    style: TextStyle(
                        color: AppColors.boxTextColour,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.42,
                  decoration: BoxDecoration(
                    color: Color(0xffD9DDE6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: _captureImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt, color: AppColors.boxTextColour),
                        SizedBox(height: 5),
                        Text(
                          'Capture',
                          style: TextStyle(color: AppColors.boxTextColour),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.42,
                  decoration: BoxDecoration(
                    color: Color(0xffD9DDE6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: _uploadImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload, color: AppColors.boxTextColour),
                        SizedBox(height: 5),
                        Text(
                          'Upload',
                          style: TextStyle(color: AppColors.boxTextColour),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            if (_image != null)
              Image.file(
                _image!,
                height: 200,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 10),
            Container(
              height: boxHeight,
              width: boxWidth,
              decoration: BoxDecoration(
                color: Color(0xffD9DDE6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .transparent, // Transparent for BoxDecoration to take effect
                  shadowColor: Colors.transparent, // Remove shadow
                ),
                child: Text('Add Medicine',
                    style: TextStyle(
                        color: AppColors.boxTextColour,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Spacer(), // Added space after the "Save" button
            AddAnotherProfileButton(
              title: "Save",
              onPress: () {
                print("Save button tapped");
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
