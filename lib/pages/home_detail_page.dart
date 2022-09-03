import 'package:android_studio_projects/widgets/home_widgets/add_to_cart.dart';
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

      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.red800.bold.xl4.make(),
            AddtoCart(catalog: catalog).wh(150,50)
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
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4.color(context.accentColor).bold.make(),
                    catalog.description.text.textStyle(context.captionStyle).lg.make(),
                    10.heightBox, // for a sized box
                    //Dummy Text
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                        "Aliquam bibendum nulla erat, in sodales neque commodo vitae. "
                        "Aliquam sit amet lacinia tellus. Nullam pharetra leo tellus, "
                        "congue maximus. Nam vitae massa.".text.make().p16(),
                  ],

                ).py64(),

              ),
            )
            )

          ],
        ),
      ),
    );
  }
}
