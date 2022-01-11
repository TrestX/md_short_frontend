import 'package:MD_Shorts/domain/auth/value_objects.dart';
import 'package:MD_Shorts/domain/settings/i_settings_respository.dart';
import 'package:MD_Shorts/domain/settings/settings.dart';
import 'package:MD_Shorts/domain/settings/settings_failure.dart';
import 'package:MD_Shorts/shared_preferences/profile_shared_preference.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'changepassword_event.dart';
part 'changepassword_state.dart';
part 'changepassword_bloc.freezed.dart';

@injectable
class ChangepasswordBloc
    extends Bloc<ChangepasswordEvent, ChangepasswordState> {
  final ISettingsRepository _settingsRepository;

  ChangepasswordBloc(this._settingsRepository)
      : super(ChangepasswordState.initial());

  @override
  Stream<ChangepasswordState> mapEventToState(
    ChangepasswordEvent event,
  ) async* {
    yield* event.map(
      changePpassword: (_ChangePpassword value) async* {
        yield state.copyWith(
          password: Password(value.passwordStr),
        );
      },
      changePassword: (_ChangePassword e) async* {
        var email = await ProfileNotifier().getEmail();
        if (state.passwordVerified) {
          final failureOrSuccess = await _settingsRepository.changePassword(
              Email(email), e.password);

          yield state.copyWith(
              settingsFailureOrSuccessOption: optionOf(failureOrSuccess),
              showErrorMessages: true);
        }
      },
      passwordVerified: (value) async* {
        yield state.copyWith(
          passwordVerified: value.passwrdVer,
          settingsFailureOrSuccessOption: none(),
        );
      },
    );
  }
}
