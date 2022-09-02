import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

 class MyTheme {
   static ThemeData lightTheme(BuildContext context) => ThemeData(
     cardColor: Colors.white,
     canvasColor: creamColor,
     buttonColor: darkBluish,
        accentColor: darkBluish,
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

   static ThemeData darkTheme(BuildContext context) => ThemeData(
     brightness: Brightness.dark,
     cardColor: Colors.black,
     canvasColor: darkCreamColor,
     buttonColor: lightBluish,
     accentColor: Colors.white,
     appBarTheme: AppBarTheme(
       color: Colors.black,
       elevation: 0.0,
       iconTheme: IconThemeData(color: Colors.white),
       textTheme: Theme.of(context).textTheme.copyWith(
         headline6: context.textTheme.headline6!.copyWith(color: Colors.white),
       ),
       titleTextStyle: TextStyle(
         color: Colors.white,
         fontSize: 18,
         fontFamily: GoogleFonts.poppins().fontFamily,
       ),
     ),
     fontFamily: GoogleFonts.poppins().fontFamily,
   );

   //Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;       // const Color(0xff0b0b0b);
  static Color darkBluish = const Color(0xff403b58);
  static Color lightBluish = Vx.indigo500;         // const Color(0xff403b58);



}