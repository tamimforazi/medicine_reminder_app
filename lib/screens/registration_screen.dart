import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/components/green_button.dart';
import 'package:medicine_reminder_app/const/constant.dart';
import 'package:medicine_reminder_app/screens/login_screen.dart';
import 'package:medicine_reminder_app/services/auth_service.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final AuthService _authService = AuthService();

  void _handleRegistration() async {
    if (_formKey.currentState!.validate()) {
      bool success = await _authService.registerUser(
        name: _nameController.text,
        emailOrPhone: _emailOrPhoneController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
      );

      if (success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 35),
                        Image(
                          height: 25,
                          image: AssetImage("images/logo 1.png"),
                        ),
                        Text(
                          "MediCare",
                          style: TextStyle(
                              color: AppColors.subtitleColor, fontSize: 39),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Register",
                          style: TextStyle(
                              color: AppColors.textColor, fontSize: 36),
                        ),
                        SizedBox(height: 20),
                        _buildTextFormField('Name', _nameController, (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          print("name is $value");
                          return null;
                        }),
                        SizedBox(height: 20),
                        _buildTextFormField(
                            'Email or Phone', _emailOrPhoneController, (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email or phone';
                          }
                          print("email is $value");

                          return null;
                        }),
                        SizedBox(height: 20),
                        _buildPasswordField('Password', _passwordController,
                            (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          print("password is $value");

                          return null;
                        }),
                        SizedBox(height: 20),
                        _buildPasswordField(
                            'Confirm Password', _confirmPasswordController,
                            (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          print("confirm password is $value");

                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          print("confirm is $value");

                          return null;
                        }),
                        SizedBox(height: 20),
                        GreenButton(
                          title: "Register",
                          onPress: _handleRegistration,
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            child: Text(
                              "Already have an account? Login now",
                              style: TextStyle(
                                color: Color(0xFF54668E),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildTextFormField(String labelText, TextEditingController controller,
      String? Function(String?) validator) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: AppColors.boxTextColour),
        fillColor: AppColors.inputFillColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
    );
  }

  Widget _buildPasswordField(String labelText, TextEditingController controller,
      String? Function(String?) validator) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: AppColors.boxTextColour),
        fillColor: AppColors.inputFillColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: true,
      validator: validator,
    );
  }
}
