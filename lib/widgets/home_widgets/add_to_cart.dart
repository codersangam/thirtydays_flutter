import 'package:flutter/material.dart';
import 'package:thirtydays_flutter/core/my_store.dart';
import 'package:thirtydays_flutter/models/cart.dart';
import 'package:thirtydays_flutter/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class AddToCart extends StatelessWidget {
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel? _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart!.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      child: isInCart ? Icon(Icons.done) : "Add to Cart".text.make(),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(context.theme.primaryColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}
