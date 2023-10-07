import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vault/profile/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:vault/account/register.dart';
import 'package:vault/account/forgot_password.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class Login extends StatefulWidget {
  final String title = "Login";

  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                child: const Text("Welcome to the Vault"),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                child: const Text("Login"),
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
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPassword(
                                  title: "Forgot Password",
                                )));
                  },
                  child: const Text("Forgot password")),
              Container(
                height: 50,
                padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                  child: const Text("Login"),
                  onPressed: () {
                    _checkLogin();
                  },
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Do not have a account?"),
                TextButton(
                    child: const Text("Sign up"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register(
                                    title: 'Sign Up',
                                  )));
                    }),
              ])
            ],
          ),
        ));
  }

  Future<void> _checkLogin() async {
    String email = emailController.text.toString();
    String password = passwordController.text.toString();
    if (email.isEmpty) {
      //Error message
    } else if (password.isEmpty) {
      //Error message
    } else {
      if (await _signIn(email, password)) {
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');
        QuerySnapshot existingUsers =
            await users.where("email", isEqualTo: email).get();

        DocumentSnapshot userDoc = existingUsers.docs.first;
        _completeSignIn(userDoc.id);
      }
    }
  }

  Future<bool> _signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
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

  void _completeSignIn(String document) {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => Dashboard(
          document: document,
        ),
      ),
    );
  }
}
