import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tokoqu/Data/TourismPlace.dart';
import 'package:flutter/material.dart';
import 'package:tokoqu/Statefull/FavoriteButton.dart';
import 'package:tokoqu/Stateless/DetailScreen.dart';

class DetailWebPage extends StatefulWidget {

  final TourismPlace place;

  const DetailWebPage({required this.place});

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: kIsWeb ? null : AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: Center(
          child: Container(
            width: screenWidth <= 1200 ? 800 : 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Wisata Bandung',
                  style: TextStyle(
                    fontFamily: 'Staatliches',
                    fontSize: 32,
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Column(
                      children: [
                        ClipRRect(
                          child: Image.asset(widget.place.imageAsset),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        SizedBox(height: 16,),
                        Scrollbar(
                          isAlwaysShown: true,
                            controller: _scollController,
                            child: Container(
                              height: 150,
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ListView(
                                controller: _scollController,
                                scrollDirection: Axis.horizontal,
                                children: widget.place.imageUrls.map((url){
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(url),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ))
                      ],
                    ),),
                    SizedBox(width: 32,),
                    Expanded(child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              child: Text(
                                widget.place.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: 'Staatliches',
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.calendar_today),
                                    SizedBox(width: 8.0,),
                                    Text(
                                      widget.place.openDays,
                                      style: informationTextStyle,
                                    )
                                  ],
                                ),
                                FavoriteButton(),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.access_time),
                                SizedBox(width: 8.0,),
                                Text(
                                  widget.place.openTime,
                                  style: informationTextStyle,
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.monetization_on),
                                SizedBox(width: 8.0,),
                                Text(
                                  widget.place.ticketPrice,
                                  style: informationTextStyle,
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 16.0
                              ),
                              child: Text(
                                widget.place.description,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Oxygen'
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scollController.dispose();
    super.dispose();
  }
}
