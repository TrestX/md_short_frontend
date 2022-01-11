
import 'package:MD_Shorts/apis/otp_api.dart';
import 'package:MD_Shorts/domain/auth/auth_failure.dart';
import 'package:MD_Shorts/domain/auth/user.dart';
import 'package:MD_Shorts/domain/otp/i_otp_repository.dart';
import 'package:MD_Shorts/domain/otp/otp.dart';
import 'package:MD_Shorts/domain/otp/otp_failure.dart';
import 'package:MD_Shorts/domain/share/i_share_repository.dart';
import 'package:MD_Shorts/shared_preferences/profile_shared_preference.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IOtpRepository)
class OtpRepository implements IOtpRepository {
  final OTPApiClient _otpApi;
  OtpRepository (this._otpApi);

  @override
  Future<Either<OtpFailure, Otp>> verifyOTP(String email, String otp) async {
    final result = await _otpApi.verifyOTP(email, otp);
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (message) {
        return Right(message);
      },
    );
  }

  @override
  Future<Either<OtpFailure, Otp>> resendOTP(String email, String otp) async {
    print(email);
    
    final result = await _otpApi.resendOTP(email, otp);
    print(result);
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (message) {
        return Right(message);
      },
    );
  }

  @override
  Future<Either<OtpFailure, Otp>> passwordResetOTP(String email) async {
    final result = await _otpApi.getPasswordResetOTP(email);
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (message) {
        return Right(message);
      },
    );
  }

  @override
  Future<Either<OtpFailure, Otp>> verifyPassOTP(String email,String password, String otp) async {
    final result = await _otpApi.verifyPassOTP(email,password,otp);
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (message) {
        return Right(message);
      },
    );
  }
  @override
  Future<Either<AuthFailure, Unit>> verifyEmailOTP(String email, String otp) async {
    final result = await _otpApi.verifyEmailOTP(email,otp);
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (userData) {
          ProfileNotifier().setProfile(
          userData.id.getOrCrash(),
          userData.email.getOrCrash(),
          userData.firstName,
          userData.lastName,
          userData.phoneNumber,
          userData.countryCode,
          userData.urlToProfileImage,
          userData.designation,
          userData.categories.getOrCrash(),
          userData.speciality,

        );
        return Right(unit);
      },
    );
  }
}
