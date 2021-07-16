class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

final products = [
  Item(
      id: "1",
      name: "iPhone 12 Max Pro",
      desc: "Best phone in market",
      price: 999,
      color: "#000000",
      image: "https://avatars.githubusercontent.com/u/66767187?v=4")
];
