// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'see_fewer_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SeeFewerDto _$SeeFewerDtoFromJson(Map<String, dynamic> json) {
  return _SeeFewerDto.fromJson(json);
}

/// @nodoc
class _$SeeFewerDtoTearOff {
  const _$SeeFewerDtoTearOff();

  _SeeFewerDto call({required String message}) {
    return _SeeFewerDto(
      message: message,
    );
  }

  SeeFewerDto fromJson(Map<String, Object> json) {
    return SeeFewerDto.fromJson(json);
  }
}

/// @nodoc
const $SeeFewerDto = _$SeeFewerDtoTearOff();

/// @nodoc
mixin _$SeeFewerDto {
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeeFewerDtoCopyWith<SeeFewerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeeFewerDtoCopyWith<$Res> {
  factory $SeeFewerDtoCopyWith(
          SeeFewerDto value, $Res Function(SeeFewerDto) then) =
      _$SeeFewerDtoCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$SeeFewerDtoCopyWithImpl<$Res> implements $SeeFewerDtoCopyWith<$Res> {
  _$SeeFewerDtoCopyWithImpl(this._value, this._then);

  final SeeFewerDto _value;
  // ignore: unused_field
  final $Res Function(SeeFewerDto) _then;

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
abstract class _$SeeFewerDtoCopyWith<$Res>
    implements $SeeFewerDtoCopyWith<$Res> {
  factory _$SeeFewerDtoCopyWith(
          _SeeFewerDto value, $Res Function(_SeeFewerDto) then) =
      __$SeeFewerDtoCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$SeeFewerDtoCopyWithImpl<$Res> extends _$SeeFewerDtoCopyWithImpl<$Res>
    implements _$SeeFewerDtoCopyWith<$Res> {
  __$SeeFewerDtoCopyWithImpl(
      _SeeFewerDto _value, $Res Function(_SeeFewerDto) _then)
      : super(_value, (v) => _then(v as _SeeFewerDto));

  @override
  _SeeFewerDto get _value => super._value as _SeeFewerDto;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_SeeFewerDto(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SeeFewerDto extends _SeeFewerDto with DiagnosticableTreeMixin {
  const _$_SeeFewerDto({required this.message}) : super._();

  factory _$_SeeFewerDto.fromJson(Map<String, dynamic> json) =>
      _$$_SeeFewerDtoFromJson(json);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SeeFewerDto(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SeeFewerDto'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SeeFewerDto &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$SeeFewerDtoCopyWith<_SeeFewerDto> get copyWith =>
      __$SeeFewerDtoCopyWithImpl<_SeeFewerDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SeeFewerDtoToJson(this);
  }
}

abstract class _SeeFewerDto extends SeeFewerDto {
  const factory _SeeFewerDto({required String message}) = _$_SeeFewerDto;
  const _SeeFewerDto._() : super._();

  factory _SeeFewerDto.fromJson(Map<String, dynamic> json) =
      _$_SeeFewerDto.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SeeFewerDtoCopyWith<_SeeFewerDto> get copyWith =>
      throw _privateConstructorUsedError;
}
