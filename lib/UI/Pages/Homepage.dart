import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tokoqu/Data/ProductStore.dart';
import 'package:tokoqu/Data/RawProducts.dart';
import 'package:tokoqu/UI/Pages/ProductGrid.dart';
import 'package:tokoqu/UI/Widgets/BackgroundPage.dart';
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

  AppBar buildAppBar({isMobile = false}) {
    return AppBar(
      centerTitle: isMobile ? false : true,
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
          icon: FaIcon(
            FontAwesomeIcons.search,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: FaIcon(
            FontAwesomeIcons.shoppingCart,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        SizedBox(width: 8)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 768) {
        return Scaffold(
          appBar: buildAppBar(isMobile: true),
          body: Stack(children: <Widget>[
            BackgroundPage(),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CategoriesList(categories: categories),
                  Expanded(
                      child: ProductGrid(
                    gridCount: 2,
                    products: productsAppeared,
                    isMobile: true,
                  )),
                ],
              ),
            ),
          ]),
        );
      } else if (constraints.maxWidth <= 1024) {
        return Scaffold(
          appBar: buildAppBar(isMobile: false),
          body: Stack(children: <Widget>[
            BackgroundPage(),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CategoriesList(categories: categories),
                  Expanded(
                      child: ProductGrid(
                    gridCount: 4,
                    products: productsAppeared,
                    isMobile: false,
                  )),
                ],
              ),
            ),
          ]),
        );
      } else {
        return Scaffold(
          appBar: buildAppBar(isMobile: false),
          body: Stack(children: <Widget>[
            BackgroundPage(),
            SafeArea(
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 1024),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CategoriesList(categories: categories),
                      Expanded(
                          child: ProductGrid(
                              gridCount: 4,
                              products: productsAppeared,
                              isMobile: false)),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        );
      }
    });
  }
}
