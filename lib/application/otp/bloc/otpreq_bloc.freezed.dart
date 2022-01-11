// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'otpreq_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OtpreqEventTearOff {
  const _$OtpreqEventTearOff();

  _VerifyOtp verifyOtp(String otp) {
    return _VerifyOtp(
      otp,
    );
  }

  _PasswordResetOtp passwordResetOtp(String email) {
    return _PasswordResetOtp(
      email,
    );
  }

  _ResendOtp resendOtp(String email) {
    return _ResendOtp(
      email,
    );
  }

  _VerifyPassOtp verifyPassOtp(String otp, String pass) {
    return _VerifyPassOtp(
      otp,
      pass,
    );
  }

  _VerifyEmailOtp verifyEmailOtp(String otp, String email) {
    return _VerifyEmailOtp(
      otp,
      email,
    );
  }

  _ChangePpassword changePpassword(String passwordStr) {
    return _ChangePpassword(
      passwordStr,
    );
  }

  PasswordVerified passwordVerified(bool passwrdVer) {
    return PasswordVerified(
      passwrdVer,
    );
  }

  _ChangeOtp changeOtp(String otp) {
    return _ChangeOtp(
      otp,
    );
  }
}

/// @nodoc
const $OtpreqEvent = _$OtpreqEventTearOff();

