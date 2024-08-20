
import 'package:flutter/material.dart';
import 'package:news_flutter/homescreen.dart';
import 'package:news_flutter/mytheme/my_theme_data.dart';

void main (){
  runApp(myApp());
}

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'News App',
      theme:MyThemeData.lightMode,
      initialRoute: Homescreen.routeName,
      routes: {
        Homescreen.routeName: (context)=> Homescreen(),
      },
    );
  }

}