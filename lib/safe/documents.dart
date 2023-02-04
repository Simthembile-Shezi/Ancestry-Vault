// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ancestry_vault/widget/audio_item.dart';
import 'package:ancestry_vault/widget/document_item.dart';
import 'package:flutter/material.dart';

class Document extends StatefulWidget {
  const Document({super.key});

  final String title = "Documents";

  @override
  State<Document> createState() => _Document();
}

class _Document extends State<Document> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: ListView(
            children: _list(),
          ),
        ));
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
        children: [DocumentItem(), DocumentItem(), DocumentItem()]);
    return row;
  }
}
