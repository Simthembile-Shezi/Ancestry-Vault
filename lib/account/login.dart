import 'package:vault/profile/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:vault/account/register.dart';
import 'package:vault/account/forgot_password.dart';

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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Dashboard(
                                  title: 'Dashboard',
                                )));
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
}
