import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  final String title = "Profile";

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: const EdgeInsets.all(5),
          child: ListView(children: const [Text("Log out")])),
    );
  }
}
