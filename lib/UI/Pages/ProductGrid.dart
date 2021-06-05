import 'package:flutter/material.dart';
import 'package:tokoqu/Data/ProductStore.dart';
import 'package:tokoqu/UI/Pages/DetailProductPage.dart';

class ProductGrid extends StatelessWidget {

  final int gridCount;
  final List<ProductStore> products;

  ProductGrid({required this.gridCount, required this.products});

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
              shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),

          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16,),
                Expanded(
                  child: Image.network(
                    product.image,
                    fit: BoxFit.scaleDown
                ),),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 16.0, right: 16),
                  child: Text(
                    "\$"+product.price.toString(),
                    style: TextStyle(
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
