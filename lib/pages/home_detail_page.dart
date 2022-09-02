import 'package:android_studio_projects/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';


class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) :
        assert(catalog!=null) ,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.red800.bold.xl4.make(),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(MyTheme.darkBluish),
                  shape: MaterialStateProperty.all(StadiumBorder()),
                ),
                child: "Buy".text.make()
            ).wh(100,50)
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image
                )
            ).h32(context),
            Expanded(child: VxArc(
              height: 30.0,
             arcType: VxArcType.CONVEY,
             edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4.color(MyTheme.darkBluish).bold.make(),
                    catalog.description.text.textStyle(context.captionStyle).lg.make(),
                    10.heightBox, // for a sized box
                  ],

                ).p64(),

              ),
            )
            )

          ],
        ),
      ),
    );
  }
}
