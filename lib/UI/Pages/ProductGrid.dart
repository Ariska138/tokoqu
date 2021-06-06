import 'package:flutter/material.dart';
import 'package:tokoqu/Data/ProductStore.dart';
import 'package:tokoqu/UI/Pages/DetailProductPage.dart';

class ProductGrid extends StatelessWidget {

  final int gridCount;
  final List<ProductStore> products;
  final bool isMobile;

  ProductGrid({required this.gridCount, required this.products, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    // return Scrollbar(
    //     child: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //     )
    // );

    return GridView.count(
        crossAxisCount: gridCount,
        padding: EdgeInsets.all(16.0),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: products.map((product){
      return InkWell(
        onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return DetailProductPage(product: product,);
        }));
      },
        child: Container(
          decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
              ),
            ],

            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),

          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: this.isMobile ? 3:16,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      product.image,
                      fit: BoxFit.scaleDown
                ),
                  ),),
                SizedBox(height: this.isMobile ? 3:8,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                     product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: this.isMobile ? 12.0:14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: this.isMobile ? 3:16.0, left: 16.0, bottom: this.isMobile ? 3:16.0, right: 16),
                  child: Text(
                    "\$"+product.price.toString(),
                    style: TextStyle(
                      fontSize: this.isMobile ? 10.0:12.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },).toList()
    );
  }
}
