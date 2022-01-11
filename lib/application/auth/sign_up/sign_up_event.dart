part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.signUp() = SignUp;
  const factory SignUpEvent.changeEmail(String emailStr) = ChangeEmail;

  const factory SignUpEvent.changeCategories(List<String> categories) =
      ChangeCategories;
  const factory SignUpEvent.termAndCondition() = TermAndCondition;
}
