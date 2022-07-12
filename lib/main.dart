import 'package:flutter/material.dart';
import 'package:demo/pages/home.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'It Takes A String',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ),
      //home: Home(),
      initialRoute: "/",
      routes: {
        "/": (context) => Login(),
        "/home": (context) => Home(),
      },
    );
  }
}
