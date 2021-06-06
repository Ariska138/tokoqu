import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FloatingWhatsapp extends StatelessWidget {
  const FloatingWhatsapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){},
      tooltip: 'whatsapp',
      backgroundColor: Colors.green,
      child: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white,),
    );
  }
}
