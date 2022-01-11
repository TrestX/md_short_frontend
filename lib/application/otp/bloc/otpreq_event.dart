part of 'otpreq_bloc.dart';

@freezed
class OtpreqEvent with _$OtpreqEvent {
  const factory OtpreqEvent.verifyOtp(String otp) = _VerifyOtp;
  const factory OtpreqEvent.passwordResetOtp(String email) = _PasswordResetOtp;
  const factory OtpreqEvent.resendOtp(String email) = _ResendOtp;
  const factory OtpreqEvent.verifyPassOtp(String otp, String pass) =
      _VerifyPassOtp;
  const factory OtpreqEvent.verifyEmailOtp(String otp,String email) =
      _VerifyEmailOtp;
  const factory OtpreqEvent.changePpassword(String passwordStr) =
      _ChangePpassword;
  const factory OtpreqEvent.passwordVerified(bool passwrdVer) =
      PasswordVerified;
  const factory OtpreqEvent.changeOtp(String otp) = _ChangeOtp;
}
