import 'package:flutter/material.dart';
import 'package:thirtydays_flutter/models/catalog.dart';
import 'package:thirtydays_flutter/widgets/drawer.dart';
import 'package:thirtydays_flutter/widgets/items_widget.dart';

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
    final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: dummyList[index],
              );
            }),
      ),
      drawer: MyDrawer(),
    );
  }
}
