import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  final Set<String> categories;
  
  const CategoriesList({required this.categories});

  @override
  _State createState() => _State();
}

class _State extends State<CategoriesList> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.categories.length,
            itemBuilder: (context, index) => _buildCategories(index),
        ),
      ),
    );
  }

  _buildCategories(int index){
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
            print(index);
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 16.0, top: 3.0, right: 16.0, bottom: 3.0),
                decoration: ShapeDecoration(
                  color: selectedIndex == index ? Colors.white: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      side: BorderSide(width: 1, color: Colors.black)),
                ),
                child: Text(widget.categories.elementAt(index),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


