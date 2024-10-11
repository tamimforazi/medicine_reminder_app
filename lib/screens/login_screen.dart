import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/components/green_button.dart';
import 'package:medicine_reminder_app/const/constant.dart';
import 'package:medicine_reminder_app/screens/profile_screen.dart';
import 'package:medicine_reminder_app/screens/registration_screen.dart';
import 'package:medicine_reminder_app/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      bool success = await _authService.loginUser(
        emailOrPhone: _emailOrPhoneController.text,
        password: _passwordController.text,
      );

      if (success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      }
    }
  }

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
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
                          "Login",
                          style: TextStyle(
                              color: AppColors.textColor, fontSize: 36),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _emailOrPhoneController,
                          decoration: InputDecoration(
                            labelText: 'Email or Phone',
                            labelStyle:
                                TextStyle(color: AppColors.boxTextColour),
                            fillColor: AppColors.inputFillColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email or phone';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle:
                                TextStyle(color: AppColors.boxTextColour),
                            fillColor: AppColors.inputFillColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        GreenButton(
                          title: "Login",
                          onPress: _handleLogin,
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegistrationScreen()),
                              );
                            },
                            child: Text(
                              "Don't have an account? Register now",
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
}
