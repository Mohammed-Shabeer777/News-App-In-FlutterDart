import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=0705cf5bba4b492ba73535316d2408ed';
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach(
        (element) {
          if (element['urlToImage'] != null &&
              element['title'] != null &&
              element['content'] != null) {
            ArticleModel am = ArticleModel(
              element['title'],
              element['description'],
              element['url'],
              element['urlToImage'],
              element['content'],
            );

            news.add(am);
          }
        },
      );
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews({required String type}) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=$type&apiKey=0705cf5bba4b492ba73535316d2408ed';
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach(
        (element) {
          if (element['urlToImage'] != null &&
              element['title'] != null &&
              element['content'] != null) {
            ArticleModel am = ArticleModel(
              element['title'],
              element['description'],
              element['url'],
              element['urlToImage'],
              element['content'],
            );

            news.add(am);
          }
        },
      );
    }
  }
}
