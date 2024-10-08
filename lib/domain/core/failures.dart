import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.shortLength({
    required T failedValue,
    required int min,
  }) = ShortLength<T>;
  const factory ValueFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = ExceedingLength<T>;
  const factory ValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;
  const factory ValueFailure.multiline({
    required T failedValue,
  }) = Multiline<T>;
  const factory ValueFailure.dontContainLower({
    required T failedValue,
  }) = DontContainLower<T>;
  const factory ValueFailure.dontContainUpper({
    required T failedValue,
  }) = DontContainUpper<T>;
  const factory ValueFailure.dontContainDigit({
    required T failedValue,
  }) = DontContainDigit<T>;
  const factory ValueFailure.numberTooLarge({
    required T failedValue,
    required num max,
  }) = NumberTooLarge<T>;
  const factory ValueFailure.listTooLong({
    required T failedValue,
    required int max,
  }) = ListTooLong<T>;
  const factory ValueFailure.invalidUserName({
    required T failedValue,
  }) = InvalidUserName<T>;
  const factory ValueFailure.shortPassword({
    required T failedValue,
  }) = ShortPassword<T>;
  const factory ValueFailure.invaliAvatarUrl({
    required T failedValue,
  }) = InvalidAvatarUrl<T>;
}
