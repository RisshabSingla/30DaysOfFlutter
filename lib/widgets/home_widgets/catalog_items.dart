import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../../widgets/themes.dart';
import 'catalog_image.dart';

class CatalogItem extends StatelessWidget {
  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()) ,
            child: CatalogImage(image: catalog.image)
        ),
        Expanded(
            child: Column(
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
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkBluish),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
                    child: "Buy".text.make())
              ],
            ).pOnly(right: 16)
          ],
        ))
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}
