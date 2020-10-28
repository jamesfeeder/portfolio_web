import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WebTheme {

  static double appBarHeight = 88;
  
  static ThemeData themeData = ThemeData(
    textTheme: GoogleFonts.latoTextTheme(),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
    ),
    buttonTheme: ButtonThemeData(
      materialTapTargetSize: MaterialTapTargetSize.padded,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
    )
  );

  static EdgeInsets defaultPagePadding = EdgeInsets.symmetric(horizontal: 88, vertical: 48);
  static EdgeInsets defaultItemPadding = EdgeInsets.all(16);
}