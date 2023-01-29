import 'package:flutter/material.dart';
import 'package:project1/widget/drawer.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black),
        // title: Text("Title", style: TextStyle(color: Colors.black),),

      ),
      body: Center(
        child:  Container(
          child: Text("data"),
        ),
      ),
      drawer: MyDrawer(),

    );
  }
}
