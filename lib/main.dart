import 'package:flutter/material.dart';
import 'package:project1/screens/homeScreen.dart';
import 'package:project1/screens/loginScreen.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage()
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      routes: {
        "/": (context)=> HomePage(),
        "/login": (context)=> LoginScreen(),
      },
    );

  }
}
