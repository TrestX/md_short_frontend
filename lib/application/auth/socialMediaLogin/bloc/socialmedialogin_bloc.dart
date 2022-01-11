import 'package:MD_Shorts/domain/auth/auth_failure.dart';
import 'package:MD_Shorts/domain/auth/i_auth_facade.dart';
import 'package:MD_Shorts/domain/auth/value_objects.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'socialmedialogin_event.dart';
part 'socialmedialogin_state.dart';
part 'socialmedialogin_bloc.freezed.dart';

@injectable
class SocialmedialoginBloc
    extends Bloc<SocialmedialoginEvent, SocialmedialoginState> {
  final IAuthFacade _authFacade;

  SocialmedialoginBloc(this._authFacade)
      : super(SocialmedialoginState.initial());

  @override
  Stream<SocialmedialoginState> mapEventToState(
    SocialmedialoginEvent event,
  ) async* {
    yield* event.map(
      socialSignUp: (_SocialSignUp value) async* {
        yield* doLogin(
          _authFacade.socialMediaLogin,
          Email(value.email),
          Categories(value.categories),
          value.fname,
          value.lname,
          value.phoneNumber,
          value.imageurl,
          value.token,
          value.type,
        );
      },
    );
  }

  Stream<SocialmedialoginState> doLogin(
    Future<Either<AuthFailure, Unit>> Function({
      required Email email,
      required Categories categories,
      required String fname,
      required String lname,
      required String phoneNumber,
      required String imageurl,
      required String token,
      required String type,
    })
        forwardedCall,
    Email email,
    Categories categories,
    String fname,
    String lname,
    String phoneNumber,
    String imageurl,
    String token,
    String type,
  ) async* {
    final isEmailValid = email.isValid();
    if (isEmailValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );

      final failureOrSuccess = await forwardedCall(
        email: email,
        categories: categories,
        fname: fname,
        lname: lname,
        phoneNumber: phoneNumber,
        imageurl: imageurl,
        token: token,
        type: type,
      );

      yield state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      );
    }
    if (isEmailValid) {
      yield state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption:
            optionOf(left(const AuthFailure.invalidCredentails())),
      );
    }
    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
    );
  }
}
