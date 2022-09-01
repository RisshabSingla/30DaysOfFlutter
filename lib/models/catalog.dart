class Item {
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item(
      {this.id = 0,
      this.name = "",
      this.description = "",
      this.price = 0,
      this.color = "",
      this.image = ""});
}

class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "Apple iPhone 12 Pro Max",
        description: "Apple iPhone 12th Generation",
        price: 999,
        color: "#33505a",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkRNmXnENOc58p4BFvUnpm4MqmKuhM75GpQg&usqp=CAU"
    )
  ];
}
