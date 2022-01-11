// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'searchcategory_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchcategoryEventTearOff {
  const _$SearchcategoryEventTearOff();

  _Started started(String? ids) {
    return _Started(
      ids,
    );
  }

  _ValueReceived valueReceived(
      Either<CategoryFailure, List<UserCategory>> failureOrValue) {
    return _ValueReceived(
      failureOrValue,
    );
  }
}

/// @nodoc
const $SearchcategoryEvent = _$SearchcategoryEventTearOff();

/// @nodoc
mixin _$SearchcategoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? ids) started,
    required TResult Function(
            Either<CategoryFailure, List<UserCategory>> failureOrValue)
        valueReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? ids)? started,
    TResult Function(
            Either<CategoryFailure, List<UserCategory>> failureOrValue)?
        valueReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? ids)? started,
    TResult Function(
            Either<CategoryFailure, List<UserCategory>> failureOrValue)?
        valueReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ValueReceived value) valueReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ValueReceived value)? valueReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ValueReceived value)? valueReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchcategoryEventCopyWith<$Res> {
  factory $SearchcategoryEventCopyWith(
          SearchcategoryEvent value, $Res Function(SearchcategoryEvent) then) =
      _$SearchcategoryEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchcategoryEventCopyWithImpl<$Res>
    implements $SearchcategoryEventCopyWith<$Res> {
  _$SearchcategoryEventCopyWithImpl(this._value, this._then);

  final SearchcategoryEvent _value;
  // ignore: unused_field
  final $Res Function(SearchcategoryEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
  $Res call({String? ids});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res>
    extends _$SearchcategoryEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;

  @override
  $Res call({
    Object? ids = freezed,
  }) {
    return _then(_Started(
      ids == freezed
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started(this.ids);

  @override
  final String? ids;

  @override
  String toString() {
    return 'SearchcategoryEvent.started(ids: $ids)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Started &&
            (identical(other.ids, ids) ||
                const DeepCollectionEquality().equals(other.ids, ids)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(ids);

  @JsonKey(ignore: true)
  @override
  _$StartedCopyWith<_Started> get copyWith =>
      __$StartedCopyWithImpl<_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? ids) started,
    required TResult Function(
            Either<CategoryFailure, List<UserCategory>> failureOrValue)
        valueReceived,
  }) {
    return started(ids);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? ids)? started,
    TResult Function(
            Either<CategoryFailure, List<UserCategory>> failureOrValue)?
        valueReceived,
  }) {
    return started?.call(ids);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? ids)? started,
    TResult Function(
            Either<CategoryFailure, List<UserCategory>> failureOrValue)?
        valueReceived,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(ids);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ValueReceived value) valueReceived,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ValueReceived value)? valueReceived,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ValueReceived value)? valueReceived,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SearchcategoryEvent {
  const factory _Started(String? ids) = _$_Started;

  String? get ids => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$StartedCopyWith<_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ValueReceivedCopyWith<$Res> {
  factory _$ValueReceivedCopyWith(
          _ValueReceived value, $Res Function(_ValueReceived) then) =
      __$ValueReceivedCopyWithImpl<$Res>;
  $Res call({Either<CategoryFailure, List<UserCategory>> failureOrValue});
}

/// @nodoc
class __$ValueReceivedCopyWithImpl<$Res>
    extends _$SearchcategoryEventCopyWithImpl<$Res>
    implements _$ValueReceivedCopyWith<$Res> {
  __$ValueReceivedCopyWithImpl(
      _ValueReceived _value, $Res Function(_ValueReceived) _then)
      : super(_value, (v) => _then(v as _ValueReceived));

  @override
  _ValueReceived get _value => super._value as _ValueReceived;

  @override
  $Res call({
    Object? failureOrValue = freezed,
  }) {
    return _then(_ValueReceived(
      failureOrValue == freezed
          ? _value.failureOrValue
          : failureOrValue // ignore: cast_nullable_to_non_nullable
              as Either<CategoryFailure, List<UserCategory>>,
    ));
  }
}

/// @nodoc

class _$_ValueReceived implements _ValueReceived {
  const _$_ValueReceived(this.failureOrValue);

  @override
  final Either<CategoryFailure, List<UserCategory>> failureOrValue;

  @override
  String toString() {
    return 'SearchcategoryEvent.valueReceived(failureOrValue: $failureOrValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ValueReceived &&
            (identical(other.failureOrValue, failureOrValue) ||
                const DeepCollectionEquality()
                    .equals(other.failureOrValue, failureOrValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failureOrValue);

  @JsonKey(ignore: true)
  @override
  _$ValueReceivedCopyWith<_ValueReceived> get copyWith =>
      __$ValueReceivedCopyWithImpl<_ValueReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? ids) started,
    required TResult Function(
            Either<CategoryFailure, List<UserCategory>> failureOrValue)
        valueReceived,
  }) {
    return valueReceived(failureOrValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? ids)? started,
    TResult Function(
            Either<CategoryFailure, List<UserCategory>> failureOrValue)?
        valueReceived,
  }) {
    return valueReceived?.call(failureOrValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? ids)? started,
    TResult Function(
            Either<CategoryFailure, List<UserCategory>> failureOrValue)?
        valueReceived,
    required TResult orElse(),
  }) {
    if (valueReceived != null) {
      return valueReceived(failureOrValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ValueReceived value) valueReceived,
  }) {
    return valueReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ValueReceived value)? valueReceived,
  }) {
    return valueReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ValueReceived value)? valueReceived,
    required TResult orElse(),
  }) {
    if (valueReceived != null) {
      return valueReceived(this);
    }
    return orElse();
  }
}

