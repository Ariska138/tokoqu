import 'package:flutter/material.dart';
import 'package:tokoqu/Statefull/MyHomePage.dart';
import 'package:tokoqu/Stateless/MainScreen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.cyan,
      ),
      home: MainScreen(),
    );
  }
}