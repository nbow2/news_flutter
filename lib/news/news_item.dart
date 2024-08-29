import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/mytheme/app_colors.dart';

import '../model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  News news ;
  NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              placeholder: (context, url) => CircularProgressIndicator(
                color: AppColors.primerColor,
              ),
                errorWidget: (context , url ,error) => Icon(Icons.error),
                imageUrl: news.urlToImage ?? "",
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.28,
              fit: BoxFit.fill,
            )
          ),
          Text(news.author ?? "" ,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(

            ),
          ),
          SizedBox(height: 10,),
          Text(news.title ?? "", style: Theme.of(context).textTheme.titleSmall),
          SizedBox(height: 10,),
          Text(news.publishedAt ?? "",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppColors.grey
            )
            ,textAlign: TextAlign.end,),

        ],
      ),
    );
  }
}
