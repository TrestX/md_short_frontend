import 'package:MD_Shorts/domain/core/entity.dart';
import 'package:MD_Shorts/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification.freezed.dart';

@freezed
abstract class NotificationGet with _$NotificationGet implements IEntity {
  // Added constructor
  const factory NotificationGet({
    required UniqueId id,
    required String title,
    required String body,
    required String topic,
    required String sentTime
  }) = _NotificationGet;
}
