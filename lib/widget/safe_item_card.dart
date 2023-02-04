// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SafeItemCard extends StatelessWidget {
  final String title;
  final Icon icon;
  final String subtitle;
  //final VoidCallback onPressed;
  final Widget onPressed;
  const SafeItemCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.subtitle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        ListTile(
          leading: icon,
          title: Text(title),
          subtitle: Text(subtitle),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => onPressed));
          },
          trailing: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ),
      ]),
    );
  }
}
