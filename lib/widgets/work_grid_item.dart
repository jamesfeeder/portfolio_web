import 'package:flutter/material.dart';

class WorkGridItem extends StatefulWidget {
  @override
  _WorkGridItemState createState() => _WorkGridItemState();
}

class _WorkGridItemState extends State<WorkGridItem> {

  // Card Var
  double _elevation = 1;

  // Overlay Var
  double _opacity = 0;
  int _transDuration = 500;
  double _left = 0;
  double _top = 0;

  @override
  Widget build(BuildContext context) {
    int _gridCol = MediaQuery.of(context).size.width~/400;
    double _cardWidth = (MediaQuery.of(context).size.width-(88*2)+((_gridCol-1)*16))/_gridCol;
    double _cardHeight = _cardWidth*(2/3);
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          _elevation = 8;
          _opacity = 1;
          _transDuration = 0;
          _left = value.localPosition.dx+5;
          _top = value.localPosition.dy+5;
        });
      },
      onExit: (value) {
        setState(() {
          _elevation = 1;
          _opacity = 0;
        });
      },
      onHover: (value) {
        // print("${value.localPosition}, $_cardWidth, $_cardHeight");
        setState(() {
          _transDuration = 500;
          if (value.localPosition.dx+160+16+4 < _cardWidth) {
            _left = value.localPosition.dx+5;
          } else {
            _left = _cardWidth-160-16-4;
          }
          if (value.localPosition.dy+48+16 < _cardHeight) {
            _top = value.localPosition.dy+5;
          } else {
            _top = _cardHeight-48-16;
          }
        });
      },
      child: card()
    );
  }

  Widget card() {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      alignment: AlignmentDirectional.center,
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.zero,
          elevation: _elevation,
          child: Stack(
            clipBehavior: Clip.none,
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Quicknote",
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(128),
                                  color: Colors.grey[200]
                                ),
                                margin: EdgeInsets.only(left: 4),
                                padding: EdgeInsets.all(8),
                                child: Text("Progressive Web Apps", style: TextStyle(fontSize: 12),),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(128),
                                  color: Colors.grey[200]
                                ),
                                margin: EdgeInsets.only(left: 4),
                                padding: EdgeInsets.all(8),
                                child: Text("Mobile Apps", style: TextStyle(fontSize: 12),),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        "An application for Taking Note. Cloud Save and Markdown Text Styling Support.",
                        style: TextStyle(fontSize: 16),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                    ],
                  )
                ),
              ),
            ],
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
    );
  }
}