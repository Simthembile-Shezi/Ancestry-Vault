import 'package:vault/profile/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompleteProfile extends StatefulWidget {
  final String email;

  const CompleteProfile({super.key, required this.email});

  @override
  State<CompleteProfile> createState() => _CompleteProfile();
}

class _CompleteProfile extends State<CompleteProfile> {
  TextEditingController titleController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController maidenNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  String errorMessage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Complete Profile"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                child: const Text("Complete Profile"),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
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
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: fullNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
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
                  controller: dateOfBirthController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Date of Birth',
                  ),
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                  child: const Text("Save"),
                  onPressed: () => _updateUserProfile(widget.email),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> _updateUserProfile(String email) async {
    String title = titleController.text.toString();
    String gender = genderController.text.toString();
    String fullName = fullNameController.text.toString();
    String maidenName = maidenNameController.text.toString();
    String lastName = lastNameController.text.toString();
    String dateOfBirth = dateOfBirthController.text.toString();

    if (title.isEmpty) {
      errorMessage = "Enter title";
    } else if (gender.isEmpty) {
      errorMessage = "Enter gender";
    } else if (fullName.isEmpty) {
      errorMessage = "Enter full name";
    } else if (lastName.isEmpty) {
      errorMessage = "Enter last name";
    } else if (dateOfBirth.isEmpty) {
      errorMessage = "Enter date of birth";
    } else {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      DocumentReference<Object?> documentReference = await users.add({
        "email": email,
        "title": title,
        "gender": gender,
        "fullName": fullName,
        "maidenName": maidenName,
        "lastName": lastName,
        "dateOfBirth": dateOfBirth,
      });
      _completeUpdateProfile(documentReference.id);
    }
  }

  void _completeUpdateProfile(String document) {
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
