part of 'changepassword_bloc.dart';

@freezed
class ChangepasswordEvent with _$ChangepasswordEvent {
  const factory ChangepasswordEvent.changePpassword(String passwordStr) =
      _ChangePpassword;
  const factory ChangepasswordEvent.changePassword(Password password) =
      _ChangePassword;
  const factory ChangepasswordEvent.passwordVerified(bool passwrdVer) =
      PasswordVerified;
}
