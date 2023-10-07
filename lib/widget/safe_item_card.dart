// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SafeItemCard extends StatelessWidget {
  final String document;
  final String subCollection;
  final Icon icon;
  //final VoidCallback onPressed;
  final Widget onPressed;
  SafeItemCard(
      {super.key,
      required this.document,
      required this.subCollection,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: _getCount(document, subCollection),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Loading indicator while waiting for data
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            String count = snapshot.data ?? '0';
            return Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ListTile(
                  leading: icon,
                  title: Text(subCollection),
                  subtitle: Text(count),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => onPressed));
                  },
                ),
              ]),
            );
          }
        });
  }

  Future<String> _getCount(String document, String subCollection) async {
    CollectionReference songsCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(document)
        .collection(subCollection.toLowerCase());

    QuerySnapshot<Object?> songsSnapshot = await songsCollection.get();

    return songsSnapshot.size.toString();
  }
}
