import 'package:flutter/material.dart';
import 'package:portfolio/page/root.dart';

void main() {
  runApp(MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: "Jetsadakorn's Portfolio",
      theme: ThemeData(
        fontFamily: "Raleway",
        primarySwatch: Colors.blue,
      ),
      home: Root()
    );
  }
}
