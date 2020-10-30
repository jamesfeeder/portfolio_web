import 'package:flutter/material.dart';
import 'package:portfolio/models/work.dart';
import 'package:portfolio/page/works/detail_page.dart';
import 'package:portfolio/theme.dart';

class WorkGridItem extends StatefulWidget {
  
  final Work data;

  WorkGridItem({@required this.data});

  @override
  _WorkGridItemState createState() => _WorkGridItemState();
}

class _WorkGridItemState extends State<WorkGridItem> {

  // Overlay Var
  double _opacity = 0;
  int _transDuration = 500;
  double _left = 0;
  double _top = 0;

  @override
  Widget build(BuildContext context) {
    int _gridCol = MediaQuery.of(context).size.width~/400;
    double _cardWidth = (MediaQuery.of(context).size.width-(48*2)+((_gridCol-1)*16))/_gridCol;
    double _cardHeight = _cardWidth*(4/5);
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          _opacity = 1;
          _transDuration = 0;
          _left = value.localPosition.dx+5;
          _top = value.localPosition.dy+5;
        });
      },
      onExit: (value) {
        setState(() {
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
      child: card(_cardWidth,_cardHeight)
    );
  }

  Widget card(double cardWidth,double cardHeight) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      alignment: AlignmentDirectional.center,
      children: [
        RaisedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => WorkDetailPage(data: widget.data)
              )
            );
          },
          color: Colors.white,
          clipBehavior: Clip.hardEdge,
          padding: EdgeInsets.zero,
          elevation: 1,
          disabledElevation: 0,
          focusElevation: 4,
          highlightElevation: 4,
          hoverElevation: 8,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                width: cardWidth,
                height: cardHeight*0.6,
                child: Image.asset(
                  widget.data.cardThumbnailUrl,
                  alignment: widget.data.cardThumbnailAlignment == null 
                    ? Alignment.center 
                    : widget.data.cardThumbnailAlignment,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  color: Colors.white,
                  width: cardWidth,
                  height: cardHeight*0.4,
                  child: Padding(
                    padding: WebTheme.defaultItemPadding,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.data.title,
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: widget.data.category.map((e) => categoryChip(e)).toList(),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          widget.data.description,
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.fade,
                          softWrap: true,
                        ),
                      ],
                    )
                  ),
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

  Widget categoryChip(String category) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(128),
        color: Colors.grey[200]
      ),
      margin: EdgeInsets.only(left: 4),
      padding: EdgeInsets.all(8),
      child: Text(category, style: TextStyle(fontSize: 12),),
    );
  }
}