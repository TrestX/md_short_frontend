part of 'searchcategory_bloc.dart';

@freezed
class SearchcategoryState with _$SearchcategoryState {
  const factory SearchcategoryState.initial() = _Initial;
  const factory SearchcategoryState.loadInProgress() = _LoadInProgress;
  const factory SearchcategoryState.loadSuccess(List<UserCategory> userCategory) =
      _LoadSuccess;
  const factory SearchcategoryState.loadFailure(CategoryFailure categoryFailure) =
      _LoadFailure;
}
