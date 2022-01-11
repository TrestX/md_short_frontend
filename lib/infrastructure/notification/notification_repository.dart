import 'package:MD_Shorts/apis/notification_api.dart';
import 'package:MD_Shorts/domain/notification/i_notification_repository.dart';
import 'package:MD_Shorts/domain/notification/notification.dart';
import 'package:MD_Shorts/domain/notification/notification_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: INotificationRepository)
class NotificationRepository implements INotificationRepository {
  final NotificationApiClient _notiApi;
  NotificationRepository(this._notiApi);
  @override
  Stream<Either<NotificationFailure, List<NotificationGet>>> getNotifications() async* {
    final result = await _notiApi.getNotifications();
    yield result.fold(
      (failure) {
        return Left(failure);
      },
      (data) {
        return Right(data);
      },
    );
  }
}
