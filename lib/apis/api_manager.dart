import 'dart:convert';

import 'package:news_app/models/SourceResponse.dart';
import 'package:http/http.dart' as http;

import 'package:news_app/models/NewsData.dart';

class ApiManager {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=ee069b6be5da48eba8c4ad85f00c9469

  static Future<SourceResponse> getSources(String id) async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "ee069b6be5da48eba8c4ad85f00c9469", "category": id});
    http.Response response = await http.get(url);
    Map<String, dynamic> jsonFormat = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(jsonFormat);
    return sourceResponse;
  }

  static Future<NewsDataResponse> getNewsData(
      {String? sourceId, String? query}) async {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=ee069b6be5da48eba8c4ad85f00c9469
    Uri url = Uri.https(
      "newsapi.org",
      "/v2/everything",
      {
        "apiKey": "ee069b6be5da48eba8c4ad85f00c9469",
        "sources": sourceId,
        "q": query
      },
    );
    http.Response response = await http.get(url);
    var jsonFormat = jsonDecode(response.body);
    NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(jsonFormat);
    return newsDataResponse;
  }
}
