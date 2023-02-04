import 'package:ancestry_vault/profile/dashboard.dart';
import 'package:flutter/material.dart';

class CompleteProfile extends StatefulWidget {
  final String title;

  const CompleteProfile({super.key, required this.title});

  @override
  State<CompleteProfile> createState() => _CompleteProfile();
}

class _CompleteProfile extends State<CompleteProfile> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController maidenNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();

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
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: secondNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Second Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: maidenNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Maiden Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: nickNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nick Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: genderController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Gender',
                  ),
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                  child: const Text("Save"),
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
            ],
          ),
        ));
  }
}
