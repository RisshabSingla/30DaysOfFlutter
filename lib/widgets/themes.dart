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
            fontFamily: GoogleFonts.lato().fontFamily,
          ),
        ),
        fontFamily: GoogleFonts.lato().fontFamily,
      );

   static ThemeData get darkTheme => ThemeData(
     brightness: Brightness.dark,
   );

}