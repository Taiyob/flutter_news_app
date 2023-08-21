import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/service/api_service.dart';

import '../components/news_item_list.dart';

class BreakingNews extends StatefulWidget{
  const BreakingNews({Key? Key}) : super(key: Key);
  @override
  State<StatefulWidget> createState() => _BreakingNewsState();

}

class _BreakingNewsState extends State<BreakingNews>{
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: apiService.getBreakingNews(), builder: (context, snapshot){
         if(snapshot.hasData){
           List<NewsModel> articlelist = snapshot.data ?? [];
           return ListView.builder(itemBuilder: (context, index){
             return NewsItemList(newsModel: articlelist[index],);
           },
            itemCount: articlelist.length,
           );
         }
         return const Center(
           child: CircularProgressIndicator(),
         );
      }),
    );
  }

}
