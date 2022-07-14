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
        appBar: AppBar(
          title: Text('Hello'),
        ),
        body: Center(child: Text("Welcome To $day days of flutter $name")),
        drawer: MyDrawer(),
      ),
    );
  }
}
