import 'package:flutter/material.dart';
import 'package:news_app/models/NewsData.dart';

class NewsItem extends StatelessWidget {
 Articles article;
 NewsItem({required this.article,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),

              child: Image.network(article.urlToImage??"")),
          Text(article.author??"",
            style: TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w300,

          ),),
          Text(article.title??"", style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,

          ),),
          Text(article.description??"", style: TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w400,

          ),),
          Text(article.publishedAt!.substring(0,10),style: TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w300,

          ),textAlign: TextAlign.end,),
        ],
      ),
    );
  }
}