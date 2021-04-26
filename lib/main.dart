import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/item.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/item': (context) => ItemPage(),
    },
  ));
}
