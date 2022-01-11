part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;

  const factory NotificationState.loadInProgress() = _LoadInProgress;
  const factory NotificationState.loadSuccess( List<NotificationGet> data) =
      _LoadSuccess;
  const factory NotificationState.loadFailure(NotificationFailure notifiacationFailure) =
      _LoadFailure;
}
