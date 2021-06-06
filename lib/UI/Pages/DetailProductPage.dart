import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tokoqu/Data/ProductStore.dart';
import 'package:tokoqu/UI/Pages/DetailProductMobilePage.dart';
import 'package:tokoqu/UI/Pages/DetailProductWebPage.dart';
import 'package:tokoqu/UI/Widgets/BottomNavBar.dart';

class DetailProductPage extends StatelessWidget {
  final ProductStore product;

  const DetailProductPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 768) {
          return DetailProductMobilePage(product: product);
        } else if (constraints.maxWidth <= 1024) {
          return DetailProductWebPage(product: product);
        } else {
          return Center(
              child: Container(
                  constraints: BoxConstraints(maxWidth: 1024),
                  child: DetailProductWebPage(product: product)));
        }
      }),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        this.product.title,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      backgroundColor: Colors.white,
      // elevation: 20,
      // shadowColor: Colors.cyan.shade100,
      // brightness: Brightness.dark,
      actions: <Widget>[
        IconButton(
          icon: FaIcon(FontAwesomeIcons.search),
          // color: Colors.black,
          onPressed: () {},
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.shoppingCart),
          onPressed: () {},
        ),
        SizedBox(width: 8)
      ],

    );
  }
}
