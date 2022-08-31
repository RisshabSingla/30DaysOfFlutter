import 'package:android_studio_projects/pages/home_page.dart';
import 'package:android_studio_projects/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),   //--> only one can be given either this or / address
      // themeMode: ThemeMode.light
      // themeMode: ThemeMode.dark    --> can be used to give dark theme
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,

      initialRoute: "/home",   // --> initial opening page
    routes: {
      "/": (context)=> HomePage(), // --> not required since HomePage not given
      "/home": (context)=> HomePage(),
      "/login": (context)=> LoginPage(),
    },
    );
  }
}
