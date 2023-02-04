import 'package:flutter/material.dart';
import 'package:ancestry_vault/account/login.dart';

class VerifyPasswordReset extends StatefulWidget {
  const VerifyPasswordReset(
      {super.key, required this.code, required this.email});

  final String code;
  final String email;

  @override
  State<VerifyPasswordReset> createState() => _VerifyPasswordReset();
}

class _VerifyPasswordReset extends State<VerifyPasswordReset> {
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const String title = "Verify Password Reset";

    return Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                child: const Text(title),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: codeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Code',
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
                    child: const Text("Reset Password"),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    }),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Did not receave the verification code?"),
                TextButton(onPressed: () {}, child: const Text("Resend")),
              ]),
            ],
          ),
        ));
  }
}
