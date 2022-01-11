part of 'allnews_bloc.dart';

@freezed
class AllnewsState with _$AllnewsState {
  const factory AllnewsState.initial() = _Initial;
    const factory  AllnewsState.loadInProgress() = _LoadInProgress;
  const factory  AllnewsState.loadSuccess(List<News> news) =
      _LoadSuccess;
  const factory  AllnewsState.loadFailure(NewsFailure newsFailure) =
      _LoadFailure;
}
