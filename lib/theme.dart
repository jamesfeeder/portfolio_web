import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';

class WebTheme {

  static double appBarHeight = 88; // 88 , Default : 56

  static double projectIconBorderRadiusValue = 16;
  static double cardBorderRadiusValue = 8;
  
  static ThemeData themeData = ThemeData(
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

  static MarkdownStyleSheet markdownStyleSheet = MarkdownStyleSheet(
    p: TextStyle(fontSize: 16)
  );
}