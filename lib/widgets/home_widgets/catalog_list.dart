import 'package:android_studio_projects/pages/home_detail_page.dart';
import 'package:flutter/material.dart';

import '../../models/catalog.dart';
import 'catalog_items.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog))),
            child: CatalogItem(catalog: catalog));
      },
      itemCount: CatalogModel.items.length,
    );
  }
}
