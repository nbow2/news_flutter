import 'package:flutter/material.dart';
import 'package:news_flutter/model/SourceResponse.dart';
import 'package:news_flutter/news/news_widget.dart';
import 'package:news_flutter/tabs/tab_item.dart';

class TabsWidget extends StatefulWidget {

  List<Source> sourcesList ;

  TabsWidget({required this.sourcesList});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  int isSelectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController
      (length: widget.sourcesList.length,
        child:  Column(
          children: [
            TabBar(
              indicatorColor: Colors.transparent,
                isScrollable: true,
                onTap: (index){
                isSelectedIndex = index ;
                setState(() {

                });
                },
                tabs: widget.sourcesList.map(
                        (source)=> TabItem(
                          source: source,
                          isSelected:isSelectedIndex == widget.sourcesList.indexOf(source) ,
                        )).toList()
            ),
            Expanded(child: NewsWidget(source: widget.sourcesList[isSelectedIndex]))
          ],
        ));
  }
}
