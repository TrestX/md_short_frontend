// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UpdateNewsTearOff {
  const _$UpdateNewsTearOff();

  _UpdateNews call({required String message}) {
    return _UpdateNews(
      message: message,
    );
  }
}

/// @nodoc
const $UpdateNews = _$UpdateNewsTearOff();

/// @nodoc
mixin _$UpdateNews {
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateNewsCopyWith<UpdateNews> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateNewsCopyWith<$Res> {
  factory $UpdateNewsCopyWith(
          UpdateNews value, $Res Function(UpdateNews) then) =
      _$UpdateNewsCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$UpdateNewsCopyWithImpl<$Res> implements $UpdateNewsCopyWith<$Res> {
  _$UpdateNewsCopyWithImpl(this._value, this._then);

  final UpdateNews _value;
  // ignore: unused_field
  final $Res Function(UpdateNews) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UpdateNewsCopyWith<$Res> implements $UpdateNewsCopyWith<$Res> {
  factory _$UpdateNewsCopyWith(
          _UpdateNews value, $Res Function(_UpdateNews) then) =
      __$UpdateNewsCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$UpdateNewsCopyWithImpl<$Res> extends _$UpdateNewsCopyWithImpl<$Res>
    implements _$UpdateNewsCopyWith<$Res> {
  __$UpdateNewsCopyWithImpl(
      _UpdateNews _value, $Res Function(_UpdateNews) _then)
      : super(_value, (v) => _then(v as _UpdateNews));

  @override
  _UpdateNews get _value => super._value as _UpdateNews;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_UpdateNews(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateNews implements _UpdateNews {
  const _$_UpdateNews({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'UpdateNews(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateNews &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$UpdateNewsCopyWith<_UpdateNews> get copyWith =>
      __$UpdateNewsCopyWithImpl<_UpdateNews>(this, _$identity);
}

abstract class _UpdateNews implements UpdateNews {
  const factory _UpdateNews({required String message}) = _$_UpdateNews;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UpdateNewsCopyWith<_UpdateNews> get copyWith =>
      throw _privateConstructorUsedError;
}
