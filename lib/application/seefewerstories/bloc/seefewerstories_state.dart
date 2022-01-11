part of 'seefewerstories_bloc.dart';

@freezed
class SeefewerstoriesState with _$SeefewerstoriesState {
  const factory SeefewerstoriesState({
    required Option<Either<SeeFewerFailure, SeeFewer>>
        seeFewerFailureOrSuccessOption,
  }) = _SeefewerstoriesState;
  factory SeefewerstoriesState.initial() => SeefewerstoriesState(
        seeFewerFailureOrSuccessOption: none(),
      );
}
