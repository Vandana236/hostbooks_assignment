import 'package:flutter/material.dart';

import 'home.dart';




void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:   HomeScreen(),
    );
  }
}


