import 'package:dartz/dartz.dart';
import 'notification.dart';
import 'notification_failure.dart';

abstract class INotificationRepository {
  Stream<Either<NotificationFailure, List<NotificationGet>>> getNotifications();
}
