import 'package:MD_Shorts/domain/auth/user.dart';
import 'package:MD_Shorts/domain/auth/value_objects.dart';
import 'package:MD_Shorts/domain/core/value_objects.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dtos.freezed.dart';
part 'user_dtos.g.dart';

@freezed
abstract class UserDto implements _$UserDto {
  const UserDto._();

  // ignore: sort_unnamed_constructors_first
  const factory UserDto({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required List<String> speciality,
    required String phoneNumber,
    required String countryCode,
    required List<String> categories,
    required String urlToProfileImage,
    required String designation,
  }) = _UserDto;

  User toDomain() {
    return User(
      id: UniqueId.fromUniqueString(id),
      email: Email(email),
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      countryCode: countryCode,
      categories: Categories(categories),
      speciality: speciality,
      urlToProfileImage: urlToProfileImage.toString(),
      designation: designation,
    );
  }

  factory UserDto.fromDomain(User user) {
    return UserDto(
      id: user.id.getOrCrash(),
      email: user.email.getOrCrash(),
      firstName: user.firstName,
      lastName: user.lastName,
      phoneNumber: user.phoneNumber,
      countryCode: user.countryCode,
      categories: user.categories.getOrCrash(),
      speciality: user.speciality,
      urlToProfileImage: user.urlToProfileImage,
      designation: user.designation,
    );
  }
  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
