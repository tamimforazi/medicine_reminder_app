import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medicine_reminder_app/components/add_another_profile_button.dart';
import 'package:medicine_reminder_app/const/constant.dart';
import 'package:medicine_reminder_app/screens/home_screen.dart';
import 'package:medicine_reminder_app/screens/profile_setup_screen.dart';
import 'package:medicine_reminder_app/screens/login_screen.dart'; // Make sure to import your login screen

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Map<String, String>> profiles = [
    {
      'name': 'FARHAD E HASAN FEH',
      'age': '30',
      'gender': '(M)',
      'weight': '70kg',
      'height': '180cm',
      'imagePath': 'images/Mask group.png',
    },
    {
      'name': 'JANE DOE',
      'age': '28',
      'gender': '(F)',
      'weight': '60kg',
      'height': '165cm',
      'imagePath': 'images/Mask group.png',
    },
    {
      'name': 'JOHN SMITH',
      'age': '35',
      'gender': '(M)',
      'weight': '80kg',
      'height': '175cm',
      'imagePath': 'images/Mask group.png',
    },
  ];

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you really want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LoginScreen(), // Ensure this screen exists
                  ),
                );
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        height: 20,
                        image: AssetImage("images/logo 1.png"),
                      ),
                      Text(
                        "MediCare",
                        style: TextStyle(
                            color: AppColors.subtitleColor, fontSize: 22),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () {
                      _showLogoutConfirmation(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                "Profiles",
                style: TextStyle(color: Colors.black, fontSize: 36),
              ),
              SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  itemCount: profiles.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      key: ValueKey(index),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                                profiles.removeAt(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Profile deleted'),
                                ),
                              );
                            },
                            backgroundColor: const Color(0xffED4E4E),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                profileName: profiles[index]['name']!,
                                profileImage: profiles[index]['imagePath']!,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              color: const Color(0xff98A3BB),
                              child: InkWell(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      profiles[index]['imagePath']!,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            profiles[index]['name']!,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                profiles[index]['age']!,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(width: 20),
                                              Text(
                                                profiles[index]['gender']!,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                profiles[index]['weight']!,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(width: 20),
                                              Text(
                                                profiles[index]['height']!,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: AddAnotherProfileButton(
                  title: "Add Another Profile",
                  onPress: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileSetupScreen(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
