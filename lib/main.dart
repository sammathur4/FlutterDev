import 'package:flutter/material.dart';
import 'package:project1/screens/homeScreen.dart';
import 'package:project1/screens/loginScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/utils/routes.dart';
import 'package:project1/widget/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage()
      theme: MyTheme.darkTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoute.homeRoute,
      routes: {
        "/": (context) => LoginScreen(),
        MyRoute.loginRoute: (context) => LoginScreen(),
        MyRoute.homeRoute: (context) => HomePage(),
      },
    );
  }
}
