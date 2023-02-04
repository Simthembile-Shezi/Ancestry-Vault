// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DocumentItem extends StatelessWidget {
  const DocumentItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        key: key,
        child: Column(
          children: [Icon(Icons.document_scanner), Text("Doc-20221223-001")],
        ));
  }
}
