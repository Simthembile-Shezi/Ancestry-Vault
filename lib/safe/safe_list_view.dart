// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, sort_child_properties_last, unused_catch_clause

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:vault/safe/file_item.dart';
import 'package:file_picker/file_picker.dart';

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
        onPressed: () {
          _openFileExplorer();
        },
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

  Future<void> _openFileExplorer() async {
    FilePickerResult? result;
    if (widget.subCollection.compareTo("Pictures") == 0) {
      result = await FilePicker.platform.pickFiles(type: FileType.image);
    } else if (widget.subCollection.compareTo("Videos") == 0) {
      result = await FilePicker.platform.pickFiles(type: FileType.video);
    } else if (widget.subCollection.compareTo("Audios") == 0) {
      result = await FilePicker.platform.pickFiles(type: FileType.audio);
    } else if (widget.subCollection.compareTo("Documents") == 0) {
      result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf', 'docx', 'xlsx', 'txt']);
    }

    if (result != null) {
      addFile(result);
    }
  }

  void addFile(FilePickerResult result) async {
    String filePath = result.files.single.path!;
    String fileName = result.files.single.name;

    CollectionReference collectionRef = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.document)
        .collection(widget.subCollection.toLowerCase());
    DocumentReference<Object?> documentReference = await collectionRef.add({
      "name": fileName,
      "date": Timestamp.now(),
    });
    String extension = fileName.split('.').last;
    _saveToStorage("${documentReference.id}.$extension", File(filePath));
  }

  void _saveToStorage(String fileName, File file) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    String folder = widget.subCollection.toLowerCase();
    Reference storageReference = storage.ref().child('$folder/$fileName');
    try {
      UploadTask uploadTask = storageReference.putFile(file);
      await uploadTask.whenComplete(() => {});
    } on FirebaseException catch (e) {
      // ...
    }
  }
}
