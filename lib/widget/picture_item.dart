// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class PictureItem extends StatelessWidget {
  const PictureItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        key: key,
        child: Column(
          children: [
            Icon(Icons.image), //image
            Text("Img-20221223-001")
          ],
        ));
  }
}
