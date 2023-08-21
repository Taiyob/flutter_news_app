import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/model/news_model.dart';

class ApiService{
  final all_news_url =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=a92d79518f4d4a73ac5cb56162098b5e";
  final breaking_news_url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=a92d79518f4d4a73ac5cb56162098b5e";

  Future<List<NewsModel>> getAllNews()async{
    try{
      Response response = await get(Uri.parse(all_news_url));
      if(response.statusCode == 200){
         Map<String, dynamic> json = jsonDecode(response.body);
         List<dynamic>body = json['articles'];
         List<NewsModel> articleList = body.map((item) => NewsModel.fromJson(item)).toList();
         return  articleList ;
      }else{
         throw ('No news found');
      }
    }catch(e){
       throw e;
    }
  }


  Future<List<NewsModel>> getBreakingNews()async{
    try{
      Response response = await get(Uri.parse(breaking_news_url));
      if(response.statusCode == 200){
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic>body = json['articles'];
        List<NewsModel> articleList = body.map((item) => NewsModel.fromJson(item)).toList();
        return  articleList ;
      }else{
        throw ('No news found');
      }
    }catch(e){
      throw e;
    }
  }
}