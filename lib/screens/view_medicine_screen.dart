import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/components/custom_appbar.dart';
import 'package:medicine_reminder_app/components/delete_button.dart';

class ViewMedicineScreen extends StatefulWidget {
  final String profileName;
  final String profileImage;

  const ViewMedicineScreen({
    Key? key,
    required this.profileName,
    required this.profileImage,
  }) : super(key: key);

  @override
  _ViewMedicineScreenState createState() => _ViewMedicineScreenState();
}

class _ViewMedicineScreenState extends State<ViewMedicineScreen> {
  int _currentPage = 0;
  final List<String> _images = [
    'images/OIP 6.png',
    'images/OIP 6.png',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "TAB Fexo 120mg",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      print("Edit button tapped");
                    },
                    child: Image.asset(
                      'images/edit.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
              Text(
                "Fexofenadine 120 mg",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                        offset: Offset(0.0, 5.0),
                      ),
                    ],
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 470,
                    ),
                    child: PageView.builder(
                      itemCount: _images.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Image.asset(
                          _images[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 10),
              DeleteButton(
                title: "Delete",
                onPress: () {
                  print("Delete button tapped");
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
