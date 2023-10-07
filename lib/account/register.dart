import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vault/profile/complete_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class Register extends StatefulWidget {
  const Register({super.key, required this.title});

  final String title;

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String errorMessage = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                child: const Text("Sign up"),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                child: Text(errorMessage),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  obscureText: true,
                  controller: confirmPasswordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                  ),
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                  child: const Text("Sign Up"),
                  onPressed: () {
                    _checkRegister();
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> _checkRegister() async {
    String email = emailController.text.toString();
    String password = passwordController.text.toString();
    String confirmPassword = confirmPasswordController.text.toString();

    if (email.isEmpty) {
      //Error message
    } else if (password.isEmpty) {
      //Error message
    } else if (confirmPassword.isEmpty) {
      //Error message
    } else {
      if (password.compareTo(confirmPassword) == 0) {
        if (await _register(email, password)) {
          _completeRegister(email);
        }
      } else {
        //Error message
      }
    }
  }

  Future<bool> _register(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String? username = userCredential.user!.email;
      if (username != null && username.compareTo(email) == 0) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  void _completeRegister(String email) {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => CompleteProfile(
          title: "Complete Profile",
          email: email,
        ),
      ),
    );
  }
}
