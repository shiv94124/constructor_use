import 'package:flutter/material.dart';
import 'package:constructor_use/tiles.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tiles();
  }
}
