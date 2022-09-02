import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

 class MyTheme {
   static ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
      );

   static ThemeData get darkTheme => ThemeData(
     brightness: Brightness.dark,
   );

   //Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkBluish = const Color(0xff403b58);



}