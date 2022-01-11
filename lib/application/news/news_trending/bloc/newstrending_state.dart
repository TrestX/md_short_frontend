part of 'newstrending_bloc.dart';

@freezed
class NewstrendingState with _$NewstrendingState {
  const factory  NewstrendingState.initial() = _Initial;
  const factory  NewstrendingState.loadInProgress() = _LoadInProgress;
  const factory  NewstrendingState.loadSuccess(List<News> news) =
      _LoadSuccess;
  const factory  NewstrendingState.loadFailure(NewsFailure newsFailure) =
      _LoadFailure;
}
