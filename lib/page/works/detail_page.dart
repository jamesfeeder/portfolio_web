import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:markdown_widget/markdown_generator.dart';
import 'package:portfolio/data/data.dart';
import 'package:portfolio/models/work.dart';
import 'package:portfolio/theme.dart';
import 'package:portfolio/widgets/gallery_grid_item.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkDetailPage extends StatefulWidget {
  
  final Work data;

  WorkDetailPage({@required this.data});

  @override
  _WorkDetailPageState createState() => _WorkDetailPageState();
}

class _WorkDetailPageState extends State<WorkDetailPage> {

  Color _primaryColor;
  Color _secondaryColor;

  @override
  void initState() {
    if (widget.data.projectColor != null) {
      _primaryColor = widget.data.projectColor;
    } else {
      _primaryColor = Colors.black;
    }
    if (widget.data.projectSecondaryColor != null) {
      _secondaryColor = widget.data.projectSecondaryColor;
    } else {
      if (ThemeData.estimateBrightnessForColor(widget.data.projectColor) == Brightness.dark) {
        _secondaryColor = Colors.white;
      } else {

        _secondaryColor = Colors.grey[900];
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          pageContent(),
          navBar(context)
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
                    color: _secondaryColor,
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
                    splashColor: _primaryColor.withOpacity(0.25),
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
                          color: _primaryColor
                        ),
                        SizedBox(width: 8,),
                        Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700, 
                            height: 1,
                            color: _primaryColor
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

  Widget pageContent() {
    return ListView(
      children: [
        header(),
        SizedBox(height: 16),
        description(),
        SizedBox(height: 16),
        gallery()
      ],
    );
  }

  Widget header() {
    return Padding(
      padding: WebTheme.defaultPagePadding
                        .add(EdgeInsets.only(top: WebTheme.appBarHeight))
                        .subtract(EdgeInsets.only(bottom: WebTheme.defaultPagePadding.bottom)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(WebTheme.projectIconBorderRadiusValue),
              side: BorderSide(width: 1.5, color: Colors.black12)
            ),
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.only(right: 16),
            child: Container(
              height: 192,
              width: 192,
              child: Image.asset(widget.data.projectIconUrl),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 193,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    widget.data.title,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 112,
                        child: Text(
                          widget.data.category.length == 1
                          ? "Category"
                          : "Categories",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                          spacing: 4,
                          children: widget.data.category.map(
                            (e) => Text(
                              widget.data.category.last == e 
                              ? CategoryData.categoryList[e] 
                              : CategoryData.categoryList[e]+",",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                              ),
                            )
                          ).toList(),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 112,
                        child: Text(
                          widget.data.technology.length == 1
                          ? "Technology"
                          : "Technologies",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                          spacing: 4,
                          children: widget.data.technology.map(
                            (e) => Text(
                              widget.data.technology.last == e 
                              ? e 
                              : e+",",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                              ),
                            )
                          ).toList(),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 220,
                    child: RaisedButton(
                      //shape: StadiumBorder(),
                      color: _secondaryColor,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      visualDensity: VisualDensity.standard,
                      elevation: 1,
                      disabledElevation: 0,
                      focusElevation: 4,
                      highlightElevation: 4,
                      hoverElevation: 8,
                      // focusColor: widget.data.projectColor.withOpacity(0.25),
                      hoverColor: Colors.transparent,
                      // highlightColor: widget.data.projectColor.withOpacity(0.25),
                      splashColor: _primaryColor.withOpacity(0.25),
                      padding: EdgeInsets.fromLTRB(12, 10, 10, 10),
                      onPressed: () {
                        launch(widget.data.projectRepoUrl);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Visit Project Repository",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700, 
                              height: 1.0,
                              color: _primaryColor,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            FluentIcons.open_24_filled,
                            color: _primaryColor,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget description() {
    return Padding(
      padding: WebTheme.defaultPagePadding.subtract(EdgeInsets.symmetric(vertical: WebTheme.defaultPagePadding.top)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: MarkdownGenerator(
              childMargin: EdgeInsets.symmetric(vertical: 4),
              styleConfig: WebTheme.markdownStyle,
              data: widget.data.longDescription != null
                ? widget.data.longDescription
                : widget.data.description
            ).widgets
          ),
        ],
      ),
    );
  }

  Widget gallery() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: WebTheme.defaultPagePadding.subtract(EdgeInsets.symmetric(vertical: WebTheme.defaultPagePadding.top)),
          child: Text("Gallery", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
        ),
        GridView.count(
          padding: WebTheme.defaultPagePadding.copyWith(top: 16),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 5/5,
          crossAxisCount: MediaQuery.of(context).size.width~/320,
          children: widget.data.galleryUrl.map((e) => GalleryGridItem(
            urls: widget.data.galleryUrl,
            index: widget.data.galleryUrl.indexOf(e))).toList(),
        )
      ],
    );
  }
}