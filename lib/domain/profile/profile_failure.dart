import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_failure.freezed.dart';

@freezed
abstract class ProfileFailure with _$ProfileFailure {
  const factory ProfileFailure.cancelledByUser() = CancelledByUser;
  const factory ProfileFailure.serverError() = ServerError;
}
