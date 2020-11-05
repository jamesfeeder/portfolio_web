import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/theme.dart';

class ImgViewer extends StatefulWidget {
  
  final String url;

  ImgViewer({@required this.url});

  @override
  _ImgViewerState createState() => _ImgViewerState();
}

class _ImgViewerState extends State<ImgViewer> with SingleTickerProviderStateMixin {

  bool isZoomed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          pageContent(),
          navBar(context),
          zoomButton()
        ],
      ),
    );
  }

  Widget navBar(BuildContext context) {
    return Container(
      height: WebTheme.appBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: WebTheme.horizontalPadding,),
                  RaisedButton(
                    shape: StadiumBorder(),
                    color: Colors.black87,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    visualDensity: VisualDensity.standard,
                    elevation: 1,
                    disabledElevation: 0,
                    focusElevation: 4,
                    highlightElevation: 4,
                    hoverElevation: 8,
                    // focusColor: _primaryColor.withOpacity(0.25),
                    hoverColor: Colors.transparent,
                    // highlightColor: _primaryColor.withOpacity(0.25),
                    splashColor: Colors.white38,
                    padding: EdgeInsets.fromLTRB(10, 10, 12, 10),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          FluentIcons.arrow_left_28_filled,
                          color: Colors.white
                        ),
                        SizedBox(width: 8,),
                        Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400, 
                            height: 1,
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(height: 36, width: 36, color: Colors.transparent,),
                  SizedBox(width: WebTheme.horizontalPadding,)
                ],
              )
            ],
          ),
          SizedBox(height: 4)
        ],
      )
    );
  }

  Widget zoomButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: WebTheme.defaultPagePadding,
        child: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              isZoomed = !isZoomed;
            });
          },
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey[850],
          icon: Icon(isZoomed ? FluentIcons.zoom_out_24_filled : FluentIcons.zoom_in_24_filled), 
          label: Text(isZoomed ? "Zoom Out" : "Zoom In"),
        ),
      ),
    );
  }

  Widget pageContent() {
    return SingleChildScrollView(
      child: AnimatedSize(
        vsync: this,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 200),
        reverseDuration: Duration(milliseconds: 100),
        child: GestureDetector(
          onDoubleTap: () {
            setState(() {
              isZoomed = !isZoomed;
            });
          },
          child: Hero(
            tag: "${widget.url}",
            child: Material(
              color: Colors.transparent,
              child: Image.asset(
                widget.url,
                isAntiAlias: false,
                height: isZoomed ? null : MediaQuery.of(context).size.height,
              ),
            ),
          ),
        ),
      ),
    );
  }
}