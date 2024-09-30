import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:medicine_reminder_app/components/custom_appbar.dart';
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

  final ImagePicker _picker = ImagePicker(); // Initialize the ImagePicker

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
            SizedBox(height: 25),
            TextField(
              controller: _doctorNameController,
              style: TextStyle(color: AppColors.boxTextColour),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffD9DDE6),
                hintText: 'Doctor\'s Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _pickDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xffD9DDE6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _selectedDate != null
                      ? _selectedDate.toString().split(' ')[0]
                      : 'Select Date',
                  style: TextStyle(color: AppColors.boxTextColour),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _captureImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffD9DDE6),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                  child: Text('Capture Image',
                      style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: _uploadImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffD9DDE6),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                  child: Text('Upload Image',
                      style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (_image != null)
              Image.file(
                _image!,
                height: 200,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
    );
  }
}
