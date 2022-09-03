import 'package:android_studio_projects/core/store.dart';
import 'package:android_studio_projects/models/cart.dart';
import 'package:android_studio_projects/models/catalog.dart';
import 'package:android_studio_projects/utils/routes.dart';
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
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    final decodeJson = jsonDecode(catalogJson); // gives a map

    await Future.delayed(Duration(microseconds: 2));

    var productData = decodeJson["products"];

    await Future.delayed(Duration(microseconds: 2));
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;
    return Scaffold(
        floatingActionButton: VxBuilder(
            mutations: {AddMutation, RemoveMutation},
            builder: (context, store, status) => FloatingActionButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, MyRoutes.cartRoute),
                  backgroundColor: context.theme.buttonColor,
                  child: Icon(CupertinoIcons.cart, color: Colors.white),
                ).badge(color: Vx.red600, size: 20, count: cart.items.length)),
        backgroundColor: context.canvasColor,
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
