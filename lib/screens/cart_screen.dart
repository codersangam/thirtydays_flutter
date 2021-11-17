import 'package:flutter/material.dart';
import 'package:thirtydays_flutter/core/my_store.dart';
import 'package:thirtydays_flutter/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(Colors.black).make(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel? _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            builder: (context, _, status) {
              return "\$${_cart!.totalPrice}".text.xl5.make();
            },
            mutations: {RemoveMutation},
            notifications: {},
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.primaryColor)),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Checkout Not Supported Yet".text.make()));
            },
            child: Text("Checkout"),
          ).wh(150, 50)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel? _cart = (VxState.store as MyStore).cart;
    return _cart!.items.isEmpty
        ? 'Cart is Empty'.text.xl2.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              title: _cart.items[index].name.text.make(),
              trailing: IconButton(
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                },
                icon: Icon(Icons.delete),
              ),
            ),
          );
  }
}