/// @nodoc
mixin _$OtpreqEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String otp) verifyOtp,
    required TResult Function(String email) passwordResetOtp,
    required TResult Function(String email) resendOtp,
    required TResult Function(String otp, String pass) verifyPassOtp,
    required TResult Function(String otp, String email) verifyEmailOtp,
    required TResult Function(String passwordStr) changePpassword,
    required TResult Function(bool passwrdVer) passwordVerified,
    required TResult Function(String otp) changeOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_PasswordResetOtp value) passwordResetOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_VerifyPassOtp value) verifyPassOtp,
    required TResult Function(_VerifyEmailOtp value) verifyEmailOtp,
    required TResult Function(_ChangePpassword value) changePpassword,
    required TResult Function(PasswordVerified value) passwordVerified,
    required TResult Function(_ChangeOtp value) changeOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpreqEventCopyWith<$Res> {
  factory $OtpreqEventCopyWith(
          OtpreqEvent value, $Res Function(OtpreqEvent) then) =
      _$OtpreqEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$OtpreqEventCopyWithImpl<$Res> implements $OtpreqEventCopyWith<$Res> {
  _$OtpreqEventCopyWithImpl(this._value, this._then);

  final OtpreqEvent _value;
  // ignore: unused_field
  final $Res Function(OtpreqEvent) _then;
}

/// @nodoc
abstract class _$VerifyOtpCopyWith<$Res> {
  factory _$VerifyOtpCopyWith(
          _VerifyOtp value, $Res Function(_VerifyOtp) then) =
      __$VerifyOtpCopyWithImpl<$Res>;
  $Res call({String otp});
}

/// @nodoc
class __$VerifyOtpCopyWithImpl<$Res> extends _$OtpreqEventCopyWithImpl<$Res>
    implements _$VerifyOtpCopyWith<$Res> {
  __$VerifyOtpCopyWithImpl(_VerifyOtp _value, $Res Function(_VerifyOtp) _then)
      : super(_value, (v) => _then(v as _VerifyOtp));

  @override
  _VerifyOtp get _value => super._value as _VerifyOtp;

  @override
  $Res call({
    Object? otp = freezed,
  }) {
    return _then(_VerifyOtp(
      otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_VerifyOtp implements _VerifyOtp {
  const _$_VerifyOtp(this.otp);

  @override
  final String otp;

  @override
  String toString() {
    return 'OtpreqEvent.verifyOtp(otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VerifyOtp &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(otp);

  @JsonKey(ignore: true)
  @override
  _$VerifyOtpCopyWith<_VerifyOtp> get copyWith =>
      __$VerifyOtpCopyWithImpl<_VerifyOtp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String otp) verifyOtp,
    required TResult Function(String email) passwordResetOtp,
    required TResult Function(String email) resendOtp,
    required TResult Function(String otp, String pass) verifyPassOtp,
    required TResult Function(String otp, String email) verifyEmailOtp,
    required TResult Function(String passwordStr) changePpassword,
    required TResult Function(bool passwrdVer) passwordVerified,
    required TResult Function(String otp) changeOtp,
  }) {
    return verifyOtp(otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
  }) {
    return verifyOtp?.call(otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_PasswordResetOtp value) passwordResetOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_VerifyPassOtp value) verifyPassOtp,
    required TResult Function(_VerifyEmailOtp value) verifyEmailOtp,
    required TResult Function(_ChangePpassword value) changePpassword,
    required TResult Function(PasswordVerified value) passwordVerified,
    required TResult Function(_ChangeOtp value) changeOtp,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class _VerifyOtp implements OtpreqEvent {
  const factory _VerifyOtp(String otp) = _$_VerifyOtp;

  String get otp => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$VerifyOtpCopyWith<_VerifyOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PasswordResetOtpCopyWith<$Res> {
  factory _$PasswordResetOtpCopyWith(
          _PasswordResetOtp value, $Res Function(_PasswordResetOtp) then) =
      __$PasswordResetOtpCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class __$PasswordResetOtpCopyWithImpl<$Res>
    extends _$OtpreqEventCopyWithImpl<$Res>
    implements _$PasswordResetOtpCopyWith<$Res> {
  __$PasswordResetOtpCopyWithImpl(
      _PasswordResetOtp _value, $Res Function(_PasswordResetOtp) _then)
      : super(_value, (v) => _then(v as _PasswordResetOtp));

  @override
  _PasswordResetOtp get _value => super._value as _PasswordResetOtp;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_PasswordResetOtp(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PasswordResetOtp implements _PasswordResetOtp {
  const _$_PasswordResetOtp(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'OtpreqEvent.passwordResetOtp(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PasswordResetOtp &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  _$PasswordResetOtpCopyWith<_PasswordResetOtp> get copyWith =>
      __$PasswordResetOtpCopyWithImpl<_PasswordResetOtp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String otp) verifyOtp,
    required TResult Function(String email) passwordResetOtp,
    required TResult Function(String email) resendOtp,
    required TResult Function(String otp, String pass) verifyPassOtp,
    required TResult Function(String otp, String email) verifyEmailOtp,
    required TResult Function(String passwordStr) changePpassword,
    required TResult Function(bool passwrdVer) passwordVerified,
    required TResult Function(String otp) changeOtp,
  }) {
    return passwordResetOtp(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
  }) {
    return passwordResetOtp?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
    required TResult orElse(),
  }) {
    if (passwordResetOtp != null) {
      return passwordResetOtp(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_PasswordResetOtp value) passwordResetOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_VerifyPassOtp value) verifyPassOtp,
    required TResult Function(_VerifyEmailOtp value) verifyEmailOtp,
    required TResult Function(_ChangePpassword value) changePpassword,
    required TResult Function(PasswordVerified value) passwordVerified,
    required TResult Function(_ChangeOtp value) changeOtp,
  }) {
    return passwordResetOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
  }) {
    return passwordResetOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
    required TResult orElse(),
  }) {
    if (passwordResetOtp != null) {
      return passwordResetOtp(this);
    }
    return orElse();
  }
}

abstract class _PasswordResetOtp implements OtpreqEvent {
  const factory _PasswordResetOtp(String email) = _$_PasswordResetOtp;

  String get email => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PasswordResetOtpCopyWith<_PasswordResetOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ResendOtpCopyWith<$Res> {
  factory _$ResendOtpCopyWith(
          _ResendOtp value, $Res Function(_ResendOtp) then) =
      __$ResendOtpCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class __$ResendOtpCopyWithImpl<$Res> extends _$OtpreqEventCopyWithImpl<$Res>
    implements _$ResendOtpCopyWith<$Res> {
  __$ResendOtpCopyWithImpl(_ResendOtp _value, $Res Function(_ResendOtp) _then)
      : super(_value, (v) => _then(v as _ResendOtp));

  @override
  _ResendOtp get _value => super._value as _ResendOtp;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_ResendOtp(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ResendOtp implements _ResendOtp {
  const _$_ResendOtp(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'OtpreqEvent.resendOtp(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResendOtp &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  _$ResendOtpCopyWith<_ResendOtp> get copyWith =>
      __$ResendOtpCopyWithImpl<_ResendOtp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String otp) verifyOtp,
    required TResult Function(String email) passwordResetOtp,
    required TResult Function(String email) resendOtp,
    required TResult Function(String otp, String pass) verifyPassOtp,
    required TResult Function(String otp, String email) verifyEmailOtp,
    required TResult Function(String passwordStr) changePpassword,
    required TResult Function(bool passwrdVer) passwordVerified,
    required TResult Function(String otp) changeOtp,
  }) {
    return resendOtp(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
  }) {
    return resendOtp?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
    required TResult orElse(),
  }) {
    if (resendOtp != null) {
      return resendOtp(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_PasswordResetOtp value) passwordResetOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_VerifyPassOtp value) verifyPassOtp,
    required TResult Function(_VerifyEmailOtp value) verifyEmailOtp,
    required TResult Function(_ChangePpassword value) changePpassword,
    required TResult Function(PasswordVerified value) passwordVerified,
    required TResult Function(_ChangeOtp value) changeOtp,
  }) {
    return resendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
  }) {
    return resendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
    required TResult orElse(),
  }) {
    if (resendOtp != null) {
      return resendOtp(this);
    }
    return orElse();
  }
}

