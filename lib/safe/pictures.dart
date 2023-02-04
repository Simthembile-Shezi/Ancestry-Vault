// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ancestry_vault/widget/picture_item.dart';
import 'package:flutter/material.dart';

class Picture extends StatefulWidget {
  const Picture({super.key});

  final String title = "Pictures";

  @override
  State<Picture> createState() => _Picture();
}

class _Picture extends State<Picture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: const EdgeInsets.all(5), child: ListView(children: _list())),
    );
  }

  List<Column> _list() {
    List<Column> list = [];
    for (int i = 0; i < 20; i++) {
      Column column = Column(
        children: [_items()],
      );
      list.add(column);
    }
    return list;
  }

  Row _items() {
    Row row = Row(
        mainAxisSize: MainAxisSize.min,
        children: [PictureItem(), PictureItem(), PictureItem()]);
    return row;
  }
}
