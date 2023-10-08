// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vault/safe/safe_list_view.dart';

class SafeItemCard extends StatelessWidget {
  final String document;
  final String subCollection;
  final Icon icon;

  SafeItemCard({
    Key? key,
    required this.document,
    required this.subCollection,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Object?>>(
      future: _get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Loading indicator while waiting for data
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          String count = snapshot.data!.size.toString();
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: icon,
                  title: Text(subCollection),
                  subtitle: Text(count),
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SafeListView(
                          document: document,
                          subCollection: subCollection,
                          icon: icon,
                          snapshot: snapshot,
                        ),
                      ),
                    ),
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Future<QuerySnapshot<Object?>> _get() async {
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection('users')
        .doc(document)
        .collection(subCollection.toLowerCase());

    return collectionReference.get();
  }
}
