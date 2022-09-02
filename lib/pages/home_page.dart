import 'package:android_studio_projects/models/catalog.dart';
import 'package:android_studio_projects/utils/routes.dart';
import 'package:android_studio_projects/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:velocity_x/velocity_x.dart";
import 'dart:convert';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';


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
      floatingActionButton: FloatingActionButton(
        onPressed: ()  => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: MyTheme.darkBluish,
        child: Icon(CupertinoIcons.cart),
      ),
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m16, // similar to EdgeInserts.all(32.0),
            child: Column(
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
