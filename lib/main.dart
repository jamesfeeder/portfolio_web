import 'package:flutter/material.dart';
import 'package:portfolio/page/root.dart';
import 'package:portfolio/theme.dart';

void main() {
  runApp(MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: "Jetsadakorn's Portfolio",
      theme: WebTheme.themeData,
      home: Root()
    );
  }
}
