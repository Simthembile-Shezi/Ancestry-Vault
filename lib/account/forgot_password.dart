import 'package:flutter/material.dart';
import 'package:ancestry_vault/account/verify_password_reset.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key, required this.title});

  final String title;

  @override
  State<ForgotPassword> createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                child: Text(widget.title),
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
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                      child: const Text("Submit"),
                      onPressed: () {
                        // ignore: non_constant_identifier_names
                        String VerificationCode = "555555555";
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyPasswordReset(
                                      code: VerificationCode,
                                      email: emailController.text,
                                    )));
                      })),
            ],
          ),
        ));
  }
}
