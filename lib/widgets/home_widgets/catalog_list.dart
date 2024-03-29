import 'package:flutter/material.dart';
import 'package:thirtydays_flutter/models/catalog.dart';
import 'package:thirtydays_flutter/screens/home_detail_screen.dart';
import 'package:thirtydays_flutter/widgets/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_to_cart.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items!.length,
        itemBuilder: (context, index) {
          // final catalog = CatalogModel.items[index];
          final catalog = CatalogModel.items![index];
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomeDetailsScreen(catalog: catalog))),
              child: CatalogItem(catalog: catalog));
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
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            )),
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
                "\$${catalog.price}".text.lg.make(),
                AddToCart(
                  catalog: catalog,
                )
              ],
            ).pOnly(right: 10, top: 10)
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
  }
}
