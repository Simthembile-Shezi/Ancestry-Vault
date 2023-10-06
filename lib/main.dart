// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'account/login.dart';

void main() {
  //Do not allow landscape mode
  var setPreferredOrientations = SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Application root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vault',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        colorScheme: ColorScheme.dark(),
      ),
      home: const Login(),
    );
  }
}
