import 'package:app/core/usecases/usecase.dart';
import 'package:app/features/daily_news/domain/entities/article.dart';

import '../../../../core/resources/data_state.dart';
import '../repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntities>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntities>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
