import 'package:flutter/material.dart';

class ContactTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: MediaQuery.of(context).size.height - 64,
      width: MediaQuery.of(context).size.width,
    );
  }
}