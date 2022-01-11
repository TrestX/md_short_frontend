import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/entity.dart';
import '../core/value_objects.dart';
import 'value_objects.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User implements IEntity {
  // Added constructor
  const factory User({
    required UniqueId id,
    required Email email,
    required String firstName,
    required String lastName,
    required List<String> speciality,
    required String phoneNumber,
    required String countryCode,
    required Categories categories,
    required String urlToProfileImage,
    required String designation,
  }) = _User;
}
