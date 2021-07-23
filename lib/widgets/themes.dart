import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.red,
      cardColor: Colors.white,
      canvasColor: cream,
      buttonColor: Colors.red,
      accentColor: Colors.black,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      cardColor: Colors.black,
      canvasColor: darkCream,
      buttonColor: lightPruple,
      accentColor: Colors.white,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme,
      ));

  // Colors

  static Color cream = Color(0xfff5f5f5);
  static Color darkCream = Vx.gray800;
  static Color lightPruple = Vx.indigo500;
}
