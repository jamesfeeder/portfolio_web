import 'package:flutter/material.dart';

class WorksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      addRepaintBoundaries: true,
      padding: EdgeInsets.all(88),
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          height: MediaQuery.of(context).size.height-(2*88)-64,
          child: Text("Works", style: TextStyle(fontSize: 72, fontWeight: FontWeight.w500))
        ),
      ],
    );
  }
}