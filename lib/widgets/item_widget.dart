import 'package:demo/modal/catalog.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final MyItems myitems;

  const MyWidget({Key? key, required this.myitems})
      : assert(myitems != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(myitems.image),
      title: Text(myitems.name),
      subtitle: Text(myitems.desc),
      trailing: Text(myitems.price.toString()),
    );
  }
}
