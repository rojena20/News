import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/sourceResponse.dart';

import '../models/NewsDataResponse.dart';
import '../models/Search.dart';

class ApiManeger {
  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=c52a3e3912324eddb9fad927b6629465
  static Future<sourceResponse> getSources(String id) async {
    Uri url = Uri.https(
      "newsapi.org",
      "/v2/top-headlines/sources",
      {
        "apiKey": "c52a3e3912324eddb9fad927b6629465",
        "category": id,
      },
    );
    http.Response response = await http.get(url);
    Map<String, dynamic> jsonFormat = jsonDecode(response.body);
    sourceResponse sourceresponse = sourceResponse.fromJson(jsonFormat);
    return sourceresponse;
  }

  static Future<NewsDataResponse> getNewsDate(String sourceID) async {
    Uri url = Uri.https(
      "newsapi.org",
      "/v2/everything",
      {
        "apiKey": "c52a3e3912324eddb9fad927b6629465",
        "sources": sourceID,
      },
    );
    http.Response response = await http.get(url);
    Map<String, dynamic> jsonFormat = jsonDecode(response.body);
    NewsDataResponse newsData = NewsDataResponse.fromJson(jsonFormat);
    return newsData;
  }

  static Future<Search> searchArticles(String id,String query) async {
    Uri url = Uri.https("newsapi.org", "/v2/everything",
        {"apiKey": "c52a3e3912324eddb9fad927b6629465","q": query,"category": id});
    var response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    Search results = Search.fromJson(json);
    return results;
  }
}
