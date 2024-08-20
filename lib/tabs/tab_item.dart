import 'package:flutter/material.dart';
import 'package:news_flutter/model/SourceResponse.dart';

import '../mytheme/app_colors.dart';

class TabItem extends StatelessWidget {
  bool isSelected ;
  Source source ;

  TabItem({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ?AppColors.primerColor : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.primerColor,
          width: 2
        )
      ),
      child: Text(source.name ?? '' ,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: isSelected ? AppColors.white : AppColors.primerColor
      ),),
    );
  }
}
