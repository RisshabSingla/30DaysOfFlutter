import 'package:android_studio_projects/models/catalog.dart';

class CartModel {
  //catalog field
  late CatalogModel _catalog;

  // Collection of Ids ----> stores ids of the items
  final List<int> _itemIds = [];

  // get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in cart

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get total price

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
