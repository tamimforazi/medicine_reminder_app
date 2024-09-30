import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medicine_reminder_app/components/add_another_profile_button.dart';
import 'package:medicine_reminder_app/components/custom_appbar.dart';
import 'package:medicine_reminder_app/components/listTile.dart';
import 'package:medicine_reminder_app/const/constant.dart';
import 'package:medicine_reminder_app/screens/add_prescription_screen.dart';
import 'package:medicine_reminder_app/screens/medicine_list_screen.dart';

class PrescriptionScreen extends StatefulWidget {
  final String profileName;
  final String profileImage;

  const PrescriptionScreen({
    Key? key,
    required this.profileName,
    required this.profileImage,
  }) : super(key: key);

  @override
  _PrescriptionScreenState createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  List<Map<String, String>> prescriptions = [
    {
      'title': 'Dr. Md Sanaullah',
      'subTitle': '15 June 2024',
      'imagePath': 'images/presc.png',
    },
    {
      'title': 'Dr. Jane Doe',
      'subTitle': '22 July 2024',
      'imagePath': 'images/presc.png',
    },
    {
      'title': 'Dr. John Smith',
      'subTitle': '10 August 2024',
      'imagePath': 'images/presc.png',
    },
  ];

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Prescriptions",
              style: TextStyle(color: Colors.black, fontSize: 36),
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: prescriptions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Slidable(
                    key: Key(prescriptions[index]['title']!),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              prescriptions.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Prescription deleted'),
                              ),
                            );
                          },
                          backgroundColor: AppColors.deleteColour,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CustomListTile(
                        imagePath: prescriptions[index]['imagePath']!,
                        title: prescriptions[index]['title']!,
                        subTitle: prescriptions[index]['subTitle']!,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MedicineListScreen(
                                profileName: widget.profileName,
                                profileImage: widget.profileImage,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: AddAnotherProfileButton(
              title: "Add Prescription",
              onPress: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPrescriptionScreen(
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
