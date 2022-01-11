// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationGetDto _$$_NotificationGetDtoFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationGetDto(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      topic: json['topic'] as String,
      sentTime: json['sentTime'] as String,
    );

Map<String, dynamic> _$$_NotificationGetDtoToJson(
        _$_NotificationGetDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'topic': instance.topic,
      'sentTime': instance.sentTime,
    };
