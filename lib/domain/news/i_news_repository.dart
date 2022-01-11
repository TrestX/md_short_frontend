import 'package:MD_Shorts/domain/news/news.dart';
import 'package:dartz/dartz.dart';
import 'news.dart';
import 'news_failure.dart';

abstract class INewsRepository {
  Stream<Either<NewsFailure, List<News>>> getAllNews();
  Stream<Either<NewsFailure, List<News>>> getNewsStartingWithNewsID(
      String newsID);
  Stream<Either<NewsFailure, List<News>>> getNews(String type);
  Stream<Either<NewsFailure, List<News>>> getGlobalNews();
  Stream<Either<NewsFailure, List<News>>> getSearchNews(String? search);
  Stream<Either<NewsFailure, List<News>>> getTopStoriesNews();
  Stream<Either<NewsFailure, List<News>>> getTrendingNews();
    Stream<Either<NewsFailure, List<News>>> getAlllNews();
}
