// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationGetDto _$NotificationGetDtoFromJson(Map<String, dynamic> json) {
  return _NotificationGetDto.fromJson(json);
}

/// @nodoc
class _$NotificationGetDtoTearOff {
  const _$NotificationGetDtoTearOff();

  _NotificationGetDto call(
      {required String id,
      required String title,
      required String body,
      required String topic,
      required String sentTime}) {
    return _NotificationGetDto(
      id: id,
      title: title,
      body: body,
      topic: topic,
      sentTime: sentTime,
    );
  }

  NotificationGetDto fromJson(Map<String, Object> json) {
    return NotificationGetDto.fromJson(json);
  }
}

/// @nodoc
const $NotificationGetDto = _$NotificationGetDtoTearOff();

/// @nodoc
mixin _$NotificationGetDto {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  String get sentTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationGetDtoCopyWith<NotificationGetDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationGetDtoCopyWith<$Res> {
  factory $NotificationGetDtoCopyWith(
          NotificationGetDto value, $Res Function(NotificationGetDto) then) =
      _$NotificationGetDtoCopyWithImpl<$Res>;
  $Res call(
      {String id, String title, String body, String topic, String sentTime});
}

/// @nodoc
class _$NotificationGetDtoCopyWithImpl<$Res>
    implements $NotificationGetDtoCopyWith<$Res> {
  _$NotificationGetDtoCopyWithImpl(this._value, this._then);

  final NotificationGetDto _value;
  // ignore: unused_field
  final $Res Function(NotificationGetDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? topic = freezed,
    Object? sentTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      sentTime: sentTime == freezed
          ? _value.sentTime
          : sentTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$NotificationGetDtoCopyWith<$Res>
    implements $NotificationGetDtoCopyWith<$Res> {
  factory _$NotificationGetDtoCopyWith(
          _NotificationGetDto value, $Res Function(_NotificationGetDto) then) =
      __$NotificationGetDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String title, String body, String topic, String sentTime});
}

/// @nodoc
class __$NotificationGetDtoCopyWithImpl<$Res>
    extends _$NotificationGetDtoCopyWithImpl<$Res>
    implements _$NotificationGetDtoCopyWith<$Res> {
  __$NotificationGetDtoCopyWithImpl(
      _NotificationGetDto _value, $Res Function(_NotificationGetDto) _then)
      : super(_value, (v) => _then(v as _NotificationGetDto));

  @override
  _NotificationGetDto get _value => super._value as _NotificationGetDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? topic = freezed,
    Object? sentTime = freezed,
  }) {
    return _then(_NotificationGetDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      sentTime: sentTime == freezed
          ? _value.sentTime
          : sentTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationGetDto extends _NotificationGetDto
    with DiagnosticableTreeMixin {
  const _$_NotificationGetDto(
      {required this.id,
      required this.title,
      required this.body,
      required this.topic,
      required this.sentTime})
      : super._();

  factory _$_NotificationGetDto.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationGetDtoFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String body;
  @override
  final String topic;
  @override
  final String sentTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationGetDto(id: $id, title: $title, body: $body, topic: $topic, sentTime: $sentTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationGetDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('topic', topic))
      ..add(DiagnosticsProperty('sentTime', sentTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationGetDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.topic, topic) ||
                const DeepCollectionEquality().equals(other.topic, topic)) &&
            (identical(other.sentTime, sentTime) ||
                const DeepCollectionEquality()
                    .equals(other.sentTime, sentTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(topic) ^
      const DeepCollectionEquality().hash(sentTime);

  @JsonKey(ignore: true)
  @override
  _$NotificationGetDtoCopyWith<_NotificationGetDto> get copyWith =>
      __$NotificationGetDtoCopyWithImpl<_NotificationGetDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationGetDtoToJson(this);
  }
}

abstract class _NotificationGetDto extends NotificationGetDto {
  const factory _NotificationGetDto(
      {required String id,
      required String title,
      required String body,
      required String topic,
      required String sentTime}) = _$_NotificationGetDto;
  const _NotificationGetDto._() : super._();

  factory _NotificationGetDto.fromJson(Map<String, dynamic> json) =
      _$_NotificationGetDto.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get body => throw _privateConstructorUsedError;
  @override
  String get topic => throw _privateConstructorUsedError;
  @override
  String get sentTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotificationGetDtoCopyWith<_NotificationGetDto> get copyWith =>
      throw _privateConstructorUsedError;
}
