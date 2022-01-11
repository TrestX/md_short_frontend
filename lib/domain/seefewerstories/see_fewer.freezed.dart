// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'see_fewer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SeeFewerTearOff {
  const _$SeeFewerTearOff();

  _SeeFewer call({required String message}) {
    return _SeeFewer(
      message: message,
    );
  }
}

/// @nodoc
const $SeeFewer = _$SeeFewerTearOff();

/// @nodoc
mixin _$SeeFewer {
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SeeFewerCopyWith<SeeFewer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeeFewerCopyWith<$Res> {
  factory $SeeFewerCopyWith(SeeFewer value, $Res Function(SeeFewer) then) =
      _$SeeFewerCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$SeeFewerCopyWithImpl<$Res> implements $SeeFewerCopyWith<$Res> {
  _$SeeFewerCopyWithImpl(this._value, this._then);

  final SeeFewer _value;
  // ignore: unused_field
  final $Res Function(SeeFewer) _then;

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
abstract class _$SeeFewerCopyWith<$Res> implements $SeeFewerCopyWith<$Res> {
  factory _$SeeFewerCopyWith(_SeeFewer value, $Res Function(_SeeFewer) then) =
      __$SeeFewerCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$SeeFewerCopyWithImpl<$Res> extends _$SeeFewerCopyWithImpl<$Res>
    implements _$SeeFewerCopyWith<$Res> {
  __$SeeFewerCopyWithImpl(_SeeFewer _value, $Res Function(_SeeFewer) _then)
      : super(_value, (v) => _then(v as _SeeFewer));

  @override
  _SeeFewer get _value => super._value as _SeeFewer;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_SeeFewer(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SeeFewer implements _SeeFewer {
  const _$_SeeFewer({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'SeeFewer(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SeeFewer &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$SeeFewerCopyWith<_SeeFewer> get copyWith =>
      __$SeeFewerCopyWithImpl<_SeeFewer>(this, _$identity);
}

abstract class _SeeFewer implements SeeFewer {
  const factory _SeeFewer({required String message}) = _$_SeeFewer;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SeeFewerCopyWith<_SeeFewer> get copyWith =>
      throw _privateConstructorUsedError;
}
