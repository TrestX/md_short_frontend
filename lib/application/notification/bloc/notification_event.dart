part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
    const factory NotificationEvent.getNotification() = _GetNotification;
      const factory NotificationEvent.valueReceived(
    Either<NotificationFailure,  List<NotificationGet>> failureOrValue,
  ) = _ValueReceived;
}