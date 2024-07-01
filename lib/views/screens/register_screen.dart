// ignore_for_file: library_private_types_in_public_api

import 'package:amaliyot_14/model/user.dart';
import 'package:amaliyot_14/service/user_database.dart';
import 'package:amaliyot_14/utils/app_constans.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dbHelper = DatabaseHelper();

  void _register() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    var newUser = User(username: username, password: password);
    await _dbHelper.insertUser(newUser);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.appBarColor,
        title: Text(
          'Register',
          style: TextStyle(
            fontSize: AppConstants.appBarTextSize,
            color: AppConstants.textStyleColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: AppConstants.textStyleSize,
                  color: AppConstants.eleveteButtonColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
