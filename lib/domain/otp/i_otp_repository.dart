import 'package:MD_Shorts/domain/auth/auth_failure.dart';
import 'package:MD_Shorts/domain/auth/user.dart';
import 'package:dartz/dartz.dart';
import 'otp.dart';
import 'otp_failure.dart';

abstract class IOtpRepository {
  Future<Either<OtpFailure,Otp>> verifyOTP(String email, String otp);
  Future<Either<OtpFailure,Otp>> resendOTP(String email, String otp);
    Future<Either<OtpFailure,Otp>> passwordResetOTP(String email);
    Future<Either<OtpFailure,Otp>> verifyPassOTP(String email,String password, String otp);
    Future<Either<AuthFailure, Unit>> verifyEmailOTP(String email, String otp);
}
