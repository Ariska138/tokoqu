import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    height: 80,
    color: Colors.white,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(right: 16.0),
        height: 50,
        width: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.red,
          ),
        ),
        child: IconButton(
          icon: FaIcon(FontAwesomeIcons.cartPlus, color: Colors.red,),
          onPressed: () {},
        ),
      ),
      Expanded(
        child: SizedBox(
          height: 50,
          child: FlatButton(

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18)),
            color: Colors.red,
            onPressed: () {},
            child: Text(
              "Buy  Now".toUpperCase(),
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ]));
  }
}


