// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:vault/widget/video_item.dart';
import 'package:flutter/material.dart';

class Video extends StatefulWidget {
  const Video({super.key});

  final String title = "Videos";

  @override
  State<Video> createState() => _Video();
}

class _Video extends State<Video> {
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
        children: [VideoItem(), VideoItem(), VideoItem()]);
    return row;
  }
}
