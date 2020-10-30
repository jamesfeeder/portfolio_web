import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/models/work.dart';
import 'package:portfolio/theme.dart';

class WorkDetailPage extends StatefulWidget {
  
  final Work data;

  WorkDetailPage({@required this.data});

  @override
  _WorkDetailPageState createState() => _WorkDetailPageState();
}

class _WorkDetailPageState extends State<WorkDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: WebTheme.appBarHeight,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 48,),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(FluentIcons.arrow_left_28_filled),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(height: 36, width: 36, color: Colors.transparent,),
                    SizedBox(width: 48,)
                  ],
                )
              ],
            ),
            SizedBox(height: 0,)
          ],
        ),
      ),
      body: pageBody(),
    );
  }

  Widget pageBody() {
    return ListView(
      padding: WebTheme.defaultPagePadding,
    );
  }
}