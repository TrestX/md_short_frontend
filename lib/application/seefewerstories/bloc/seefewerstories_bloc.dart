import 'package:MD_Shorts/domain/seefewerstories/i_see_fewer_repository.dart';
import 'package:MD_Shorts/domain/seefewerstories/see_fewer.dart';
import 'package:MD_Shorts/domain/seefewerstories/see_fewer_failure.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'seefewerstories_event.dart';
part 'seefewerstories_state.dart';
part 'seefewerstories_bloc.freezed.dart';

@injectable
class SeefewerstoriesBloc extends Bloc<SeefewerstoriesEvent, SeefewerstoriesState> {
  final ISeeFewerRepository _seeFewerRepository;
  SeefewerstoriesBloc(this._seeFewerRepository)
      : super(SeefewerstoriesState.initial());
  @override
  Stream<SeefewerstoriesState> mapEventToState(
    SeefewerstoriesEvent event,
  ) async* {
    yield* event.map(
      addtoseefewer: (_AddToSeeFewer value) async* {
                final failureOrSuccess =
            await _seeFewerRepository.addSeeFewer(value.sourceName);

        yield state.copyWith(
            seeFewerFailureOrSuccessOption: optionOf(failureOrSuccess));
      },
    );
  }
}
