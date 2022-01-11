import 'package:MD_Shorts/domain/auth/auth_failure.dart';
import 'package:MD_Shorts/domain/auth/i_auth_facade.dart';
import 'package:MD_Shorts/domain/auth/user.dart';
import 'package:MD_Shorts/apis/auth_api.dart';
import 'package:MD_Shorts/domain/core/value_objects.dart';
import 'package:MD_Shorts/shared_preferences/profile_shared_preference.dart';
import 'package:dartz/dartz.dart';
import 'package:MD_Shorts/domain/auth/value_objects.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthFacade)
class AuthFaccade implements IAuthFacade {
  final AuthApiClient _authApi;
  AuthFaccade(this._authApi);

  @override
  Future<Option<User>> getSignedInUser() async {
    var profN = ProfileNotifier();
    var userID = UniqueId(profN.getUserId());
    var email = await profN.getEmail();
    if (email == "") {
      ProfileNotifier().setProfile(
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        [],
        [],
      );
      return optionOf(null);
    }
    return optionOf(User(
      id: userID,
      email: Email(email),
      firstName: await profN.getFirstName(),
      lastName: await profN.getLastName(),
      speciality: await profN.getSpecialities(),
      phoneNumber: await profN.getPhoneNumber(),
      countryCode: await profN.getCountry(),
      categories: Categories(await profN.getCategories()),
      urlToProfileImage: await profN.getAvatarUrl(),
      designation: await profN.getDesignation(),
    ));
  }

  @override
  Future<void> signOut() {
    // ignore: todo
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, Unit>> signIn(
      {required Email email, required bool remembeMe}) async {
    final result = await _authApi.signIn(
      email.getOrCrash(),
    );
    return result.fold(
      (failure) {
        ProfileNotifier().setProfile(
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          [],
          "",
        );
        return Left(failure);
      },
      (userData) {
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<AuthFailure, Unit>> signUp({
    required Email email,
    required Categories categories,
    required bool termAndCondition,
  }) async {
    final result = await _authApi.signUp(
      email.getOrCrash(),
      categories.getOrCrash(),
      termAndCondition,
    );
    return result.fold(
      (failure) {
        ProfileNotifier().setProfile(
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          [],
          [],
        );
        return Left(failure);
      },
      (userData) {
        ProfileNotifier().setProfile(
          "none",
          email.getOrCrash(),
          '',
          '',
          '',
          '',
          '',
          '',
          categories.getOrCrash(),
          [],
        );
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<AuthFailure, Unit>> socialMediaLogin({
    required Email email,
    required Categories categories,
    required String fname,
    required String lname,
    required String phoneNumber,
    required String imageurl,
    required String token,
    required String type,
  }) async {
    final result = await _authApi.socialMediaSignIn(
        email.getOrCrash(),
        fname,
        lname,
        imageurl,
        phoneNumber,
        token,
        type,
        categories.isValid() ? categories.getOrCrash() : []);
    return result.fold(
      (failure) {
        ProfileNotifier().setProfile(
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          [],
          [],
        );
        return Left(failure);
      },
      (userData) {
        ProfileNotifier().setProfile(
          userData.id.getOrCrash(),
          email.getOrCrash(),
          fname,
          lname,
          phoneNumber,
          '',
          imageurl,
          '',
          categories.isValid() ? categories.getOrCrash() : [],
          [],
        );
        return const Right(unit);
      },
    );
  }
}
