// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'changepassword_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChangepasswordEventTearOff {
  const _$ChangepasswordEventTearOff();

  _ChangePpassword changePpassword(String passwordStr) {
    return _ChangePpassword(
      passwordStr,
    );
  }

  _ChangePassword changePassword(Password password) {
    return _ChangePassword(
      password,
    );
  }

  PasswordVerified passwordVerified(bool passwrdVer) {
    return PasswordVerified(
      passwrdVer,
    );
  }
}

/// @nodoc
const $ChangepasswordEvent = _$ChangepasswordEventTearOff();

/// @nodoc
mixin _$ChangepasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passwordStr) changePpassword,
    required TResult Function(Password password) changePassword,
    required TResult Function(bool passwrdVer) passwordVerified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(Password password)? changePassword,
    TResult Function(bool passwrdVer)? passwordVerified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(Password password)? changePassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangePpassword value) changePpassword,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(PasswordVerified value) passwordVerified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(PasswordVerified value)? passwordVerified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangepasswordEventCopyWith<$Res> {
  factory $ChangepasswordEventCopyWith(
          ChangepasswordEvent value, $Res Function(ChangepasswordEvent) then) =
      _$ChangepasswordEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChangepasswordEventCopyWithImpl<$Res>
    implements $ChangepasswordEventCopyWith<$Res> {
  _$ChangepasswordEventCopyWithImpl(this._value, this._then);

  final ChangepasswordEvent _value;
  // ignore: unused_field
  final $Res Function(ChangepasswordEvent) _then;
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
    extends _$ChangepasswordEventCopyWithImpl<$Res>
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
    return 'ChangepasswordEvent.changePpassword(passwordStr: $passwordStr)';
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
    required TResult Function(String passwordStr) changePpassword,
    required TResult Function(Password password) changePassword,
    required TResult Function(bool passwrdVer) passwordVerified,
  }) {
    return changePpassword(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(Password password)? changePassword,
    TResult Function(bool passwrdVer)? passwordVerified,
  }) {
    return changePpassword?.call(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(Password password)? changePassword,
    TResult Function(bool passwrdVer)? passwordVerified,
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
    required TResult Function(_ChangePpassword value) changePpassword,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(PasswordVerified value) passwordVerified,
  }) {
    return changePpassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(PasswordVerified value)? passwordVerified,
  }) {
    return changePpassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    required TResult orElse(),
  }) {
    if (changePpassword != null) {
      return changePpassword(this);
    }
    return orElse();
  }
}

abstract class _ChangePpassword implements ChangepasswordEvent {
  const factory _ChangePpassword(String passwordStr) = _$_ChangePpassword;

  String get passwordStr => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ChangePpasswordCopyWith<_ChangePpassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ChangePasswordCopyWith<$Res> {
  factory _$ChangePasswordCopyWith(
          _ChangePassword value, $Res Function(_ChangePassword) then) =
      __$ChangePasswordCopyWithImpl<$Res>;
  $Res call({Password password});
}

/// @nodoc
class __$ChangePasswordCopyWithImpl<$Res>
    extends _$ChangepasswordEventCopyWithImpl<$Res>
    implements _$ChangePasswordCopyWith<$Res> {
  __$ChangePasswordCopyWithImpl(
      _ChangePassword _value, $Res Function(_ChangePassword) _then)
      : super(_value, (v) => _then(v as _ChangePassword));

  @override
  _ChangePassword get _value => super._value as _ChangePassword;

  @override
  $Res call({
    Object? password = freezed,
  }) {
    return _then(_ChangePassword(
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
    ));
  }
}

/// @nodoc

class _$_ChangePassword implements _ChangePassword {
  const _$_ChangePassword(this.password);

  @override
  final Password password;

