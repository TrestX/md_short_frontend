import 'package:dartz/dartz.dart';
import './auth_failure.dart';
import './value_objects.dart';
import 'user.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> signIn({
    required Email email,
    required bool remembeMe,
  });
  Future<Either<AuthFailure, Unit>> signUp({
    required Email email,
    required Categories categories,
    required bool termAndCondition,
  });
  Future<void> signOut();
  Future<Either<AuthFailure, Unit>> socialMediaLogin({
    required Email email,
    required Categories categories,
    required String fname,
    required String lname,
    required String phoneNumber,
    required String imageurl,
    required String token,
    required String type,
  });
}
