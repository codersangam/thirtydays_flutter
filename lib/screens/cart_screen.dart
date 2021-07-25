import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
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
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$999".text.xl5.make(),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor)),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Checkout Not Supported Yet".text.make()));
            },
            child: Text("Proceed to Checkout"),
          ).wh(200, 50)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              title: "Item 1".text.make(),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ));
  }
}
