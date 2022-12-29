import 'dart:convert';
import 'package:farmgo/static/api%20constants/keys.dart';
import 'package:http/http.dart' as http;

class NewsDataProvider {
  static final _client = http.Client();
  static const String _url = 'https://newsapi.org/v2/everything?q=plants&apiKey=$newsApiKey'; 

  static Future<Map<String, dynamic>> getArticles() async {
    try {
      var uri = Uri.parse(_url);
      var response = await _client.get(uri);
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> newsMap = Map<String, dynamic>.from(jsonData);
        return newsMap;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      rethrow;
    }
  }
}
