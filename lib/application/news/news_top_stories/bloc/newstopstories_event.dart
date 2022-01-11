part of 'newstopstories_bloc.dart';

@freezed
class NewstopstoriesEvent with _$NewstopstoriesEvent {
    const factory NewstopstoriesEvent.watchAllStarted() = _WatchAllStarted;
  const factory NewstopstoriesEvent.valueReceived(
    Either<NewsFailure, List<News>> failureOrValue,
  ) = _ValueReceived;
}