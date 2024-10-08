import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailNotRegistered() = EmailNotRegistered;
  const factory AuthFailure.emailAlreadyRegistered() = EmailAlreadyRegistered;
  const factory AuthFailure.emailNotVerified() = EmailNotVerified;
  const factory AuthFailure.invalidCredentails() = InvalidCredentails;
}
