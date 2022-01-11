import 'dart:async';

import 'package:MD_Shorts/domain/news/i_news_repository.dart';
import 'package:MD_Shorts/domain/news/news.dart';
import 'package:MD_Shorts/domain/news/news_failure.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'allnews_event.dart';
part 'allnews_state.dart';
part 'allnews_bloc.freezed.dart';

@injectable
class AllnewsBloc extends Bloc<AllnewsEvent, AllnewsState> {
    final INewsRepository _newsRepository;
      AllnewsBloc(this._newsRepository)
      : super(const AllnewsState.initial());
  StreamSubscription<Either<NewsFailure, List<News>>>? _newsStreamSubscription;
  @override
  Stream<AllnewsState> mapEventToState(
    AllnewsEvent event,
  ) async* {
    yield* event.map(
      watchAllStarted: (_) async* {
        yield const AllnewsState.loadInProgress();
        await _newsStreamSubscription?.cancel();
        _newsStreamSubscription = _newsRepository
            .getAlllNews()
            .listen((event) => add(AllnewsEvent.valueReceived(event)));
      },
      valueReceived: (value) async* {
        yield value.failureOrValue.fold(
          (f) => AllnewsState.loadFailure(f),
          (value) => AllnewsState.loadSuccess(value),
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