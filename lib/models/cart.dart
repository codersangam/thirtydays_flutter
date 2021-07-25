import 'package:thirtydays_flutter/models/catalog.dart';

class CartModel {
  late CatalogModel _catalog;

  // Collection of IDs / Store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    // ignore: unnecessary_null_comparison
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price

  num get totalPrice =>
      items.fold(0, (total, element) => total + element.price);

// Add Items
  void add(Item item) {
    _itemIds.add(item.id);
  }

// Remove items
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
