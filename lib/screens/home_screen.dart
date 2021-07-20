import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:thirtydays_flutter/models/catalog.dart';
import 'package:thirtydays_flutter/widgets/themes.dart';
// import 'package:thirtydays_flutter/widgets/drawer.dart';
// import 'package:thirtydays_flutter/widgets/items_widget.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int days = 30;

  String name = "Sangam";

  bool isMale = true;

  num temp = 30.5;

  var a = 20;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final stringData = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(stringData);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: Vx.m32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            // ignore: unnecessary_null_comparison
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              CatalogList().expand()
            else
              Center(
                child: CircularProgressIndicator(),
              )
          ],
        ),
      ),
    ));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.bold.xl5.make(),
        "Trending Products".text.xl2.make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return CatalogItem(catalog: catalog);
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.bold.make(),
            catalog.desc.text.caption(context).make(),
            ButtonBar(
              buttonPadding: EdgeInsets.zero,
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}".text.make(),
                ElevatedButton(
                  onPressed: () {},
                  child: "Buy".text.make(),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(StadiumBorder())),
                )
              ],
            ).pOnly(right: 10, top: 10)
          ],
        ))
      ],
    )).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .color(MyTheme.cream)
        .rounded
        .p8
        .make()
        .p16()
        .w40(context);
  }
}
