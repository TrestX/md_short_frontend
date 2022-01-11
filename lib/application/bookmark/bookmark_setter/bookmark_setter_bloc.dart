import 'package:MD_Shorts/domain/bookmark/bookmark.dart';
import 'package:MD_Shorts/domain/bookmark/bookmark_failure.dart';
import 'package:MD_Shorts/domain/bookmark/i_bookmark_repository.dart';
import 'package:MD_Shorts/shared_preferences/profile_shared_preference.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'bookmark_setter_event.dart';
part 'bookmark_setter_state.dart';
part 'bookmark_setter_bloc.freezed.dart';

@injectable
class BookmarkSetterBloc
    extends Bloc<BookmarkSetterEvent, BookmarkSetterState> {
  final IBookmarkRepository _bookmarkRepository;
  BookmarkSetterBloc(this._bookmarkRepository)
      : super(BookmarkSetterState.initial());
  @override
  Stream<BookmarkSetterState> mapEventToState(
    BookmarkSetterEvent event,
  ) async* {
    yield* event.map(
      addBookmarks: (_AddBookmark value) async* {
        var id = await ProfileNotifier().getBookmarks();
        if (id.contains(value.bookmarks)) {
          id.remove(value.bookmarks);
          yield state.copyWith(
            ids: id,
          );
        } else {
          id.add(value.bookmarks);
          yield state.copyWith(
            ids: id,
          );
        }
      },
      removeBookmark: (_RemoveBookmark e) async* {
        final failureOrSuccess =
            await _bookmarkRepository.updateBookmark(e.bmid);

        yield state.copyWith(
            bookmarkedFailureOrSuccessOption: optionOf(failureOrSuccess));
      },
      setBookmark: (_SetBookmark e) async* {
        final failureOrSuccess =
            await _bookmarkRepository.addBookmark(e.newsid);

        yield state.copyWith(
            bookmarkedFailureOrSuccessOption: optionOf(failureOrSuccess));
      },
    );
  }
}
