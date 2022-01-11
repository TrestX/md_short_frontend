part of 'socialmedialogin_bloc.dart';

@freezed
class SocialmedialoginEvent with _$SocialmedialoginEvent {
  const factory SocialmedialoginEvent.socialSignUp(
      String email,
      String fname,
      String lname,
      String phoneNumber,
      String token,
      String type,
      String imageurl,
      List<String> categories) = _SocialSignUp;
}
