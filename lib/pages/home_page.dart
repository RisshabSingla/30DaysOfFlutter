import 'package:android_studio_projects/models/catalog.dart';
import 'package:android_studio_projects/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:velocity_x/velocity_x.dart";
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
      backgroundColor: MyTheme.creamColor,
        body: SafeArea(
      child: Container(
        padding: Vx.m32, // similar to EdgeInserts.all(32.0),
        child: Column(
          children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              CatalogList().expand()
            else
              Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    ));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluish).make(),
        // similar to Text("Catalog App", style: ( )),
        // xl4 is the size
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemBuilder: (context,index){
          final catalog = CatalogModel.items[index];
          return CatalogItem(catalog: catalog);
        },
    itemCount: CatalogModel.items.length,);
        
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({Key? key, required this.catalog}) :
        assert(catalog!=null),
        super(key: key);

  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluish).bold.make(),
              catalog.description.text.textStyle(context.captionStyle).make(),
              10.heightBox, // for a sized box
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(onPressed: (){},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyTheme.darkBluish),
                        shape: MaterialStateProperty.all(StadiumBorder()),
                      ),
                      child: "Buy".text.make()
                  )
                ],
              ).pOnly(right: 16)
            ],

          )
          )
        ],
      )
    ).white.roundedLg.square(150).make().py16();
  }
}


class CatalogImage extends StatelessWidget {
  const CatalogImage({Key? key, required this.image}) : assert(image!=null),super(key: key);
final String image ;
  @override
  Widget build(BuildContext context) {
    return Image.network(image).
    box.rounded.p8.color(MyTheme.creamColor).make().p12().w40(context);
  }
}

