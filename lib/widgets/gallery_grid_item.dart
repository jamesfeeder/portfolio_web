import 'package:flutter/material.dart';
import 'package:portfolio/page/works/img_viewer.dart';
import 'package:portfolio/theme.dart';

class GalleryGridItem extends StatefulWidget {

  final List<String> urls;
  final int index;

  GalleryGridItem({Key key, @required this.urls, @required this.index})  : super(key: key);

  @override
  _GalleryGridItemState createState() => _GalleryGridItemState();
}

class _GalleryGridItemState extends State<GalleryGridItem> {
  
  // Overlay Var
  double _opacity = 0;
  int _transDuration = 500;
  double _left = 0;
  double _top = 0;

  @override
  Widget build(BuildContext context) {
    int _gridCol = MediaQuery.of(context).size.width~/320;
    double _cardWidth = (MediaQuery.of(context).size.width-(WebTheme.horizontalPadding*2)+((_gridCol-1)*16))/_gridCol;
    double _cardHeight = _cardWidth*(5/5);
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
        setState(() {
          _transDuration = 500;
          if (value.localPosition.dx+200+16+4+8 < _cardWidth) {
            _left = value.localPosition.dx+5;
          } else {
            _left = _cardWidth-200-16-4-8;
          }
          if (value.localPosition.dy+48+16+8 < _cardHeight) {
            _top = value.localPosition.dy+5;
          } else {
            _top = _cardHeight-48-16-8;
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(WebTheme.cardBorderRadiusValue)),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ImgViewer(url: widget.urls[widget.index])
              )
            );
          },
          color: Colors.white,
          clipBehavior: Clip.antiAlias,
          padding: EdgeInsets.zero,
          elevation: 1,
          disabledElevation: 0,
          focusElevation: 4,
          highlightElevation: 4,
          hoverElevation: 8,
          child: Hero(
            tag: "${widget.urls[widget.index]}",
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: cardWidth,
                height: cardHeight,
                child: Image.asset(
                  widget.urls[widget.index],
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          )
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: _transDuration),
          curve: Curves.fastLinearToSlowEaseIn,
          left: _left,
          top: _top,
          height: 48,
          width: 200,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: _opacity,
            child: IgnorePointer(
              child: Card(
                margin: EdgeInsets.all(8),
                elevation: 4,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Click to Open in Full Screen"),
                  ),
                ),
              ),
            )
          ),
        )
      ],
    );
  }
}