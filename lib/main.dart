import 'package:flutter/material.dart';
import 'package:flutterpractice/homepage.dart';

const Color myColor = Colors.orange;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cocktail App',
      theme: ThemeData(
        primarySwatch: myColor,
      ),
      home: HomePage(),
    );
  }
}
