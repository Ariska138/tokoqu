import 'package:flutter/material.dart';
import 'package:tokoqu/Data/TourismPlace.dart';
import 'package:tokoqu/UI/Pages/DetailMobilePage.dart';
import 'package:tokoqu/UI/Pages/DetailWebPage.dart';

var informationTextStyle = TextStyle(fontFamily: 'Oxygen');
class DetailScreen extends StatelessWidget {

  final TourismPlace place;

  const DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
      if(constraints.maxWidth > 800) {
        return DetailWebPage(place: place);
      }else{
        return DetailMobilePage(place: place);
      }
    });
  }
}