abstract class _ValueReceived implements SearchcategoryEvent {
  const factory _ValueReceived(
          Either<CategoryFailure, List<UserCategory>> failureOrValue) =
      _$_ValueReceived;

  Either<CategoryFailure, List<UserCategory>> get failureOrValue =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ValueReceivedCopyWith<_ValueReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SearchcategoryStateTearOff {
  const _$SearchcategoryStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _LoadInProgress loadInProgress() {
    return const _LoadInProgress();
  }

  _LoadSuccess loadSuccess(List<UserCategory> userCategory) {
    return _LoadSuccess(
      userCategory,
    );
  }

  _LoadFailure loadFailure(CategoryFailure categoryFailure) {
    return _LoadFailure(
      categoryFailure,
    );
  }
}

/// @nodoc
const $SearchcategoryState = _$SearchcategoryStateTearOff();

/// @nodoc
mixin _$SearchcategoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<UserCategory> userCategory) loadSuccess,
    required TResult Function(CategoryFailure categoryFailure) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<UserCategory> userCategory)? loadSuccess,
    TResult Function(CategoryFailure categoryFailure)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<UserCategory> userCategory)? loadSuccess,
    TResult Function(CategoryFailure categoryFailure)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchcategoryStateCopyWith<$Res> {
  factory $SearchcategoryStateCopyWith(
          SearchcategoryState value, $Res Function(SearchcategoryState) then) =
      _$SearchcategoryStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchcategoryStateCopyWithImpl<$Res>
    implements $SearchcategoryStateCopyWith<$Res> {
  _$SearchcategoryStateCopyWithImpl(this._value, this._then);

  final SearchcategoryState _value;
  // ignore: unused_field
  final $Res Function(SearchcategoryState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$SearchcategoryStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SearchcategoryState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<UserCategory> userCategory) loadSuccess,
    required TResult Function(CategoryFailure categoryFailure) loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<UserCategory> userCategory)? loadSuccess,
    TResult Function(CategoryFailure categoryFailure)? loadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<UserCategory> userCategory)? loadSuccess,
    TResult Function(CategoryFailure categoryFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SearchcategoryState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadInProgressCopyWith<$Res> {
  factory _$LoadInProgressCopyWith(
          _LoadInProgress value, $Res Function(_LoadInProgress) then) =
      __$LoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadInProgressCopyWithImpl<$Res>
    extends _$SearchcategoryStateCopyWithImpl<$Res>
    implements _$LoadInProgressCopyWith<$Res> {
  __$LoadInProgressCopyWithImpl(
      _LoadInProgress _value, $Res Function(_LoadInProgress) _then)
      : super(_value, (v) => _then(v as _LoadInProgress));

  @override
  _LoadInProgress get _value => super._value as _LoadInProgress;
}

/// @nodoc

class _$_LoadInProgress implements _LoadInProgress {
  const _$_LoadInProgress();

  @override
  String toString() {
    return 'SearchcategoryState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<UserCategory> userCategory) loadSuccess,
    required TResult Function(CategoryFailure categoryFailure) loadFailure,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<UserCategory> userCategory)? loadSuccess,
    TResult Function(CategoryFailure categoryFailure)? loadFailure,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<UserCategory> userCategory)? loadSuccess,
    TResult Function(CategoryFailure categoryFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements SearchcategoryState {
  const factory _LoadInProgress() = _$_LoadInProgress;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  $Res call({List<UserCategory> userCategory});
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res>
    extends _$SearchcategoryStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object? userCategory = freezed,
  }) {
    return _then(_LoadSuccess(
      userCategory == freezed
          ? _value.userCategory
          : userCategory // ignore: cast_nullable_to_non_nullable
              as List<UserCategory>,
    ));
  }
}

/// @nodoc

class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(this.userCategory);

  @override
  final List<UserCategory> userCategory;

  @override
  String toString() {
    return 'SearchcategoryState.loadSuccess(userCategory: $userCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadSuccess &&
            (identical(other.userCategory, userCategory) ||
                const DeepCollectionEquality()
                    .equals(other.userCategory, userCategory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(userCategory);

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<UserCategory> userCategory) loadSuccess,
    required TResult Function(CategoryFailure categoryFailure) loadFailure,
  }) {
    return loadSuccess(userCategory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<UserCategory> userCategory)? loadSuccess,
    TResult Function(CategoryFailure categoryFailure)? loadFailure,
  }) {
    return loadSuccess?.call(userCategory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<UserCategory> userCategory)? loadSuccess,
    TResult Function(CategoryFailure categoryFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(userCategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements SearchcategoryState {
  const factory _LoadSuccess(List<UserCategory> userCategory) = _$_LoadSuccess;

  List<UserCategory> get userCategory => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadFailureCopyWith<$Res> {
  factory _$LoadFailureCopyWith(
          _LoadFailure value, $Res Function(_LoadFailure) then) =
      __$LoadFailureCopyWithImpl<$Res>;
  $Res call({CategoryFailure categoryFailure});

  $CategoryFailureCopyWith<$Res> get categoryFailure;
}

/// @nodoc
class __$LoadFailureCopyWithImpl<$Res>
    extends _$SearchcategoryStateCopyWithImpl<$Res>
    implements _$LoadFailureCopyWith<$Res> {
  __$LoadFailureCopyWithImpl(
      _LoadFailure _value, $Res Function(_LoadFailure) _then)
      : super(_value, (v) => _then(v as _LoadFailure));

  @override
  _LoadFailure get _value => super._value as _LoadFailure;

  @override
  $Res call({
    Object? categoryFailure = freezed,
  }) {
    return _then(_LoadFailure(
      categoryFailure == freezed
          ? _value.categoryFailure
          : categoryFailure // ignore: cast_nullable_to_non_nullable
              as CategoryFailure,
    ));
  }

  @override
  $CategoryFailureCopyWith<$Res> get categoryFailure {
    return $CategoryFailureCopyWith<$Res>(_value.categoryFailure, (value) {
      return _then(_value.copyWith(categoryFailure: value));
    });
  }
}

/// @nodoc

class _$_LoadFailure implements _LoadFailure {
  const _$_LoadFailure(this.categoryFailure);

  @override
  final CategoryFailure categoryFailure;

  @override
  String toString() {
    return 'SearchcategoryState.loadFailure(categoryFailure: $categoryFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadFailure &&
            (identical(other.categoryFailure, categoryFailure) ||
                const DeepCollectionEquality()
                    .equals(other.categoryFailure, categoryFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(categoryFailure);

  @JsonKey(ignore: true)
  @override
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      __$LoadFailureCopyWithImpl<_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<UserCategory> userCategory) loadSuccess,
    required TResult Function(CategoryFailure categoryFailure) loadFailure,
  }) {
    return loadFailure(categoryFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<UserCategory> userCategory)? loadSuccess,
    TResult Function(CategoryFailure categoryFailure)? loadFailure,
  }) {
    return loadFailure?.call(categoryFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<UserCategory> userCategory)? loadSuccess,
    TResult Function(CategoryFailure categoryFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(categoryFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure implements SearchcategoryState {
  const factory _LoadFailure(CategoryFailure categoryFailure) = _$_LoadFailure;

  CategoryFailure get categoryFailure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadFailureCopyWith<_LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
