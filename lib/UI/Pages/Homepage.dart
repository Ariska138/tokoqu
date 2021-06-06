import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tokoqu/Data/ProductStore.dart';
import 'package:tokoqu/Data/RawProducts.dart';
import 'package:tokoqu/UI/Pages/ProductGrid.dart';
import 'package:tokoqu/UI/Widgets/CategoriesList.dart';

List<ProductStore> productsAppeared = [];

Set<String> categories = Set();

class Homepage extends StatelessWidget {
  late final List<ProductStore> products;

  Homepage() {
    products = (json.decode(rawProducts) as List)
        .map((i) => ProductStore.fromJson(i))
        .toList();

    categories.add('all');

    products.forEach((element) {
      categories.add(element.category);
    });

    productsAppeared = products;

    categories.forEach((element) {
      print("products: " + element);
    });
    //
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(children: <Widget>[
        Container(
          height: size.height * .30,
          decoration: ShapeDecoration(
            color: Colors.cyan.shade100,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    topLeft: Radius.zero,
                    bottomRight: Radius.circular(35),
                    topRight: Radius.zero),
                side: BorderSide(width: 10, color: Colors.cyan.shade100)),
          ),
        ),
        SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 768) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CategoriesList(categories: categories),
                    Expanded(
                        child: ProductGrid(gridCount: 2, products: productsAppeared, isMobile: true,)),
                  ],
                );
              } else if (constraints.maxWidth <= 1024) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CategoriesList(categories: categories),
                    Expanded(child: ProductGrid(gridCount: 4, products: productsAppeared, isMobile: false)),
                  ],
                );
              } else {
                return Center(
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 1024),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
              CategoriesList(categories: categories),
              Expanded(child: ProductGrid(gridCount: 4, products: productsAppeared, isMobile: false)),
              ],
              ),
                  ),
                );
              }
            },
          ),
        ),
      ]),
        floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'whatsapp',
          backgroundColor: Colors.green,
    child: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white,),
    ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: false,
      title: Text(
        'Tokoqu',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
      ),
      backgroundColor: Colors.cyan.shade100,
      // elevation: 20,
      // shadowColor: Colors.cyan.shade100,
      // brightness: Brightness.dark,
      actions: <Widget>[
        IconButton(
          icon: FaIcon(FontAwesomeIcons.search, color: Colors.white,),
          onPressed: () {},
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.shoppingCart, color: Colors.white,),
          onPressed: () {},
        ),
        SizedBox(width: 8)
      ],
    );
  }
}
