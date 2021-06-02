import 'package:flutter/material.dart';
import 'package:tokoqu/Data/TourismPlace.dart';
import 'package:tokoqu/Stateless/DetailScreen.dart';
import 'package:tokoqu/Stateless/MyApp.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemBuilder: (context, index){
            final TourismPlace place = placeList[index];
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DetailScreen(place: place);
                }));
              },
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                        child: Image.asset(place.imageAsset)
                    ),
                    Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(place.name,
            style: TextStyle(fontSize: 16.0),
            ),
              SizedBox(
                height: 10,
              ),
              Text(place.location)
            ],
            )
                    ),
                    )],
                ),
              ),
            );
      }, itemCount: placeList.length,
      ),
    );
  }
}
