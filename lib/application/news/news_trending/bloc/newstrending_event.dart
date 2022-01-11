part of 'newstrending_bloc.dart';

@freezed
class NewstrendingEvent with _$NewstrendingEvent {
    const factory NewstrendingEvent.watchAllStarted() = _WatchAllStarted;
  const factory NewstrendingEvent.valueReceived(
    Either<NewsFailure, List<News>> failureOrValue,
  ) = _ValueReceived;
}