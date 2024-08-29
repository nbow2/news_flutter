import 'package:flutter/material.dart';
import 'package:news_flutter/mytheme/app_colors.dart';

class HomeDrawer extends StatelessWidget {

  static const int categories = 1;
  static const int settings = 2;

  Function onSideMenu;
  HomeDrawer({required this.onSideMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height * 0.12 ),
           // height: MediaQuery.of(context).size.height * 0.17,
            width: double.infinity,
            color: AppColors.primerColor,
            child: Text('News App!' ,style: Theme.of(context).textTheme.titleLarge , textAlign: TextAlign.center,),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: InkWell(
              onTap: (){
                onSideMenu(categories);
              },
              child: Row(
                children: [
                Icon(Icons.list),
                  SizedBox(width: 10,),
                Text('Category' ,style: Theme.of(context).textTheme.titleMedium,)
              ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: InkWell(
              onTap: (){
                onSideMenu(HomeDrawer.settings);
              },
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 10,),
                  Text('Settings', style: Theme.of(context).textTheme.titleMedium,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
