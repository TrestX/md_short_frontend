import 'dart:async';

import 'package:MD_Shorts/domain/news/i_news_repository.dart';
import 'package:MD_Shorts/domain/news/news.dart';
import 'package:MD_Shorts/domain/news/news_failure.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'newstopstories_event.dart';
part 'newstopstories_state.dart';
part 'newstopstories_bloc.freezed.dart';

@injectable
class NewstopstoriesBloc extends Bloc<NewstopstoriesEvent, NewstopstoriesState> {
  final INewsRepository _newsRepository;

  NewstopstoriesBloc(this._newsRepository)
      : super(const NewstopstoriesState.initial());
  StreamSubscription<Either<NewsFailure, List<News>>>? _newsStreamSubscription;
  @override
  Stream<NewstopstoriesState> mapEventToState(
    NewstopstoriesEvent event,
  ) async* {
    yield* event.map(
      watchAllStarted: (_) async* {
        yield const NewstopstoriesState.loadInProgress();
        await _newsStreamSubscription?.cancel();
        _newsStreamSubscription = _newsRepository
            .getTopStoriesNews()
            .listen((event) => add(NewstopstoriesEvent.valueReceived(event)));
      },
      valueReceived: (value) async* {
        yield value.failureOrValue.fold(
          (f) => NewstopstoriesState.loadFailure(f),
          (value) => NewstopstoriesState.loadSuccess(value),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _newsStreamSubscription?.cancel();
    return super.close();
  }
}