abstract class _ResendOtp implements OtpreqEvent {
  const factory _ResendOtp(String email) = _$_ResendOtp;

  String get email => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ResendOtpCopyWith<_ResendOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$VerifyPassOtpCopyWith<$Res> {
  factory _$VerifyPassOtpCopyWith(
          _VerifyPassOtp value, $Res Function(_VerifyPassOtp) then) =
      __$VerifyPassOtpCopyWithImpl<$Res>;
  $Res call({String otp, String pass});
}

/// @nodoc
class __$VerifyPassOtpCopyWithImpl<$Res> extends _$OtpreqEventCopyWithImpl<$Res>
    implements _$VerifyPassOtpCopyWith<$Res> {
  __$VerifyPassOtpCopyWithImpl(
      _VerifyPassOtp _value, $Res Function(_VerifyPassOtp) _then)
      : super(_value, (v) => _then(v as _VerifyPassOtp));

  @override
  _VerifyPassOtp get _value => super._value as _VerifyPassOtp;

  @override
  $Res call({
    Object? otp = freezed,
    Object? pass = freezed,
  }) {
    return _then(_VerifyPassOtp(
      otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      pass == freezed
          ? _value.pass
          : pass // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_VerifyPassOtp implements _VerifyPassOtp {
  const _$_VerifyPassOtp(this.otp, this.pass);

  @override
  final String otp;
  @override
  final String pass;

  @override
  String toString() {
    return 'OtpreqEvent.verifyPassOtp(otp: $otp, pass: $pass)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VerifyPassOtp &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)) &&
            (identical(other.pass, pass) ||
                const DeepCollectionEquality().equals(other.pass, pass)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(otp) ^
      const DeepCollectionEquality().hash(pass);

  @JsonKey(ignore: true)
  @override
  _$VerifyPassOtpCopyWith<_VerifyPassOtp> get copyWith =>
      __$VerifyPassOtpCopyWithImpl<_VerifyPassOtp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String otp) verifyOtp,
    required TResult Function(String email) passwordResetOtp,
    required TResult Function(String email) resendOtp,
    required TResult Function(String otp, String pass) verifyPassOtp,
    required TResult Function(String otp, String email) verifyEmailOtp,
    required TResult Function(String passwordStr) changePpassword,
    required TResult Function(bool passwrdVer) passwordVerified,
    required TResult Function(String otp) changeOtp,
  }) {
    return verifyPassOtp(otp, pass);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
  }) {
    return verifyPassOtp?.call(otp, pass);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
    required TResult orElse(),
  }) {
    if (verifyPassOtp != null) {
      return verifyPassOtp(otp, pass);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_PasswordResetOtp value) passwordResetOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_VerifyPassOtp value) verifyPassOtp,
    required TResult Function(_VerifyEmailOtp value) verifyEmailOtp,
    required TResult Function(_ChangePpassword value) changePpassword,
    required TResult Function(PasswordVerified value) passwordVerified,
    required TResult Function(_ChangeOtp value) changeOtp,
  }) {
    return verifyPassOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
  }) {
    return verifyPassOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
    required TResult orElse(),
  }) {
    if (verifyPassOtp != null) {
      return verifyPassOtp(this);
    }
    return orElse();
  }
}

