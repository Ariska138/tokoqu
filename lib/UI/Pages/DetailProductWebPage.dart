import 'package:flutter/material.dart';
import 'package:tokoqu/Data/ProductStore.dart';

class DetailProductWebPage extends StatefulWidget {

  final ProductStore product;

  const DetailProductWebPage({required this.product});

  @override
  _DetailProductWebPageState createState() => _DetailProductWebPageState();
}

class _DetailProductWebPageState extends State<DetailProductWebPage> {
  @override



  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            width: size.width * .50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Harga', style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                Text("\$"+widget.product.price.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text('Deskripsi:', style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Text(widget.product.description,)
              ],
            ),
          ),
          Container(
            width: 250,
            padding: EdgeInsets.all(16),
            child: Hero(
            tag: "${widget.product.id}",
            child: Image.network(widget.product.image),),),
        ],
      ),
    );
  }
}
