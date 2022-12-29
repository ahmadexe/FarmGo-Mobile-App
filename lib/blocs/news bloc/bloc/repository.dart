import 'package:farmgo/blocs/news%20bloc/bloc/data_provider.dart';
import 'package:farmgo/models/article.dart';

class NewsRepository {
  Future<List<Article>> getArticles() async {
    try {
      List<Article> articles = [];
      Map<String, dynamic> newsMap = await NewsDataProvider.getArticles();
      newsMap['articles'].forEach((json) {
        if (json['url'] != null &&
            json['urlToImage'] != null &&
            json['description'] != null &&
            json['content'] != null) {
          Article article = Article.fromJson(json);
          articles.add(article);
        }
      });
      return articles;
    } catch (e) {
      rethrow;
    }
  }
}
