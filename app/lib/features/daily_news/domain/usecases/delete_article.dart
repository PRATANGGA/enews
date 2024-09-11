import 'package:app/core/usecases/usecase.dart';
import 'package:app/features/daily_news/domain/entities/article.dart';
import '../repository/article_repository.dart';

class DeleteArticleUseCase implements UseCase<void, ArticleEntities> {
  final ArticleRepository _articleRepository;

  DeleteArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntities? params}) {
    return _articleRepository.deleteArticle(params!);
  }
}