abstract class _VerifyPassOtp implements OtpreqEvent {
  const factory _VerifyPassOtp(String otp, String pass) = _$_VerifyPassOtp;

  String get otp => throw _privateConstructorUsedError;
  String get pass => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$VerifyPassOtpCopyWith<_VerifyPassOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$VerifyEmailOtpCopyWith<$Res> {
  factory _$VerifyEmailOtpCopyWith(
          _VerifyEmailOtp value, $Res Function(_VerifyEmailOtp) then) =
      __$VerifyEmailOtpCopyWithImpl<$Res>;
  $Res call({String otp, String email});
}

/// @nodoc
class __$VerifyEmailOtpCopyWithImpl<$Res>
    extends _$OtpreqEventCopyWithImpl<$Res>
    implements _$VerifyEmailOtpCopyWith<$Res> {
  __$VerifyEmailOtpCopyWithImpl(
      _VerifyEmailOtp _value, $Res Function(_VerifyEmailOtp) _then)
      : super(_value, (v) => _then(v as _VerifyEmailOtp));

  @override
  _VerifyEmailOtp get _value => super._value as _VerifyEmailOtp;

  @override
  $Res call({
    Object? otp = freezed,
    Object? email = freezed,
  }) {
    return _then(_VerifyEmailOtp(
      otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_VerifyEmailOtp implements _VerifyEmailOtp {
  const _$_VerifyEmailOtp(this.otp, this.email);

  @override
  final String otp;
  @override
  final String email;

  @override
  String toString() {
    return 'OtpreqEvent.verifyEmailOtp(otp: $otp, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VerifyEmailOtp &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(otp) ^
      const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  _$VerifyEmailOtpCopyWith<_VerifyEmailOtp> get copyWith =>
      __$VerifyEmailOtpCopyWithImpl<_VerifyEmailOtp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String otp) verifyOtp,
    required TResult Function(String email) passwordResetOtp,
    required TResult Function(String email) resendOtp,
    required TResult Function(String otp, String pass) verifyPassOtp,
    required TResult Function(String otp, String email) verifyEmailOtp,
    required TResult Function(String passwordStr) changePpassword,
    required TResult Function(bool passwrdVer) passwordVerified,
    required TResult Function(String otp) changeOtp,
  }) {
    return verifyEmailOtp(otp, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
  }) {
    return verifyEmailOtp?.call(otp, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
    required TResult orElse(),
  }) {
    if (verifyEmailOtp != null) {
      return verifyEmailOtp(otp, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_PasswordResetOtp value) passwordResetOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_VerifyPassOtp value) verifyPassOtp,
    required TResult Function(_VerifyEmailOtp value) verifyEmailOtp,
    required TResult Function(_ChangePpassword value) changePpassword,
    required TResult Function(PasswordVerified value) passwordVerified,
    required TResult Function(_ChangeOtp value) changeOtp,
  }) {
    return verifyEmailOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
  }) {
    return verifyEmailOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
    required TResult orElse(),
  }) {
    if (verifyEmailOtp != null) {
      return verifyEmailOtp(this);
    }
    return orElse();
  }
}

abstract class _VerifyEmailOtp implements OtpreqEvent {
  const factory _VerifyEmailOtp(String otp, String email) = _$_VerifyEmailOtp;

