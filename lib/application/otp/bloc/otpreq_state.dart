part of 'otpreq_bloc.dart';

@freezed
class OtpreqState with _$OtpreqState {
  const factory OtpreqState({
    required Password password,
    required bool passwordVerified,
    required String otp,
    required bool showErrorMessages,
    required Option<Either<OtpFailure, Otp>> otpFailureOrSuccessOption,
    required Option<Either<AuthFailure, Unit>> emailotpFailureOrSuccessOption,
  }) = _OtpreqState;
  factory OtpreqState.initial() => OtpreqState(
        password: Password(''),
        otp: "",
        passwordVerified: false,
        showErrorMessages: false,
        otpFailureOrSuccessOption: none(),
        emailotpFailureOrSuccessOption: none()
      );
}
