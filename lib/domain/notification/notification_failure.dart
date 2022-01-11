import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_failure.freezed.dart';

@freezed
abstract class NotificationFailure with _$NotificationFailure {
  const factory NotificationFailure.cancelledByUser() = CancelledByUser;
  const factory NotificationFailure.serverError() = ServerError;
}
