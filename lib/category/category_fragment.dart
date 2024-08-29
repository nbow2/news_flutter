
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:news_flutter/category/category_item.dart';
import 'package:news_flutter/model/category.dart';

class CategoryFragment extends StatelessWidget {

  var categoriesList = Category.getCaegories();
  Function onCategoryItem;
  CategoryFragment({required this.onCategoryItem});


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all( 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Pick your category \nof interest' ,
          style:  Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 15,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                  crossAxisSpacing: 10
                ),
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      onCategoryItem(categoriesList[index]);
                    },
                      child: CategoryItem(category: categoriesList[index], index: index));
                },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
