part of 'changepassword_bloc.dart';

@freezed
class ChangepasswordState with _$ChangepasswordState {
  const factory ChangepasswordState({
    required Password password,
    required bool passwordVerified,
    required bool showErrorMessages,
    required Option<Either<SettingsFailure, Settings>>
        settingsFailureOrSuccessOption,
  }) = _ChangepasswordState;

  factory ChangepasswordState.initial() => ChangepasswordState(
        password: Password(''),
        passwordVerified: false,
        showErrorMessages: false,
        settingsFailureOrSuccessOption: none(),
      );
}
