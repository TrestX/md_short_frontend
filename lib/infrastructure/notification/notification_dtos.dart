import 'package:MD_Shorts/domain/core/value_objects.dart';
import 'package:MD_Shorts/domain/notification/notification.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_dtos.freezed.dart';
part 'notification_dtos.g.dart';

@freezed
abstract class NotificationGetDto implements _$NotificationGetDto {
  const NotificationGetDto._();

  // ignore: sort_unnamed_constructors_first
  const factory NotificationGetDto({
    required String id,
    required String title,
    required String body,
    required String topic,
    required String sentTime
  }) = _NotificationGetDto;

  NotificationGet toDomain() {
    return NotificationGet(
      id: UniqueId.fromUniqueString(id),
      title: title,
      body: body,
      topic: topic,
      sentTime: sentTime,
    );
  }

  factory NotificationGetDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationGetDtoFromJson(json);
}
