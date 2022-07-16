import 'package:demo/modal/catalog.dart';
import 'package:demo/widgets/item_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  final int day = 30;
  final String name = 'Kuldip';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: const Text('Hello')),
        drawer: const MyDrawer(),
        body: ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return MyWidget(
              myitems: CatalogModel.items[index],
            );
          },
        ),
      ),
    );
  }
}
