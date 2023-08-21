import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/service/api_service.dart';
import '../components/news_item_list.dart';
import '../model/news_model.dart';


class AllNews extends StatefulWidget{
  const AllNews({Key? Key}) : super(key: Key);
  @override
  State<StatefulWidget> createState() => _AllNewsState();

}

class _AllNewsState extends State<AllNews>{
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: apiService.getAllNews(), builder: (context, snapshot){
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
