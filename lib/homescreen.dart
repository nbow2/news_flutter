import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:news_flutter/model/SourceResponse.dart';
import 'package:news_flutter/model/api.dart';
import 'package:news_flutter/mytheme/app_colors.dart';
import 'package:news_flutter/tabs/tabs_widget.dart';

class Homescreen extends StatefulWidget {
  static const String routeName = 'home_Screen' ;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.white,
          child: Image.asset(
              'assets/images/pattern.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('News App' ,
              style:Theme.of(context).textTheme.titleLarge ,),
          ),
          body: FutureBuilder<SourceResponse?>
            (
              future: ApiManager.getSources(),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primerColor,
                      ));
                } else if(snapshot.hasError){
                  return Column(
                    children: [
                      Text('data Error'),
                      ElevatedButton(
                          onPressed: (){
                            ApiManager.getSources();
                            setState(() {

                            });
                          },
                          child: Text('Try Again'))
                    ],
                  );
                }

                if(snapshot.data!.status != 'ok' || snapshot.data == null){
                  return Column(
                    children: [
                      Text(snapshot.data!.message!),
                      ElevatedButton(
                          onPressed: (){
                            ApiManager.getSources();
                            setState(() {

                            });
                          },
                          child: Text('Ok'))
                    ],
                  );
                }
                var soursceList = snapshot.data!.sources!;
                return TabsWidget(sourcesList: soursceList,);
              }
          ),
        ),

      ],
    );
  }
}
