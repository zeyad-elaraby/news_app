import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/SourceResponse.dart';
import 'package:news_app/models/NewsData.dart';

class ApiManager {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=ee069b6be5da48eba8c4ad85f00c9469

 static Future<SourceResponse> getSources() async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "ee069b6be5da48eba8c4ad85f00c9469"});
    http.Response response = await http.get(url);
    Map<String,dynamic>jsonFormat=jsonDecode(response.body);
    SourceResponse sourceResponse=SourceResponse.fromJson(jsonFormat);
    return sourceResponse;
  }

 static Future<NewsDataResponse>  getNewsData(String sourceId)async{
   //https://newsapi.org/v2/everything?q=bitcoin&apiKey=ee069b6be5da48eba8c4ad85f00c9469
    Uri url=Uri.https("newsapi.org","/v2/everything",{"apiKey":"ee069b6be5da48eba8c4ad85f00c9469","sources":sourceId},);
   http.Response response=await  http.get(url);
    var jsonFormat=jsonDecode(response.body);
    NewsDataResponse newsDataResponse=NewsDataResponse.fromJson(jsonFormat);
    return newsDataResponse;
  }


}

