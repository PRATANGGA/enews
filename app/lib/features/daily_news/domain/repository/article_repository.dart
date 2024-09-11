import 'package:app/features/daily_news/domain/entities/article.dart';

import '../../../../core/resources/data_state.dart';

abstract class ArticleRepository {
  //API call method
  Future<DataState<List<ArticleEntities>>> getNewsArticles();

  //Local database method
  Future<List<ArticleEntities>> getSavedArticles();

  Future<void> saveArticle(ArticleEntities article);

  Future<void> deleteArticle(ArticleEntities article);
}
