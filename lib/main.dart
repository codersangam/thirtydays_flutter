import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int days = 30;
  String name = "Sangam";
  bool isMale = true;
  num temp = 30.5;

  var a = 20;
  static const pi = 3.14;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          child: Container(
            child: Text("Welcome to 30 Days of Flutter"),
          ),
        ),
      ),
    );
  }
}
