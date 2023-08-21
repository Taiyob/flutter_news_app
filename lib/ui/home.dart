import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/all_news.dart';
import 'package:news_app/ui/breaking_news.dart';


class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomePageState();

}
class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
       appBar: AppBar(
         title: Text('Flutter News App'),
         bottom: const TabBar(
           tabs: [
             Tab(text: 'Breaking News',),
             Tab(text: 'All News',),
           ],
         ),
       ),
      body: const TabBarView(
         children: [
           BreakingNews(),
           AllNews(),
         ],
      ),
    ));
  }
}
