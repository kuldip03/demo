import 'package:demo/modal/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final MyItems myitems;

  const ItemWidget({Key? key, required this.myitems})
      //: assert(myitems != null),
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        //elevation: 0.0,
        shape: const StadiumBorder(),
        child: ListTile(
          onTap: () {
            print("${myitems.name} is PRESSED");
          },
          leading: Image.network(myitems.image),
          title: Text(myitems.name),
          subtitle: Text(myitems.desc),
          trailing: Text(
            "Rs. ${myitems.price.toString()}",
            textScaleFactor: 1.5,
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