  @override
  String toString() {
    return 'ChangepasswordEvent.changePassword(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChangePassword &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$ChangePasswordCopyWith<_ChangePassword> get copyWith =>
      __$ChangePasswordCopyWithImpl<_ChangePassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passwordStr) changePpassword,
    required TResult Function(Password password) changePassword,
    required TResult Function(bool passwrdVer) passwordVerified,
  }) {
    return changePassword(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(Password password)? changePassword,
    TResult Function(bool passwrdVer)? passwordVerified,
  }) {
    return changePassword?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(Password password)? changePassword,
    TResult Function(bool passwrdVer)? passwordVerified,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangePpassword value) changePpassword,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(PasswordVerified value) passwordVerified,
  }) {
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(PasswordVerified value)? passwordVerified,
  }) {
    return changePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class _ChangePassword implements ChangepasswordEvent {
  const factory _ChangePassword(Password password) = _$_ChangePassword;

  Password get password => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ChangePasswordCopyWith<_ChangePassword> get copyWith =>
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
    extends _$ChangepasswordEventCopyWithImpl<$Res>
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
    return 'ChangepasswordEvent.passwordVerified(passwrdVer: $passwrdVer)';
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
    required TResult Function(String passwordStr) changePpassword,
    required TResult Function(Password password) changePassword,
    required TResult Function(bool passwrdVer) passwordVerified,
  }) {
    return passwordVerified(passwrdVer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(Password password)? changePassword,
    TResult Function(bool passwrdVer)? passwordVerified,
  }) {
    return passwordVerified?.call(passwrdVer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passwordStr)? changePpassword,
    TResult Function(Password password)? changePassword,
    TResult Function(bool passwrdVer)? passwordVerified,
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
    required TResult Function(_ChangePpassword value) changePpassword,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(PasswordVerified value) passwordVerified,
  }) {
    return passwordVerified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(PasswordVerified value)? passwordVerified,
  }) {
    return passwordVerified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangePpassword value)? changePpassword,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(PasswordVerified value)? passwordVerified,
    required TResult orElse(),
  }) {
    if (passwordVerified != null) {
      return passwordVerified(this);
    }
    return orElse();
  }
}

abstract class PasswordVerified implements ChangepasswordEvent {
  const factory PasswordVerified(bool passwrdVer) = _$PasswordVerified;

