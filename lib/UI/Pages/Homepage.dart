import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokoqu/Data/ProductStore.dart';
import 'package:tokoqu/Data/RawProducts.dart';
import 'package:tokoqu/UI/Pages/ProductGrid.dart';

class Homepage extends StatelessWidget {

  late final List<ProductStore> products;

  @override
  Widget build(BuildContext context) {

    products =(json.decode(rawProducts) as List).map((i) =>
        ProductStore.fromJson(i)).toList();

    debugPrint("products: "+products[0].description);

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        children: <Widget>[Container(
          height: size.height * .30,

          decoration: ShapeDecoration(
            color: Colors.cyan.shade100,
            shape: RoundedRectangleBorder (
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    topLeft:   Radius.zero,
                    bottomRight: Radius.circular(35),
                    topRight: Radius.zero
                ),
                side: BorderSide(
                    width: 10,
                    color: Colors.cyan.shade100
                )
            ),
          ),
        ) ,SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 768) {
                return ProductGrid(gridCount: 2, products: products);
              } else if (constraints.maxWidth <= 1024) {
                return Text('Goat Manager Table');
              } else {
                return Text('Goat Manager PC');
              }
            },
          ),
        ),
        ]
      ),
    );
  }

  AppBar buildAppBar(){
    return AppBar(
      centerTitle: true,
      title: Text(
        'Tokoqu',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
      ),
      backgroundColor: Colors.cyan.shade100,
      // elevation: 20,
      // shadowColor: Colors.cyan.shade100,
      // brightness: Brightness.dark,
    );
  }
}
