// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class FileInfoPopup extends StatelessWidget {
  final String name;
  final String date;
  final String time;

  FileInfoPopup({required this.name, required this.date, required this.time});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('File Information'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Name: $name'),
          SizedBox(height: 8),
          Text('Date: $date'),
          SizedBox(height: 8),
          Text('Time: $time'),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
