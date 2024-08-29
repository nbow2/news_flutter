import 'dart:ui';

import 'package:news_flutter/mytheme/app_colors.dart';

class Category{
  String id;
  String imagePath;
  String title;
  Color color;

  Category({
    required this.title ,
    required this.id ,
    required this.color,
    required this.imagePath
});

  /*
     health   technology

  * */
  static List<Category> getCaegories(){
    return [
      Category(title: 'sports', id: 'sports', color: AppColors.red,
          imagePath: 'assets/images/sports.png'),
      Category(title: 'business', id: 'business',
          color: AppColors.brown, imagePath: 'assets/images/bussines.png'),
      Category(title: 'entertainment', id: 'entertainment',
          color: AppColors.blue, imagePath: 'assets/images/environment.png'),
      Category(title: 'general', id: 'general',
          color: AppColors.darkblue, imagePath: 'assets/images/Politics.png'),
      Category(title: 'science', id: 'science',
          color: AppColors.yellow, imagePath: 'assets/images/science.png'),
      Category(title: 'health', id: 'health',
          color: AppColors.pink, imagePath: 'assets/images/health.png'),
    ];
  }
}