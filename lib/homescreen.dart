import 'package:flutter/material.dart';
import 'package:news_flutter/category/category_details.dart';
import 'package:news_flutter/category/category_fragment.dart';
import 'package:news_flutter/drawer/home_drawer.dart';
import 'package:news_flutter/model/SourceResponse.dart';
import 'package:news_flutter/model/api.dart';
import 'package:news_flutter/mytheme/app_colors.dart';
import 'package:news_flutter/settings/settings_tab.dart';
import 'package:news_flutter/tabs/tabs_widget.dart';
import 'package:news_flutter/model/category.dart';

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
            title: Text(
              selectedSideMenuItem == HomeDrawer.settings ? "Settings" :
              selectedCategory == null ? 'News App': selectedCategory!.title ,

              style:Theme.of(context).textTheme.titleLarge ,),
          ),
          body: selectedSideMenuItem == HomeDrawer.settings ?
          SettingsTab()
              :
          selectedCategory == null ?
          CategoryFragment(onCategoryItem: onCategoryItem)
          : CategoryDetails(category: selectedCategory! ),

          drawer: Drawer(
            child: HomeDrawer(onSideMenu: onSideMenu,),
          ),
        ),

      ],
    );
  }
  Category? selectedCategory;
  void onCategoryItem(Category newCategory){

    selectedCategory = newCategory ;
    setState(() {

    });
  }

  int selectedSideMenuItem = HomeDrawer.categories;
  void onSideMenu(int newSideMenuItem){
    selectedSideMenuItem = newSideMenuItem  ;
    selectedCategory = null ;
    Navigator.pop(context);
    setState(() {

    });
  }
}
