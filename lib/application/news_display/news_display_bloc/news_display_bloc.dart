import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'news_display_event.dart';
part 'news_display_state.dart';
part 'news_display_bloc.freezed.dart';

@injectable
class NewsDisplayBloc extends Bloc<NewsDisplayEvent, NewsDisplayState> {
  NewsDisplayBloc() : super(NewsDisplayState.initial());
  @override
  Stream<NewsDisplayState> mapEventToState(
    NewsDisplayEvent event,
  ) async* {
    yield* event.map(changePage: (_ChangePage value) async* {
      yield state.copyWith(
        page: value.pageNum,
      );
    }, changeShowBottomBar: (_ChangeShowBottomBar value) async* {
      yield state.copyWith(
        showBottomBar: !state.showBottomBar,
      );
    },
    changesourceName: (_ChangeSourceName value) async* {
      yield state.copyWith(
        sourceName: value.source,
      );
    },
        changeurl: (_ChangeUrl value) async* {
      yield state.copyWith(
        url: value.url,
      );
    }
    );
  }
}
