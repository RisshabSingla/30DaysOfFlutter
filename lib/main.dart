import 'package:android_studio_projects/pages/home_page.dart';
import 'package:android_studio_projects/pages/login_page.dart';
import 'package:android_studio_projects/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      //--> only one can be given either this or / address
      // home: HomePage(),

      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        // primaryTextTheme: GoogleFonts.latoTextTheme(),  --> Applicable only to primary text fields
      ),
      // themeMode: ThemeMode.dark    --> can be used to give dark theme
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,

      // initialRoute: "/login", // --> initial opening page
      routes: {
        // "/": (context) => const HomePage(), // --> not required since HomePage not given
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