  String get otp => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$VerifyEmailOtpCopyWith<_VerifyEmailOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ChangePpasswordCopyWith<$Res> {
  factory _$ChangePpasswordCopyWith(
          _ChangePpassword value, $Res Function(_ChangePpassword) then) =
      __$ChangePpasswordCopyWithImpl<$Res>;
  $Res call({String passwordStr});
}

/// @nodoc
class __$ChangePpasswordCopyWithImpl<$Res>
    extends _$OtpreqEventCopyWithImpl<$Res>
    implements _$ChangePpasswordCopyWith<$Res> {
  __$ChangePpasswordCopyWithImpl(
      _ChangePpassword _value, $Res Function(_ChangePpassword) _then)
      : super(_value, (v) => _then(v as _ChangePpassword));

  @override
  _ChangePpassword get _value => super._value as _ChangePpassword;

  @override
  $Res call({
    Object? passwordStr = freezed,
  }) {
    return _then(_ChangePpassword(
      passwordStr == freezed
          ? _value.passwordStr
          : passwordStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangePpassword implements _ChangePpassword {
  const _$_ChangePpassword(this.passwordStr);

  @override
  final String passwordStr;

  @override
  String toString() {
    return 'OtpreqEvent.changePpassword(passwordStr: $passwordStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChangePpassword &&
            (identical(other.passwordStr, passwordStr) ||
                const DeepCollectionEquality()
                    .equals(other.passwordStr, passwordStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(passwordStr);

  @JsonKey(ignore: true)
  @override
  _$ChangePpasswordCopyWith<_ChangePpassword> get copyWith =>
      __$ChangePpasswordCopyWithImpl<_ChangePpassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String otp) verifyOtp,
    required TResult Function(String email) passwordResetOtp,
    required TResult Function(String email) resendOtp,
    required TResult Function(String otp, String pass) verifyPassOtp,
    required TResult Function(String otp, String email) verifyEmailOtp,
    required TResult Function(String passwordStr) changePpassword,
    required TResult Function(bool passwrdVer) passwordVerified,
    required TResult Function(String otp) changeOtp,
  }) {
    return changePpassword(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
  }) {
    return changePpassword?.call(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
    required TResult orElse(),
  }) {
    if (changePpassword != null) {
      return changePpassword(passwordStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_PasswordResetOtp value) passwordResetOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_VerifyPassOtp value) verifyPassOtp,
    required TResult Function(_VerifyEmailOtp value) verifyEmailOtp,
    required TResult Function(_ChangePpassword value) changePpassword,
    required TResult Function(PasswordVerified value) passwordVerified,
    required TResult Function(_ChangeOtp value) changeOtp,
  }) {
    return changePpassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
  }) {
    return changePpassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
    required TResult orElse(),
  }) {
    if (changePpassword != null) {
      return changePpassword(this);
    }
    return orElse();
  }
}

abstract class _ChangePpassword implements OtpreqEvent {
  const factory _ChangePpassword(String passwordStr) = _$_ChangePpassword;

  String get passwordStr => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ChangePpasswordCopyWith<_ChangePpassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordVerifiedCopyWith<$Res> {
  factory $PasswordVerifiedCopyWith(
          PasswordVerified value, $Res Function(PasswordVerified) then) =
      _$PasswordVerifiedCopyWithImpl<$Res>;
  $Res call({bool passwrdVer});
}

/// @nodoc
class _$PasswordVerifiedCopyWithImpl<$Res>
    extends _$OtpreqEventCopyWithImpl<$Res>
    implements $PasswordVerifiedCopyWith<$Res> {
  _$PasswordVerifiedCopyWithImpl(
      PasswordVerified _value, $Res Function(PasswordVerified) _then)
      : super(_value, (v) => _then(v as PasswordVerified));

  @override
  PasswordVerified get _value => super._value as PasswordVerified;

  @override
  $Res call({
    Object? passwrdVer = freezed,
  }) {
    return _then(PasswordVerified(
      passwrdVer == freezed
          ? _value.passwrdVer
          : passwrdVer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PasswordVerified implements PasswordVerified {
  const _$PasswordVerified(this.passwrdVer);

  @override
  final bool passwrdVer;

  @override
  String toString() {
    return 'OtpreqEvent.passwordVerified(passwrdVer: $passwrdVer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordVerified &&
            (identical(other.passwrdVer, passwrdVer) ||
                const DeepCollectionEquality()
                    .equals(other.passwrdVer, passwrdVer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(passwrdVer);

  @JsonKey(ignore: true)
  @override
  $PasswordVerifiedCopyWith<PasswordVerified> get copyWith =>
      _$PasswordVerifiedCopyWithImpl<PasswordVerified>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String otp) verifyOtp,
    required TResult Function(String email) passwordResetOtp,
    required TResult Function(String email) resendOtp,
    required TResult Function(String otp, String pass) verifyPassOtp,
    required TResult Function(String otp, String email) verifyEmailOtp,
    required TResult Function(String passwordStr) changePpassword,
    required TResult Function(bool passwrdVer) passwordVerified,
    required TResult Function(String otp) changeOtp,
  }) {
    return passwordVerified(passwrdVer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
  }) {
    return passwordVerified?.call(passwrdVer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
    required TResult orElse(),
  }) {
    if (passwordVerified != null) {
      return passwordVerified(passwrdVer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_PasswordResetOtp value) passwordResetOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_VerifyPassOtp value) verifyPassOtp,
    required TResult Function(_VerifyEmailOtp value) verifyEmailOtp,
    required TResult Function(_ChangePpassword value) changePpassword,
    required TResult Function(PasswordVerified value) passwordVerified,
    required TResult Function(_ChangeOtp value) changeOtp,
  }) {
    return passwordVerified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
  }) {
    return passwordVerified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
    required TResult orElse(),
  }) {
    if (passwordVerified != null) {
      return passwordVerified(this);
    }
    return orElse();
  }
}

abstract class PasswordVerified implements OtpreqEvent {
  const factory PasswordVerified(bool passwrdVer) = _$PasswordVerified;

  bool get passwrdVer => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PasswordVerifiedCopyWith<PasswordVerified> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ChangeOtpCopyWith<$Res> {
  factory _$ChangeOtpCopyWith(
          _ChangeOtp value, $Res Function(_ChangeOtp) then) =
      __$ChangeOtpCopyWithImpl<$Res>;
  $Res call({String otp});
}

/// @nodoc
class __$ChangeOtpCopyWithImpl<$Res> extends _$OtpreqEventCopyWithImpl<$Res>
    implements _$ChangeOtpCopyWith<$Res> {
  __$ChangeOtpCopyWithImpl(_ChangeOtp _value, $Res Function(_ChangeOtp) _then)
      : super(_value, (v) => _then(v as _ChangeOtp));

  @override
  _ChangeOtp get _value => super._value as _ChangeOtp;

  @override
  $Res call({
    Object? otp = freezed,
  }) {
    return _then(_ChangeOtp(
      otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeOtp implements _ChangeOtp {
  const _$_ChangeOtp(this.otp);

  @override
  final String otp;

  @override
  String toString() {
    return 'OtpreqEvent.changeOtp(otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChangeOtp &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(otp);

  @JsonKey(ignore: true)
  @override
  _$ChangeOtpCopyWith<_ChangeOtp> get copyWith =>
      __$ChangeOtpCopyWithImpl<_ChangeOtp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String otp) verifyOtp,
    required TResult Function(String email) passwordResetOtp,
    required TResult Function(String email) resendOtp,
    required TResult Function(String otp, String pass) verifyPassOtp,
    required TResult Function(String otp, String email) verifyEmailOtp,
    required TResult Function(String passwordStr) changePpassword,
    required TResult Function(bool passwrdVer) passwordVerified,
    required TResult Function(String otp) changeOtp,
  }) {
    return changeOtp(otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
  }) {
    return changeOtp?.call(otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String otp)? verifyOtp,
    TResult Function(String email)? passwordResetOtp,
    TResult Function(String email)? resendOtp,
    TResult Function(String otp, String pass)? verifyPassOtp,
    TResult Function(String otp, String email)? verifyEmailOtp,
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    TResult Function(String otp)? changeOtp,
    required TResult orElse(),
  }) {
    if (changeOtp != null) {
      return changeOtp(otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_PasswordResetOtp value) passwordResetOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_VerifyPassOtp value) verifyPassOtp,
    required TResult Function(_VerifyEmailOtp value) verifyEmailOtp,
    required TResult Function(_ChangePpassword value) changePpassword,
    required TResult Function(PasswordVerified value) passwordVerified,
    required TResult Function(_ChangeOtp value) changeOtp,
  }) {
    return changeOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
  }) {
    return changeOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PasswordResetOtp value)? passwordResetOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_VerifyPassOtp value)? verifyPassOtp,
    TResult Function(_VerifyEmailOtp value)? verifyEmailOtp,
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    TResult Function(_ChangeOtp value)? changeOtp,
    required TResult orElse(),
  }) {
    if (changeOtp != null) {
      return changeOtp(this);
    }
    return orElse();
  }
}

abstract class _ChangeOtp implements OtpreqEvent {
  const factory _ChangeOtp(String otp) = _$_ChangeOtp;