  bool get passwrdVer => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PasswordVerifiedCopyWith<PasswordVerified> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ChangepasswordStateTearOff {
  const _$ChangepasswordStateTearOff();

  _ChangepasswordState call(
      {required Password password,
      required bool passwordVerified,
      required bool showErrorMessages,
      required Option<Either<SettingsFailure, Settings>>
          settingsFailureOrSuccessOption}) {
    return _ChangepasswordState(
      password: password,
      passwordVerified: passwordVerified,
      showErrorMessages: showErrorMessages,
      settingsFailureOrSuccessOption: settingsFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $ChangepasswordState = _$ChangepasswordStateTearOff();

/// @nodoc
mixin _$ChangepasswordState {
  Password get password => throw _privateConstructorUsedError;
  bool get passwordVerified => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<Either<SettingsFailure, Settings>>
      get settingsFailureOrSuccessOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChangepasswordStateCopyWith<ChangepasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangepasswordStateCopyWith<$Res> {
  factory $ChangepasswordStateCopyWith(
          ChangepasswordState value, $Res Function(ChangepasswordState) then) =
      _$ChangepasswordStateCopyWithImpl<$Res>;
  $Res call(
      {Password password,
      bool passwordVerified,
      bool showErrorMessages,
      Option<Either<SettingsFailure, Settings>>
          settingsFailureOrSuccessOption});
}

/// @nodoc
class _$ChangepasswordStateCopyWithImpl<$Res>
    implements $ChangepasswordStateCopyWith<$Res> {
  _$ChangepasswordStateCopyWithImpl(this._value, this._then);

  final ChangepasswordState _value;
  // ignore: unused_field
  final $Res Function(ChangepasswordState) _then;

  @override
  $Res call({
    Object? password = freezed,
    Object? passwordVerified = freezed,
    Object? showErrorMessages = freezed,
    Object? settingsFailureOrSuccessOption = freezed,
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
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      settingsFailureOrSuccessOption: settingsFailureOrSuccessOption == freezed
          ? _value.settingsFailureOrSuccessOption
          : settingsFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<SettingsFailure, Settings>>,
    ));
  }
}

/// @nodoc
abstract class _$ChangepasswordStateCopyWith<$Res>
    implements $ChangepasswordStateCopyWith<$Res> {
  factory _$ChangepasswordStateCopyWith(_ChangepasswordState value,
          $Res Function(_ChangepasswordState) then) =
      __$ChangepasswordStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Password password,
      bool passwordVerified,
      bool showErrorMessages,
      Option<Either<SettingsFailure, Settings>>
          settingsFailureOrSuccessOption});
}

/// @nodoc
class __$ChangepasswordStateCopyWithImpl<$Res>
    extends _$ChangepasswordStateCopyWithImpl<$Res>
    implements _$ChangepasswordStateCopyWith<$Res> {
  __$ChangepasswordStateCopyWithImpl(
      _ChangepasswordState _value, $Res Function(_ChangepasswordState) _then)
      : super(_value, (v) => _then(v as _ChangepasswordState));

  @override
  _ChangepasswordState get _value => super._value as _ChangepasswordState;

  @override
  $Res call({
    Object? password = freezed,
    Object? passwordVerified = freezed,
    Object? showErrorMessages = freezed,
    Object? settingsFailureOrSuccessOption = freezed,
  }) {
    return _then(_ChangepasswordState(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      passwordVerified: passwordVerified == freezed
          ? _value.passwordVerified
          : passwordVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      settingsFailureOrSuccessOption: settingsFailureOrSuccessOption == freezed
          ? _value.settingsFailureOrSuccessOption
          : settingsFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<SettingsFailure, Settings>>,
    ));
  }
}

/// @nodoc

class _$_ChangepasswordState implements _ChangepasswordState {
  const _$_ChangepasswordState(
      {required this.password,
      required this.passwordVerified,
      required this.showErrorMessages,
      required this.settingsFailureOrSuccessOption});

  @override
  final Password password;
  @override
  final bool passwordVerified;
  @override
  final bool showErrorMessages;
  @override
  final Option<Either<SettingsFailure, Settings>>
      settingsFailureOrSuccessOption;

  @override
  String toString() {
    return 'ChangepasswordState(password: $password, passwordVerified: $passwordVerified, showErrorMessages: $showErrorMessages, settingsFailureOrSuccessOption: $settingsFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChangepasswordState &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.passwordVerified, passwordVerified) ||
                const DeepCollectionEquality()
                    .equals(other.passwordVerified, passwordVerified)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.settingsFailureOrSuccessOption,
                    settingsFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.settingsFailureOrSuccessOption,
                    settingsFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(passwordVerified) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(settingsFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  _$ChangepasswordStateCopyWith<_ChangepasswordState> get copyWith =>
      __$ChangepasswordStateCopyWithImpl<_ChangepasswordState>(
          this, _$identity);
}

abstract class _ChangepasswordState implements ChangepasswordState {
  const factory _ChangepasswordState(
      {required Password password,
      required bool passwordVerified,
      required bool showErrorMessages,
      required Option<Either<SettingsFailure, Settings>>
          settingsFailureOrSuccessOption}) = _$_ChangepasswordState;

  @override
  Password get password => throw _privateConstructorUsedError;
  @override
  bool get passwordVerified => throw _privateConstructorUsedError;
  @override
  bool get showErrorMessages => throw _privateConstructorUsedError;
  @override
  Option<Either<SettingsFailure, Settings>>
      get settingsFailureOrSuccessOption => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChangepasswordStateCopyWith<_ChangepasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
