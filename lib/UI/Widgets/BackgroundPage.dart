import 'package:flutter/material.dart';

class BackgroundPage extends StatelessWidget {
  const BackgroundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Container(
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
    );
  }
}
