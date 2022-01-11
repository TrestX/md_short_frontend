import 'package:MD_Shorts/domain/seefewerstories/see_fewer.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'see_fewer_dtos.freezed.dart';
part 'see_fewer_dtos.g.dart';

@freezed
abstract class SeeFewerDto implements _$SeeFewerDto {
  const SeeFewerDto._();

  // ignore: sort_unnamed_constructors_first
  const factory SeeFewerDto({
    required String message,
  }) = _SeeFewerDto;

  SeeFewer toDomain() {
    return SeeFewer(
          message: message,
        );
  }
  factory SeeFewerDto.fromJson(Map<String, dynamic> json) =>
      _$SeeFewerDtoFromJson(json);
}