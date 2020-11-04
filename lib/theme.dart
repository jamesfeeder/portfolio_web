import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:markdown_widget/config/style_config.dart';
import 'package:markdown_widget/config/highlight_themes.dart' as theme;
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class WebTheme {

  static double appBarHeight = 88; // 88 , Default : 56

  static double projectIconBorderRadiusValue = 16;
  static double cardBorderRadiusValue = 8;
  
  static ThemeData themeData = ThemeData(
    platform: TargetPlatform.windows,
    textTheme: GoogleFonts.latoTextTheme(),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardBorderRadiusValue))
    ),
    buttonTheme: ButtonThemeData(
      materialTapTargetSize: MaterialTapTargetSize.padded,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(itemBorderRadiusValue))
      shape: StadiumBorder()
    )
  );

  static double horizontalPadding = 88;
  static EdgeInsets defaultPagePadding = EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 48);
  static EdgeInsets defaultItemPadding = EdgeInsets.all(16);

  static StyleConfig markdownStyle = StyleConfig(

    pConfig: PConfig(
      selectable: true,
      textStyle: TextStyle(fontSize: 16),
      strongStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      linkStyle: TextStyle(fontSize: 16, color: Colors.blue[800],decoration: TextDecoration.underline),
      onLinkTap: (url) => launch(url),
    ),
    preConfig: PreConfig(
      language: "dart",
      textStyle: TextStyle(fontSize: 16, fontFamily: "JetBrains Mono"),
      theme: theme.githubTheme
    ),
    titleConfig: TitleConfig(
      h1: TextStyle(fontSize: 56),
      h2: TextStyle(fontSize: 48),
      h3: TextStyle(fontSize: 36),
      h4: TextStyle(fontSize: 24),
      h5: TextStyle(fontSize: 18),
      h6: TextStyle(fontSize: 16),
      commonStyle: TextStyle(fontWeight: FontWeight.w700),
    ),
    // hrConfig: HrConfig(),
    olConfig: OlConfig(
      textStyle: TextStyle(fontSize: 16)
    ),
    ulConfig: UlConfig(
      textStyle: TextStyle(fontSize: 16)
    ),
    blockQuoteConfig: BlockQuoteConfig(
      blockColor: Colors.grey[800],
      blockStyle: TextStyle(fontSize: 16,color: Colors.grey[800])
    ),
    tableConfig: TableConfig(
      headChildWrapper: (child) => Container(
        margin: EdgeInsets.all(8.0),
        child: child,
        alignment: Alignment.topLeft,
      ),
      bodyChildWrapper: (child) => Container(
        margin: EdgeInsets.all(8.0),
        child: child,
        alignment: Alignment.topLeft,
      ),
    ),
    // checkBoxBuilder: (value1, value2) => SizedBox(
    //   width: 24,
    //   height: 21,
    //   child: Padding(
    //     padding: const EdgeInsets.only(right: 4.0),
    //     child: IgnorePointer(
    //       child: Checkbox(
    //         value: value1,
    //         onChanged: (_) {},
    //         activeColor: Colors.blue[800],
    //         hoverColor: Colors.transparent,
    //         mouseCursor: MouseCursor.uncontrolled,
    //         visualDensity: VisualDensity.compact,
    //         materialTapTargetSize:
    //             MaterialTapTargetSize.shrinkWrap,
    //       ),
    //     ),
    //   ),
    // ),
  );
}