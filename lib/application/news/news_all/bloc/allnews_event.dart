part of 'allnews_bloc.dart';

@freezed
class AllnewsEvent with _$AllnewsEvent {
      const factory AllnewsEvent.watchAllStarted() = _WatchAllStarted;
  const factory AllnewsEvent.valueReceived(
    Either<NewsFailure, List<News>> failureOrValue,
  ) = _ValueReceived;
}