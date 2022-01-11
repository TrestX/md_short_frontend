import 'package:MD_Shorts/domain/auth/auth_failure.dart';
import 'package:MD_Shorts/domain/auth/user.dart';
import 'package:MD_Shorts/domain/auth/value_objects.dart';
import 'package:MD_Shorts/domain/otp/i_otp_repository.dart';
import 'package:MD_Shorts/domain/otp/otp.dart';
import 'package:MD_Shorts/domain/otp/otp_failure.dart';
import 'package:MD_Shorts/shared_preferences/profile_shared_preference.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'otpreq_event.dart';
part 'otpreq_state.dart';
part 'otpreq_bloc.freezed.dart';

@injectable
class OtpreqBloc extends Bloc<OtpreqEvent, OtpreqState> {
  final IOtpRepository _otpRepository;
  OtpreqBloc(this._otpRepository) : super(OtpreqState.initial());
  @override
  Stream<OtpreqState> mapEventToState(
    OtpreqEvent event,
  ) async* {
    yield* event.map(
      changePpassword: (_ChangePpassword value) async* {
        yield state.copyWith(
          password: Password(value.passwordStr),
        );
      },
      passwordVerified: (value) async* {
        yield state.copyWith(
          passwordVerified: value.passwrdVer,
          otpFailureOrSuccessOption: none(),
        );
      },
      verifyOtp: (_VerifyOtp e) async* {
        final email = await ProfileNotifier().getEmail();
        final failureOrSuccess = await _otpRepository.verifyOTP(email, e.otp);
        yield state.copyWith(
            otpFailureOrSuccessOption: optionOf(failureOrSuccess));
      },
      passwordResetOtp: (_PasswordResetOtp e) async* {
        await ProfileNotifier().setEmail(e.email);
        final failureOrSuccess = await _otpRepository.passwordResetOTP(e.email);
        yield state.copyWith(
            otpFailureOrSuccessOption: optionOf(failureOrSuccess));
      },
      resendOtp: (_ResendOtp e) async* {
        final failureOrSuccess = await _otpRepository.resendOTP(e.email,"");
        yield state.copyWith(
            otpFailureOrSuccessOption: optionOf(failureOrSuccess));
      },
      verifyPassOtp: (_VerifyPassOtp e) async* {
        if (state.passwordVerified) {
          final email = await ProfileNotifier().getEmail();
          final failureOrSuccess =
              await _otpRepository.verifyPassOTP(email, state.password.getOrCrash(), state.otp);
          yield state.copyWith(
              otpFailureOrSuccessOption: optionOf(failureOrSuccess));
        } else {
          yield state.copyWith(
            showErrorMessages: true,
          );
        }
      },
      verifyEmailOtp: (_VerifyEmailOtp e) async* {
          final failureOrSuccess =
              await _otpRepository.verifyEmailOTP(e.email, e.otp);
          yield state.copyWith(
              emailotpFailureOrSuccessOption: optionOf(failureOrSuccess));
      },
      changeOtp: (_ChangeOtp value) async* {
        yield state.copyWith(
          otp: value.otp,
        );
      },
    );
  }
}
