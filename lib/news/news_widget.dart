import 'package:flutter/material.dart';
import 'package:news_flutter/model/NewsResponse.dart';
import 'package:news_flutter/model/SourceResponse.dart';
import 'package:news_flutter/model/api.dart';

import '../mytheme/app_colors.dart';

class NewsWidget extends StatefulWidget {

  Source source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? ""),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primerColor,
              ),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                const Text('Something went wrong'),
                ElevatedButton(
                    onPressed: (){
                      ApiManager.getNewsBySourceId(widget.source.id ?? '');

                    },
                    child: const Text('Try again')
                )
              ],
            );
          }
          if(snapshot.data!.status != 'ok'){
            return Column(
              children: [
                 Text(snapshot.data!.message! ),
                ElevatedButton(
                    onPressed: (){
                      ApiManager.getNewsBySourceId(widget.source.id ?? '');
                      setState(() {

                      });
                    },
                    child: const Text('Try again')
                )
              ],
            );
          }
          var newList = snapshot.data!.articles! ;
          return ListView.builder(itemBuilder: (context, index){
            return Text(newList[index].title ?? "");
          },
          itemCount: newList.length,);
        }

    );

  }
}
