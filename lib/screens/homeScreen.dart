import 'package:flutter/material.dart';
import 'package:project1/models/catalog.dart';
import 'package:project1/widget/drawer.dart';

import '../widget/items_widget.dart';

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
      body:
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: CatalogModel.items[index],);
          },

      ),
        ),

      // Center(
      //   child:  Container(
      //     child: Text("data"),
      //   ),
      // ),
      drawer: MyDrawer(),

    );
  }
}
