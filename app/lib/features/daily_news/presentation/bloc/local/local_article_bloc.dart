import 'package:app/features/daily_news/domain/usecases/delete_article.dart';
import 'package:app/features/daily_news/domain/usecases/save_article.dart';
import 'package:app/features/daily_news/presentation/bloc/local/local_article_event.dart';
import 'package:app/features/daily_news/presentation/bloc/local/local_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_saved_article.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final DeleteArticleUseCase _deleteArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUseCase,
    this._deleteArticleUseCase,
  ) : super(const LocalArticleLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<DeleteArticle>(onDeleteArticles);
    on<SaveArticle>(onSaveArticle);
  }

  void onGetSavedArticles(
      GetSavedArticles event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onDeleteArticles(
      DeleteArticle deleteArticle, Emitter<LocalArticleState> emit) async {
    await _deleteArticleUseCase(params: deleteArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(
      SaveArticle saveArticle, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase();
    final articles = await _getSavedArticleUseCase(params: saveArticle.article);
    emit(LocalArticlesDone(articles));
  }
}
