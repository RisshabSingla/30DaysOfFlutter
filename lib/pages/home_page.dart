import 'package:android_studio_projects/models/catalog.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final int days = 30;
  final String name = "Risshab";

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    // generates a dummy list in order to compensate for lack of data
    return Scaffold(
        appBar: AppBar(
          title: const Text("Catalog App",
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),

          child: ListView.builder(
            itemCount: dummyList.length,    //CatalogModel.items.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                  item: dummyList[index]    //CatalogModel.items[index]
              );
            }
    ),
        ),
    drawer : myDrawer(),
    );
  }
}
