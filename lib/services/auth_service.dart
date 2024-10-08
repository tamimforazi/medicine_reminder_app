import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medicine_reminder_app/const/api.dart';

class AuthService {
  Future<bool> registerUser({
    required String name,
    required String emailOrPhone,
    required String password,
    required String confirmPassword,
  }) async {
    final url = Uri.parse('$REGISTER_URI');
    print("url: $url");
    print("name is $name");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'username': emailOrPhone,
        'password': password,
        'password_confirmation': confirmPassword,
      }),
    );
    print("status code: ${response.statusCode}");
    print("response.body: ${response.body}");
    if (response.statusCode == 200) {
      // final responseData = jsonDecode(response.body);
      // print('Registration successful: $responseData');
      Fluttertoast.showToast(
        msg: "Registration successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return true;
    } else {
      Fluttertoast.showToast(
        msg: "Registration failed: ${response.statusCode}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return false;
    }
  }
}
