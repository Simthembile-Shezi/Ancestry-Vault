// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:vault/profile/profile.dart';
import 'package:vault/safe/audios.dart';
import 'package:vault/safe/documents.dart';
import 'package:vault/safe/pictures.dart';
import 'package:vault/safe/videos.dart';
import 'package:vault/widget/safe_item_card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title});

  final String title;

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vault"),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(5),
          child: ListView(children: const [
            SafeItemCard(
                title: "Documents",
                icon: Icon(Icons.document_scanner),
                subtitle: "60",
                onPressed: Document()),
            SafeItemCard(
              title: "Pictures",
              icon: Icon(Icons.photo),
              subtitle: "60",
              onPressed: Picture(),
            ),
            SafeItemCard(
              title: "Audios",
              icon: Icon(Icons.audio_file),
              subtitle: "60",
              onPressed: Audio(),
            ),
            SafeItemCard(
              title: "Videos",
              icon: Icon(Icons.video_collection),
              subtitle: "60",
              onPressed: Video(),
            ),
          ])),
    );
  }

  Widget _options(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: ((context, index) => Text("data"))));
  }
}
