import 'package:flutter/material.dart';
import 'package:thirtydays_flutter/widgets/drawer.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  int days = 30;
  String name = "Sangam";
  bool isMale = true;
  num temp = 30.5;

  var a = 20;
  // static const pi = 3.14;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days Days of Flutter by $name"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
