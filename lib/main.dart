import 'package:android_studio_projects/core/store.dart';
import 'package:android_studio_projects/pages/cart_page.dart';
import 'package:android_studio_projects/pages/home_page.dart';
import 'package:android_studio_projects/pages/login_page.dart';
import 'package:android_studio_projects/utils/routes.dart';
import 'package:android_studio_projects/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
      store: MyStore(),
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LoginPage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),

      },
    );
  }
}
