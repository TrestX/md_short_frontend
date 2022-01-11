import 'dart:async';

import 'package:MD_Shorts/domain/news/i_news_repository.dart';
import 'package:MD_Shorts/domain/news/news.dart';
import 'package:MD_Shorts/domain/news/news_failure.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'newstrending_event.dart';
part 'newstrending_state.dart';
part 'newstrending_bloc.freezed.dart';
@injectable
class NewstrendingBloc extends Bloc<NewstrendingEvent, NewstrendingState> {
    final INewsRepository _newsRepository;
      NewstrendingBloc(this._newsRepository)
      : super(const NewstrendingState.initial());
  StreamSubscription<Either<NewsFailure, List<News>>>? _newsStreamSubscription;
  @override
  Stream<NewstrendingState> mapEventToState(
    NewstrendingEvent event,
  ) async* {
    yield* event.map(
      watchAllStarted: (_) async* {
        yield const NewstrendingState.loadInProgress();
        await _newsStreamSubscription?.cancel();
        _newsStreamSubscription = _newsRepository
            .getTopStoriesNews()
            .listen((event) => add(NewstrendingEvent.valueReceived(event)));
      },
      valueReceived: (value) async* {
        yield value.failureOrValue.fold(
          (f) => NewstrendingState.loadFailure(f),
          (value) => NewstrendingState.loadSuccess(value),
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
