import 'package:flutter/material.dart';
import 'package:tokoqu/Data/ProductStore.dart';

class DetailProductPage extends StatelessWidget {

  final ProductStore product;

  const DetailProductPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Text('test'),
    );
  }

  AppBar buildAppBar(){
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
    );
  }
}
