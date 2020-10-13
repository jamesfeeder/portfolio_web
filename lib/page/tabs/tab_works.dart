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
        Text("Works", style: TextStyle(fontSize: 72, fontWeight: FontWeight.w500)),
        SizedBox(height: 24,),
        // GridView.count(
        //   crossAxisCount: 4,
        // )
      ],
    );
  }
}