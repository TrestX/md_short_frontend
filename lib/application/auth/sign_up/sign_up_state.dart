part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    required Email email,
    required Categories categories,
    required bool termAndCondition,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignUpState;

  factory SignUpState.initial() => SignUpState(
        email: Email(''),
        categories: Categories(const []),
        showErrorMessages: false,
        termAndCondition: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
