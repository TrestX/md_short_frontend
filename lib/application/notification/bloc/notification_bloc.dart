import 'dart:async';

import 'package:MD_Shorts/domain/notification/i_notification_repository.dart';
import 'package:MD_Shorts/domain/notification/notification.dart';
import 'package:MD_Shorts/domain/notification/notification_failure.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final INotificationRepository _notificationRepository;
  NotificationBloc(this._notificationRepository) : super(const NotificationState.initial());
  StreamSubscription<Either<NotificationFailure, List<NotificationGet>>>?
      _notificationStreamSubscription;
  @override
  Stream<NotificationState> mapEventToState(
    NotificationEvent event,
  ) async* {
    yield* event.map(
      getNotification: (e) async* {
        yield const NotificationState.loadInProgress();
        await _notificationStreamSubscription?.cancel();
        _notificationStreamSubscription = _notificationRepository.getNotifications().listen((event) => add(NotificationEvent.valueReceived(event)));
      },
      valueReceived: (_ValueReceived value) async* {
        yield value.failureOrValue.fold(
          (f) => NotificationState.loadFailure(f),
          (value) => NotificationState.loadSuccess(value),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _notificationStreamSubscription?.cancel();
    return super.close();
  }
}
