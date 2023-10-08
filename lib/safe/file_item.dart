// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vault/safe/file_info.dart';

class FileItem extends StatelessWidget {
  final String documentId; // Name of the file
  final String subCollection; // Type of the file
  final String name;
  final Timestamp datetime;
  final Icon icon;

  FileItem({
    required this.documentId,
    required this.subCollection,
    required this.icon,
    required this.datetime,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: icon,
        subtitle: Text(name),
        onTap: () => showPopupMenu(context),
      ),
    );
  }

  void showPopupMenu(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset position =
        button.localToGlobal(Offset.zero, ancestor: overlay);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(position.dx, position.dy,
          overlay.size.width - position.dx, overlay.size.height - position.dy),
      items: [
        PopupMenuItem<String>(
          value: 'details',
          child: Text('Details'),
        ),
        PopupMenuItem<String>(
          value: 'download',
          child: Text('Download'),
        ),
        PopupMenuItem<String>(
          value: 'delete',
          child: Text('Delete'),
        ),
      ],
    ).then(
      (String? value) async {
        if (value == 'details') {
          DateTime dateTime = datetime.toDate();
          String fdt = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
          List<String> spiltDate = fdt.split(' ');
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return FileInfoPopup(
                name: name,
                date: spiltDate.first,
                time: spiltDate.last,
              );
            },
          );
        } else if (value == 'download') {
          FirebaseStorage storage = FirebaseStorage.instance;
          String folder = subCollection.toLowerCase();
          String extension = name.split(".").last;
          Reference ref = storage.ref().child('$folder/$documentId.$extension');
          var data = await ref.getData(10 * 1024 * 1024);
          if (data != null) {
            final tempDir = await getTemporaryDirectory();
            final file = File('${tempDir.path}/$name');
            await file.writeAsBytes(data);
            await launchUrl(file.uri);
          }
        } else if (value == 'delete') {
          // Handle "Delete" action
          // Call delete function here
        }
      },
    );
  }
}
