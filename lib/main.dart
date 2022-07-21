import 'package:demo/dio/dio.dart';
import 'package:demo/pages/post.dart';
import 'package:demo/pages/web.dart';
import 'package:demo/utils/routes.dart';
import 'package:demo/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:demo/pages/home.dart';
import 'package:demo/pages/restapi.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'It Takes A String',
      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),
      //home: Home(),
      initialRoute: MyRoutes.dioApi,
      routes: {
        MyRoutes.loginRoute: (context) => Login(),
        MyRoutes.homeRoute: (context) => Home(),
        MyRoutes.apiRoute: (context) => ApiClass(),
        MyRoutes.webView: (context) => WebApp(),
        MyRoutes.postApi: (context) => PostApp(),
        MyRoutes.dioApi: (context) => DioApp(),
      },
    );
  }
}
