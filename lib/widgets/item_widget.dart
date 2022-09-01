import 'package:flutter/material.dart';

import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // shape: StadiumBorder(),  // to do the rounded corners
      child: ListTile(
        onTap: (){
          print("${item.name} pressed ");
          },
        leading:Image.network(item.image) ,      //asset('assets/images/login_image.png'),    //Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.description),
        trailing: Text("\$${ item.price}",
          textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
        )
          ),

      ),
    );
  }
}