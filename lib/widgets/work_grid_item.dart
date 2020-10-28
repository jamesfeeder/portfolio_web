import 'package:flutter/material.dart';

class WorkGridItem extends StatefulWidget {
  @override
  _WorkGridItemState createState() => _WorkGridItemState();
}

class _WorkGridItemState extends State<WorkGridItem> {

  double _opacity = 0;
  int _transDuration = 500;
  double _left = 0;
  double _top = 0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          _opacity = 1;
          // _transDuration = 0;
          // _left = value.localPosition.dx+5;
          // _top = value.localPosition.dy+5;
        });
      },
      onExit: (value) {
        setState(() {
          _opacity = 0;
        });
      },
      onHover: (value) {
        print(value.position);
        setState(() {
          // _transDuration = 400;
          _left = value.localPosition.dx+5;
          _top = value.localPosition.dy+5;
        });
      },
      child: RaisedButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        color: Colors.transparent,
        disabledColor: Colors.grey.withOpacity(0.25),
        hoverColor: Colors.grey[300].withOpacity(0.1),
        highlightColor: Colors.blue[600].withOpacity(0.25),
        splashColor: Colors.blue[300].withOpacity(0.1),
        elevation: 1,
        disabledElevation: 0,
        hoverElevation: 16,
        focusElevation: 8,
        highlightElevation: 8,
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.zero,
          elevation: 0,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                color: Colors.blue,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "An application for Taking Note. Cloud Save and Markdown Text Styling Support.",
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.fade,
                    softWrap: true,
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: _transDuration),
                curve: Curves.fastLinearToSlowEaseIn,
                left: _left,
                top: _top,
                height: 48,
                width: 160,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  opacity: _opacity,
                  child: Card(
                    margin: EdgeInsets.all(8),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Click for more detail"),
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}