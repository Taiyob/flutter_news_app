import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel newsModel;
  const NewsDetails({Key? key, required this.newsModel}) : super(key: key);

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.newsModel.title.toString()),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.fitHeight,
              imageUrl: widget.newsModel.urlToImage.toString(),
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Container(child:
                Text(widget.newsModel.source!.name.toString()),
                  padding: EdgeInsets.all(6),
                  decoration:BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(300)
                  ),
                ),
                SizedBox(width: 8,),
                Text(widget.newsModel.publishedAt.toString()),
              ],
            ),
            SizedBox(height: 8,),
            Text(widget.newsModel.author == null ? "" : "Written By " + widget.newsModel.author.toString()),
            SizedBox(height: 8,),
            Text(widget.newsModel.title.toString()),
            SizedBox(height: 8,),
            Text(widget.newsModel.description.toString()),
            SizedBox(height: 8,),
            ElevatedButton(onPressed: () async {
              final Uri uri = Uri.parse(widget.newsModel.url.toString());
              if(!await launchUrl(uri)){
                throw Exception('Could not launch');
              }
            }, child: Text("Read More....")),
          ],
        ),
      ),
    );
  }
}
