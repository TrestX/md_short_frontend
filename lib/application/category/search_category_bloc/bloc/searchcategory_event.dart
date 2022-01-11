part of 'searchcategory_bloc.dart';

@freezed
class SearchcategoryEvent with _$SearchcategoryEvent {
  const factory SearchcategoryEvent.started(String? ids) = _Started;
  const factory SearchcategoryEvent.valueReceived(
    Either<CategoryFailure, List<UserCategory>> failureOrValue,
  ) = _ValueReceived;
}