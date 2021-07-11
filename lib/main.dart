import 'package:flutter/material.dart';
import 'package:thirtydays_flutter/home_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
