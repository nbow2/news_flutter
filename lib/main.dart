
import 'package:flutter/material.dart';
import 'package:news_flutter/homescreen.dart';

void main (){
  runApp(myApp());
}

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'News App',
      initialRoute: Homescreen.routeName,
      routes: {
        Homescreen.routeName: (context)=> Homescreen(),
      },
    );
  }

}