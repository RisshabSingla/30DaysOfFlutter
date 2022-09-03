import 'package:android_studio_projects/core/store.dart';
import 'package:android_studio_projects/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

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
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.add(item.id);
    // TODO: implement perform
    throw UnimplementedError();
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
    // TODO: implement perform
    throw UnimplementedError();
  }
}
