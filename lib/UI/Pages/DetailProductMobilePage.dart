import 'package:flutter/material.dart';
import 'package:tokoqu/Data/ProductStore.dart';
import 'package:tokoqu/UI/Widgets/FavoriteButton.dart';

class DetailProductMobilePage extends StatefulWidget {
  final ProductStore product;

  const DetailProductMobilePage({required this.product});

  @override
  _DetailProductMobilePageState createState() =>
      _DetailProductMobilePageState();
}

class _DetailProductMobilePageState extends State<DetailProductMobilePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 250,
                padding: EdgeInsets.all(16),
                child: Hero(
                  tag: "${widget.product.id}",
                  child: Image.network(widget.product.image),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                // width: size.width * .50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Harga',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$" + widget.product.price.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Deskripsi:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.product.description,
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FavoriteButton(),
            ],
          )
        ],
      ),
    );
  }
}
