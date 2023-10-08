// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:vault/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:vault/safe/safe_item_card.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key, required this.document});

  final String document;

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
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profile(
                            document: widget.document,
                          )));
            },
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(5),
          child: ListView(children: [
            SafeItemCard(
                document: widget.document, //userId
                subCollection: "Documents",
                icon: Icon(
                  Icons.document_scanner,
                  size: 32.0,
                )),
            SafeItemCard(
              document: widget.document,
              subCollection: "Pictures",
              icon: Icon(
                Icons.photo,
                size: 32.0,
              ),
            ),
            SafeItemCard(
              document: widget.document,
              subCollection: "Audios",
              icon: Icon(
                Icons.audio_file,
                size: 32.0,
              ),
            ),
            SafeItemCard(
              document: widget.document,
              subCollection: "Videos",
              icon: Icon(
                Icons.video_collection,
                size: 32.0,
              ),
            ),
          ])),
    );
  }
}
