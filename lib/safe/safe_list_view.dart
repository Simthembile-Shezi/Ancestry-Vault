// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, sort_child_properties_last

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:vault/safe/file_item.dart';

class SafeListView extends StatefulWidget {
  final String document;
  final String subCollection;
  final Icon icon;
  final AsyncSnapshot<QuerySnapshot<Object?>> snapshot;
  SafeListView(
      {super.key,
      required this.document,
      required this.subCollection,
      required this.icon,
      required this.snapshot});

  @override
  State<SafeListView> createState() => _SafeListView();
}

class _SafeListView extends State<SafeListView> {
  @override
  Widget build(BuildContext context) {
    List<QueryDocumentSnapshot<Object?>> docs =
        widget.snapshot.data?.docs ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subCollection),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6, // Number of columns in the grid
            childAspectRatio: 1.0, // Aspect ratio of each grid item
          ),
          itemCount: widget.snapshot.data?.size,
          itemBuilder: (BuildContext context, int index) {
            return _fileItem(docs.elementAt(index));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addFile(),
        child: Icon(Icons.add),
        backgroundColor: Colors.purpleAccent,
      ),
    );
  }

  FileItem _fileItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    return FileItem(
      documentId: document.id,
      subCollection: widget.subCollection,
      icon: widget.icon,
      datetime: data['date'],
      name: data['name'],
    );
  }

  void addFile() async {
    File file = File("path.txt");
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    DocumentReference<Object?> documentReference = await users.add({
      "name": "file",
      "date": Timestamp.now(),
    });
    _saveToStorage(documentReference.id, file);
  }

  void _saveToStorage(String id, File file) {
    FirebaseStorage storage = FirebaseStorage.instance;
    String folder = widget.subCollection.toLowerCase();
    String fileName = file.path.toString();
    Reference ref = storage.ref().child('$folder/$fileName');
  }
}