  String get otp => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ChangeOtpCopyWith<_ChangeOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$OtpreqStateTearOff {
  const _$OtpreqStateTearOff();

  _OtpreqState call(
      {required Password password,
      required bool passwordVerified,
      required String otp,
      required bool showErrorMessages,
      required Option<Either<OtpFailure, Otp>> otpFailureOrSuccessOption,
      required Option<Either<AuthFailure, Unit>>
          emailotpFailureOrSuccessOption}) {
    return _OtpreqState(
      password: password,
      passwordVerified: passwordVerified,
      otp: otp,
      showErrorMessages: showErrorMessages,
      otpFailureOrSuccessOption: otpFailureOrSuccessOption,
      emailotpFailureOrSuccessOption: emailotpFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $OtpreqState = _$OtpreqStateTearOff();

/// @nodoc
mixin _$OtpreqState {
  Password get password => throw _privateConstructorUsedError;
  bool get passwordVerified => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<Either<OtpFailure, Otp>> get otpFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get emailotpFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtpreqStateCopyWith<OtpreqState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpreqStateCopyWith<$Res> {
  factory $OtpreqStateCopyWith(
          OtpreqState value, $Res Function(OtpreqState) then) =
      _$OtpreqStateCopyWithImpl<$Res>;
  $Res call(
      {Password password,
      bool passwordVerified,
      String otp,
      bool showErrorMessages,
      Option<Either<OtpFailure, Otp>> otpFailureOrSuccessOption,
      Option<Either<AuthFailure, Unit>> emailotpFailureOrSuccessOption});
}

/// @nodoc
class _$OtpreqStateCopyWithImpl<$Res> implements $OtpreqStateCopyWith<$Res> {
  _$OtpreqStateCopyWithImpl(this._value, this._then);

  final OtpreqState _value;
  // ignore: unused_field
  final $Res Function(OtpreqState) _then;

  @override
  $Res call({
    Object? password = freezed,
    Object? passwordVerified = freezed,
    Object? otp = freezed,
    Object? showErrorMessages = freezed,
    Object? otpFailureOrSuccessOption = freezed,
    Object? emailotpFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      passwordVerified: passwordVerified == freezed
          ? _value.passwordVerified
          : passwordVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      otpFailureOrSuccessOption: otpFailureOrSuccessOption == freezed
          ? _value.otpFailureOrSuccessOption
          : otpFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<OtpFailure, Otp>>,
      emailotpFailureOrSuccessOption: emailotpFailureOrSuccessOption == freezed
          ? _value.emailotpFailureOrSuccessOption
          : emailotpFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$OtpreqStateCopyWith<$Res>
    implements $OtpreqStateCopyWith<$Res> {
  factory _$OtpreqStateCopyWith(
          _OtpreqState value, $Res Function(_OtpreqState) then) =
      __$OtpreqStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Password password,
      bool passwordVerified,
      String otp,
      bool showErrorMessages,
      Option<Either<OtpFailure, Otp>> otpFailureOrSuccessOption,
      Option<Either<AuthFailure, Unit>> emailotpFailureOrSuccessOption});
}

/// @nodoc
class __$OtpreqStateCopyWithImpl<$Res> extends _$OtpreqStateCopyWithImpl<$Res>
    implements _$OtpreqStateCopyWith<$Res> {
  __$OtpreqStateCopyWithImpl(
      _OtpreqState _value, $Res Function(_OtpreqState) _then)
      : super(_value, (v) => _then(v as _OtpreqState));

  @override
  _OtpreqState get _value => super._value as _OtpreqState;

  @override
  $Res call({
    Object? password = freezed,
    Object? passwordVerified = freezed,
    Object? otp = freezed,
    Object? showErrorMessages = freezed,
    Object? otpFailureOrSuccessOption = freezed,
    Object? emailotpFailureOrSuccessOption = freezed,
  }) {
    return _then(_OtpreqState(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      passwordVerified: passwordVerified == freezed
          ? _value.passwordVerified
          : passwordVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      otpFailureOrSuccessOption: otpFailureOrSuccessOption == freezed
          ? _value.otpFailureOrSuccessOption
          : otpFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<OtpFailure, Otp>>,
      emailotpFailureOrSuccessOption: emailotpFailureOrSuccessOption == freezed
          ? _value.emailotpFailureOrSuccessOption
          : emailotpFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_OtpreqState implements _OtpreqState {
  const _$_OtpreqState(
      {required this.password,
      required this.passwordVerified,
      required this.otp,
      required this.showErrorMessages,
      required this.otpFailureOrSuccessOption,
      required this.emailotpFailureOrSuccessOption});

  @override
  final Password password;
  @override
  final bool passwordVerified;
  @override
  final String otp;
  @override
  final bool showErrorMessages;
  @override
  final Option<Either<OtpFailure, Otp>> otpFailureOrSuccessOption;
  @override
  final Option<Either<AuthFailure, Unit>> emailotpFailureOrSuccessOption;

  @override
  String toString() {
    return 'OtpreqState(password: $password, passwordVerified: $passwordVerified, otp: $otp, showErrorMessages: $showErrorMessages, otpFailureOrSuccessOption: $otpFailureOrSuccessOption, emailotpFailureOrSuccessOption: $emailotpFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OtpreqState &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.passwordVerified, passwordVerified) ||
                const DeepCollectionEquality()
                    .equals(other.passwordVerified, passwordVerified)) &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.otpFailureOrSuccessOption,
                    otpFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.otpFailureOrSuccessOption,
                    otpFailureOrSuccessOption)) &&
            (identical(other.emailotpFailureOrSuccessOption,
                    emailotpFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.emailotpFailureOrSuccessOption,
                    emailotpFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(passwordVerified) ^
      const DeepCollectionEquality().hash(otp) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(otpFailureOrSuccessOption) ^
      const DeepCollectionEquality().hash(emailotpFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  _$OtpreqStateCopyWith<_OtpreqState> get copyWith =>
      __$OtpreqStateCopyWithImpl<_OtpreqState>(this, _$identity);
}

abstract class _OtpreqState implements OtpreqState {
  const factory _OtpreqState(
      {required Password password,
      required bool passwordVerified,
      required String otp,
      required bool showErrorMessages,
      required Option<Either<OtpFailure, Otp>> otpFailureOrSuccessOption,
      required Option<Either<AuthFailure, Unit>>
          emailotpFailureOrSuccessOption}) = _$_OtpreqState;

  @override
  Password get password => throw _privateConstructorUsedError;
  @override
  bool get passwordVerified => throw _privateConstructorUsedError;
  @override
  String get otp => throw _privateConstructorUsedError;
  @override
  bool get showErrorMessages => throw _privateConstructorUsedError;
  @override
  Option<Either<OtpFailure, Otp>> get otpFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  @override
  Option<Either<AuthFailure, Unit>> get emailotpFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OtpreqStateCopyWith<_OtpreqState> get copyWith =>
      throw _privateConstructorUsedError;
}
