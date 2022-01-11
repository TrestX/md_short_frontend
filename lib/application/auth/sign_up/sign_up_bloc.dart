import 'package:MD_Shorts/domain/auth/auth_failure.dart';
import 'package:MD_Shorts/domain/auth/i_auth_facade.dart';
import 'package:MD_Shorts/domain/auth/value_objects.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final IAuthFacade _authFacade;

  SignUpBloc(this._authFacade) : super(SignUpState.initial());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    yield* event.map(
      signUp: (SignUp value) async* {
        yield* doLogin(
          _authFacade.signUp,
        );
      },
      changeCategories: (ChangeCategories value) async* {
        yield state.copyWith(
          categories: Categories(value.categories),
          authFailureOrSuccessOption: none(),
        );
      },
      changeEmail: (ChangeEmail value) async* {
        yield state.copyWith(
          email: Email(value.emailStr),
          authFailureOrSuccessOption: none(),
        );
      },
      termAndCondition: (TermAndCondition value) async* {
        yield state.copyWith(
          termAndCondition: !state.termAndCondition,
          authFailureOrSuccessOption: none(),
        );
      },
    );
  }

  Stream<SignUpState> doLogin(
    Future<Either<AuthFailure, Unit>> Function({
      required Email email,
      required Categories categories,
      required bool termAndCondition,
    })
        forwardedCall,
  ) async* {
    final isEmailValid = state.email.isValid();
    final iscategoriesValid = state.categories.isValid();
    if (isEmailValid && iscategoriesValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );

      final failureOrSuccess = await forwardedCall(
        email: state.email,
        categories: state.categories,
        termAndCondition: state.termAndCondition,
      );

      yield state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      );
    }
    if (isEmailValid && iscategoriesValid &&
        !state.termAndCondition) {
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
