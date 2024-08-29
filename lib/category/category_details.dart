import 'package:flutter/material.dart';
import 'package:news_flutter/model/SourceResponse.dart';
import 'package:news_flutter/model/api.dart';
import 'package:news_flutter/model/category.dart';
import 'package:news_flutter/mytheme/app_colors.dart';
import 'package:news_flutter/tabs/tabs_widget.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(widget.category.id),
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
                      ApiManager.getSources(widget.category.id);
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
                      ApiManager.getSources(widget.category.id);
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
    );
  }
}
