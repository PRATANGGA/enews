import 'package:app/features/daily_news/domain/entities/article.dart';
import 'package:equatable/equatable.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleEntities? article;
  const LocalArticleEvent({this.article});

  @override
  List<Object?> get props => [article];
}

class GetSavedArticles extends LocalArticleEvent {
  const GetSavedArticles();
}

class SaveArticle extends LocalArticleEvent {
  const SaveArticle({required ArticleEntities article})
      : super(article: article);
}

class DeleteArticle extends LocalArticleEvent {
  const DeleteArticle({required ArticleEntities article})
      : super(article: article);
}
