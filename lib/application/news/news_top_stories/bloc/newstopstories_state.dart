part of 'newstopstories_bloc.dart';

@freezed
class NewstopstoriesState with _$NewstopstoriesState {
  const factory NewstopstoriesState.initial() = _Initial;
  const factory NewstopstoriesState.loadInProgress() = _LoadInProgress;
  const factory NewstopstoriesState.loadSuccess(List<News> news) =
      _LoadSuccess;
  const factory NewstopstoriesState.loadFailure(NewsFailure newsFailure) =
      _LoadFailure;
}
