// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotificationGetTearOff {
  const _$NotificationGetTearOff();

  _NotificationGet call(
      {required UniqueId id,
      required String title,
      required String body,
      required String topic,
      required String sentTime}) {
    return _NotificationGet(
      id: id,
      title: title,
      body: body,
      topic: topic,
      sentTime: sentTime,
    );
  }
}

/// @nodoc
const $NotificationGet = _$NotificationGetTearOff();

/// @nodoc
mixin _$NotificationGet {
  UniqueId get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  String get sentTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationGetCopyWith<NotificationGet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationGetCopyWith<$Res> {
  factory $NotificationGetCopyWith(
          NotificationGet value, $Res Function(NotificationGet) then) =
      _$NotificationGetCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id, String title, String body, String topic, String sentTime});
}

/// @nodoc
class _$NotificationGetCopyWithImpl<$Res>
    implements $NotificationGetCopyWith<$Res> {
  _$NotificationGetCopyWithImpl(this._value, this._then);

  final NotificationGet _value;
  // ignore: unused_field
  final $Res Function(NotificationGet) _then;

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
              as UniqueId,
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
abstract class _$NotificationGetCopyWith<$Res>
    implements $NotificationGetCopyWith<$Res> {
  factory _$NotificationGetCopyWith(
          _NotificationGet value, $Res Function(_NotificationGet) then) =
      __$NotificationGetCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id, String title, String body, String topic, String sentTime});
}

/// @nodoc
class __$NotificationGetCopyWithImpl<$Res>
    extends _$NotificationGetCopyWithImpl<$Res>
    implements _$NotificationGetCopyWith<$Res> {
  __$NotificationGetCopyWithImpl(
      _NotificationGet _value, $Res Function(_NotificationGet) _then)
      : super(_value, (v) => _then(v as _NotificationGet));

  @override
  _NotificationGet get _value => super._value as _NotificationGet;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? topic = freezed,
    Object? sentTime = freezed,
  }) {
    return _then(_NotificationGet(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
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

class _$_NotificationGet implements _NotificationGet {
  const _$_NotificationGet(
      {required this.id,
      required this.title,
      required this.body,
      required this.topic,
      required this.sentTime});

  @override
  final UniqueId id;
  @override
  final String title;
  @override
  final String body;
  @override
  final String topic;
  @override
  final String sentTime;

  @override
  String toString() {
    return 'NotificationGet(id: $id, title: $title, body: $body, topic: $topic, sentTime: $sentTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationGet &&
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
  _$NotificationGetCopyWith<_NotificationGet> get copyWith =>
      __$NotificationGetCopyWithImpl<_NotificationGet>(this, _$identity);
}

abstract class _NotificationGet implements NotificationGet {
  const factory _NotificationGet(
      {required UniqueId id,
      required String title,
      required String body,
      required String topic,
      required String sentTime}) = _$_NotificationGet;

  @override
  UniqueId get id => throw _privateConstructorUsedError;
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
  _$NotificationGetCopyWith<_NotificationGet> get copyWith =>
      throw _privateConstructorUsedError;
}
