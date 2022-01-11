part of 'socialmedialogin_bloc.dart';

@freezed
class SocialmedialoginState with _$SocialmedialoginState {
  const factory SocialmedialoginState({
    required Email email,
    required Categories categories,
    required String fname,
    required String lname,
    required String phoneNumber,
    required String imageurl,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SocialmedialoginState;

  factory SocialmedialoginState.initial() => SocialmedialoginState(
        email: Email(''),
        categories: Categories(const []),
        showErrorMessages: false,
        fname: '',
        lname:'',
        phoneNumber:'',
        imageurl:'',
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}