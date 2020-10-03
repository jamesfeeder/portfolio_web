import 'package:flutter/material.dart';
import 'package:portfolio/page/tab.dart';

void main() {
  runApp(MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jetsadakorn's Portfolio",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabControl()
    );
  }
}
