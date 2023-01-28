import 'package:flutter/material.dart';
import 'package:project1/widget/drawer.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
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
