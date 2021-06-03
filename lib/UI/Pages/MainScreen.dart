import 'package:flutter/material.dart';
import 'package:tokoqu/UI/Pages/PlaceGrid.dart';
import 'package:tokoqu/UI/Pages/PlaceList.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          return Scaffold(
            appBar: AppBar(
              title: Text('Goat Manager'),
            ),
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints){
                if(constraints.maxWidth <= 768) {
                  return PlaceList();
                }else if(constraints.maxWidth <= 1024) {
                  return PlaceGrid(gridCount: 4,);
                }else {
                  return PlaceGrid(gridCount: 6,);
                }
              },
            ),
          );
        });
  }
}