import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/NewsData.dart';
import 'package:news_app/screens/search_tab.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
static const String routeName="NewsDetails";
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var article=ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "${article.title}",
          style: GoogleFonts.exo(fontSize: 20, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(onPressed: () {
            showSearch(context: context, delegate: SearchTab());
          }, icon: Icon(Icons.search)),
        ],
      ),
      body:  Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade200
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CachedNetworkImage(
                height: 250,
                imageUrl: article.urlToImage??"",
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
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

            SizedBox(height: 10,),
            Text("${article.content}"),
              SizedBox(height: 10,),

              InkWell(
                onTap: () {
                  _launchUrl(article.url??"");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Text("View Full Article"),
                  Icon(Icons.arrow_forward_ios)
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
Future<void> _launchUrl(String url) async {
  final Uri _url = Uri.parse(url);

  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
  }
}
