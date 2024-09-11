import 'package:app/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:app/features/daily_news/domain/repository/article_repository.dart';
import 'package:app/features/daily_news/domain/usecases/delete_article.dart';
import 'package:app/features/daily_news/domain/usecases/get_article.dart';
import 'package:app/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:app/features/daily_news/domain/usecases/save_article.dart';
import 'package:app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:app/features/daily_news/presentation/bloc/local/local_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependecies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(sl(), sl()),
  );

  //UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));

  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));

  sl.registerSingleton<DeleteArticleUseCase>(DeleteArticleUseCase(sl()));

  //Bloc
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));

  sl.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(sl(), sl(), sl()));
}
