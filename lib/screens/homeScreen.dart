import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/models/catalog.dart';
import 'package:project1/widget/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widget/items_widget.dart';
import '../widget/themes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog);
      },
    );
  }
}


class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem( this.catalog);

  // const CatalogItem({Key key, required this.catalog})
  //     : assert(catalog != null),
  //       super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
            image: catalog.image,
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                  catalog.desc.text.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalog.price}".text.bold.xl.make(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              MyTheme.darkBluishColor,
                            ),
                            shape: MaterialStateProperty.all(
                              StadiumBorder(),
                            )),
                        child: "Buy".text.make(),
                      )
                    ],
                  ).pOnly(right: 8.0)
                ],
              ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({ required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}







//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Catalog App"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
//             // ? ListView.builder(
//             //     itemCount: CatalogModel.items.length,
//             //     itemBuilder: (context, index) => ItemWidget(
//             //       item: CatalogModel.items[index],
//             //     ),
//             //   )
//             // : const Center(
//             //     child: CircularProgressIndicator(),
//             //   ),
//             ? GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 16,
//                 crossAxisSpacing: 16,
//               ),
//               itemBuilder: (context, index) {
//                 final item = CatalogModel.items[index];
//               return Card(
//                   clipBehavior: Clip.antiAlias,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                       child: GridTile(
//                         header: Container(
//                           padding: const EdgeInsets.all(12),
//                           decoration: const BoxDecoration(
//                             color: Colors.deepPurple,
//                           ),
//                           child: Text(
//                             item.name,
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       footer: Container(
//                         padding: const EdgeInsets.all(12),
//                         decoration: const BoxDecoration(
//                           color: Colors.black,
//                         ),
//                         child: Text(
//                           item.price.toString(),
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       child: Image.network(
//                         item.image,
//                       ),
//                     ));
//               },
//               itemCount: CatalogModel.items.length,
//             )
//                 : const Center(
//                   child: CircularProgressIndicator(),
//             ),
//           ),
//           drawer: MyDrawer(),
//     );
//   }
// }