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
        child: (CatalogModel.items !=null && CatalogModel.items.isNotEmpty)
            ?GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context,index)
          {final item = CatalogModel.items[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: GridTile(
                header: Container(
                    child: Text(item.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    ),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                ),
                  child: Image.network(item.image),
                  footer: Container(
                    child: Text(item.price.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
              ),

            );
          },
          itemCount: CatalogModel.items.length,
        )
        :Center(child: CircularProgressIndicator()),
      ),
      drawer: myDrawer(),
    );
  }
}
