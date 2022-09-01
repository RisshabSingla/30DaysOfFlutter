import 'package:android_studio_projects/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
// gives json encoder and decoder

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // before the builder
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeJson = jsonDecode(catalogJson); // gives a map
    // print(decodeJson);

    await Future.delayed(Duration(milliseconds: 2));

    var productData = decodeJson["products"];
    // print(productData);

    await Future.delayed(Duration(milliseconds: 2));
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    // generates a dummy list in order to compensate for lack of data
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items !=null && CatalogModel.items.isNotEmpty)? ListView.builder(
            itemCount: CatalogModel.items.length, //CatalogModel.items.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                  item: CatalogModel.items[index] //CatalogModel.items[index]
                  );
            },
        ):Center(child: CircularProgressIndicator()),
      ),
      drawer: myDrawer(),
    );
  }
}
