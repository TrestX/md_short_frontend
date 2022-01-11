
import 'package:freezed_annotation/freezed_annotation.dart';

part 'see_fewer.freezed.dart';
@freezed
abstract class SeeFewer with _$SeeFewer{
  // Added constructor
  const factory SeeFewer({
    required String message,
  }) = _SeeFewer;
}