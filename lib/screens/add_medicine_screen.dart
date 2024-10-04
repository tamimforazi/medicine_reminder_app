import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicine_reminder_app/components/add_another_profile_button.dart';
import 'dart:io';
import 'package:medicine_reminder_app/components/custom_appbar.dart';
import 'package:medicine_reminder_app/const/constant.dart';
import 'package:medicine_reminder_app/screens/medicine_screen.dart';

class AddMedicineScreen extends StatefulWidget {
  final String profileName;
  final String profileImage;

  const AddMedicineScreen({
    Key? key,
    required this.profileName,
    required this.profileImage,
  }) : super(key: key);

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final TextEditingController _medicineNameController = TextEditingController();
  final TextEditingController _medicineGroupController =
      TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  String? _medicineType;
  String? _instruction;
  String? _quantity;
  final List<String> _selectedTimes = [];
  File? _image;

  final ImagePicker _picker = ImagePicker();

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

  void _addTime() {
    if (_timeController.text.isNotEmpty) {
      setState(() {
        _selectedTimes.add(_timeController.text);
        _timeController.clear();
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Medicine",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),

                  TextField(
                    controller: _medicineNameController,
                    style: TextStyle(color: AppColors.boxTextColour),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffD9DDE6),
                      hintText: 'Medicine Name',
                      hintStyle: TextStyle(color: AppColors.boxTextColour),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  TextField(
                    controller: _medicineGroupController,
                    style: TextStyle(color: AppColors.boxTextColour),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffD9DDE6),
                      hintText: 'Medicine Group',
                      hintStyle: TextStyle(color: AppColors.boxTextColour),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  DropdownButtonFormField<String>(
                    value: _medicineType,
                    onChanged: (newValue) {
                      setState(() {
                        _medicineType = newValue;
                      });
                    },
                    items: [
                      'Tablet',
                      'Capsule',
                      'Syrup',
                      'Injection',
                      'Inhaler',
                      'Drop'
                    ]
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffD9DDE6),
                      hintText: 'Medicine Type',
                      hintStyle: TextStyle(color: AppColors.boxTextColour),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Time Input with Add Button
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _timeController,
                          style: TextStyle(color: AppColors.boxTextColour),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffD9DDE6),
                            hintText: 'Select Time',
                            hintStyle:
                                TextStyle(color: AppColors.boxTextColour),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedTime != null) {
                              _timeController.text = pickedTime.format(context);
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: _addTime,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff54668E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Display selected times
                  if (_selectedTimes.isNotEmpty)
                    Wrap(
                      spacing: 8.0,
                      children: _selectedTimes.map((time) {
                        return Chip(
                          label: Text(time),
                          backgroundColor: Color(0xffD9DDE6),
                          onDeleted: () {
                            setState(() {
                              _selectedTimes.remove(time);
                            });
                          },
                        );
                      }).toList(),
                    ),
                  SizedBox(height: 10),
                  // Instruction Dropdown
                  DropdownButtonFormField<String>(
                    value: _instruction,
                    onChanged: (newValue) {
                      setState(() {
                        _instruction = newValue;
                      });
                    },
                    items: ['N/A', 'Before Meal', 'After Meal']
                        .map((instruction) => DropdownMenuItem(
                              value: instruction,
                              child: Text(instruction),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffD9DDE6),
                      hintText: 'Instruction',
                      hintStyle: TextStyle(color: AppColors.boxTextColour),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Quantity Dropdown
                  DropdownButtonFormField<String>(
                    value: _quantity,
                    onChanged: (newValue) {
                      setState(() {
                        _quantity = newValue;
                      });
                    },
                    items: ['1', '2', '3', '4', '5']
                        .map((quantity) => DropdownMenuItem(
                              value: quantity,
                              child: Text(quantity),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffD9DDE6),
                      hintText: 'Quantity',
                      hintStyle: TextStyle(color: AppColors.boxTextColour),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Image capture and upload buttons
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
                              Icon(Icons.camera_alt,
                                  color: AppColors.boxTextColour),
                              SizedBox(height: 5),
                              Text(
                                'Capture',
                                style:
                                    TextStyle(color: AppColors.boxTextColour),
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
                              Icon(Icons.upload,
                                  color: AppColors.boxTextColour),
                              SizedBox(height: 5),
                              Text(
                                'Upload',
                                style:
                                    TextStyle(color: AppColors.boxTextColour),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80), // Add some space before the save button
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            right: 20,
            child: AddAnotherProfileButton(
              title: "Save",
              onPress: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MedicineScreen(
                    profileName: 'FARHAD E HASAN FEH',
                    profileImage: 'images/Mask group.png',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
