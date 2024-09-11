import 'package:app/core/usecases/usecase.dart';
import 'package:app/features/daily_news/domain/entities/article.dart';
import '../repository/article_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntities>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntities>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
