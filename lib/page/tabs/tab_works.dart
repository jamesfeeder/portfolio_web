import 'package:flutter/material.dart';
import 'package:portfolio/theme.dart';

class WorksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: WebTheme.defaultPagePadding.copyWith(bottom: 0),
          child: Text(
            "Works".toUpperCase(),
            style: TextStyle(
              fontSize: 84,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
        GridView.count(
          padding: WebTheme.defaultPagePadding.copyWith(top: 24),
          shrinkWrap: true,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 16/9,
          crossAxisCount: MediaQuery.of(context).size.width~/400,
          children: [
            RaisedButton(
              onPressed: () {},
              color: Colors.transparent,
              disabledColor: Colors.grey.withOpacity(0.25),
              hoverColor: Colors.grey[300].withOpacity(0.1),
              highlightColor: Colors.blue[600].withOpacity(0.25),
              splashColor: Colors.blue[300].withOpacity(0.1),
              elevation: 1,
              disabledElevation: 0,
              hoverElevation: 8,
              focusElevation: 4,
              highlightElevation: 4,
              child: Card(margin: EdgeInsets.zero,),
            ),
            RaisedButton(
              onPressed: () {},
              color: Colors.transparent,
              disabledColor: Colors.grey.withOpacity(0.25),
              hoverColor: Colors.grey[300].withOpacity(0.1),
              highlightColor: Colors.blue[600].withOpacity(0.25),
              splashColor: Colors.blue[300].withOpacity(0.1),
              elevation: 1,
              disabledElevation: 0,
              hoverElevation: 8,
              focusElevation: 4,
              highlightElevation: 4,
              child: Card(margin: EdgeInsets.zero,),
            ),
            RaisedButton(
              onPressed: () {},
              color: Colors.transparent,
              disabledColor: Colors.grey.withOpacity(0.25),
              hoverColor: Colors.grey[300].withOpacity(0.1),
              highlightColor: Colors.blue[600].withOpacity(0.25),
              splashColor: Colors.blue[300].withOpacity(0.1),
              elevation: 1,
              disabledElevation: 0,
              hoverElevation: 8,
              focusElevation: 4,
              highlightElevation: 4,
              child: Card(margin: EdgeInsets.zero,),
            )
          ],
        )
      ],
    );
  }
}