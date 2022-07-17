import 'dart:convert';

import 'package:demo/modal/catalog.dart';
import 'package:demo/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int day = 30;
  final String name = 'Kuldip';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogueJson =
        await rootBundle.loadString("assets/files/catalogue.json");
    // print(catalogueJson);

    //decoding json string into another format(map)
    final decodedData = jsonDecode(catalogueJson);
    // print(decodedData);
    // if we have a map and we want to convert it to string -> jsonEncode()

    var productsData = decodedData["products"];
    print(productsData);

    CatalogueModel.items = List.from(productsData)
        .map<MyItems>((item) => MyItems.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummy = List.generate(10, (index) => CatalogModel.items[0]);
    return Material(
      child: Scaffold(
        appBar: AppBar(title: const Text('Hello')),
        drawer: const MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              (CatalogueModel.items != null && CatalogueModel.items!.isNotEmpty)
                  ? ListView.builder(
                      // itemCount: CatalogueModel.items.length,
                      itemCount: CatalogueModel.items?.length,
                      itemBuilder: (context, index) => ItemWidget(
                        myitems: CatalogueModel.items![index],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
        ),
      ),
    );
  }
}
