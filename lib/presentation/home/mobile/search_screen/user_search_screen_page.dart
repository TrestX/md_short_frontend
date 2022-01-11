import 'package:MD_Shorts/application/bookmark/bloc/bookmark_bloc.dart';
import 'package:MD_Shorts/application/bookmark/bookmark_setter/bookmark_setter_bloc.dart';
import 'package:MD_Shorts/application/news/news_search/bloc/news_search_bloc.dart';
import 'package:MD_Shorts/application/news/news_search_form/bloc/newssearchform_bloc.dart';
import 'package:MD_Shorts/application/news/news_watcher/news_watcher_dart_bloc.dart';
import 'package:MD_Shorts/application/share/bloc/share_bloc.dart';
import 'package:MD_Shorts/injection.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/user_search_page.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSearchPage extends StatelessWidget {
  final String search;
  const UserSearchPage({Key? key, required this.search}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<NewsSearchBloc>(
            create: (context) => getIt<NewsSearchBloc>()
              ..add(
                NewsSearchEvent.watchAllStarted(search),
              ),
          ),
          BlocProvider<NewssearchformBloc>(
            create: (context) => getIt<NewssearchformBloc>(),
          ),
          BlocProvider<ShareBloc>(
            create: (context) => getIt<ShareBloc>(),
          ),
          BlocProvider<BookmarkSetterBloc>(
            create: (context) => getIt<BookmarkSetterBloc>(),
          ),
          BlocProvider(
            create: (context) =>
                getIt<BookmarkBloc>()..add(const BookmarkEvent.getBookmarks()),
          ),
          BlocProvider<NewsWatcherDartBloc>(
            create: (context) => getIt<NewsWatcherDartBloc>()
              ..add(
                const NewsWatcherDartEvent.watchAllGlobalStarted(),
              ),
          ),
          BlocProvider<NewsSearchBloc>(
            create: (context) => getIt<NewsSearchBloc>()
              ..add(
                const NewsSearchEvent.watchAllStarted("guidelines"),
              ),
          ),
        ],
        child: BlocConsumer<BookmarkSetterBloc, BookmarkSetterState>(
          listener: (context, state) async {
            state.bookmarkedFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  FlushbarHelper.createError(
                    message: failure.map(
                      cancelledByUser: (_) => 'Cancelled',
                      serverError: (_) => 'Already Bookmarked',
                    ),
                  ).show(context);
                },
                (_) async {
                  FlushbarHelper.createSuccess(
                          message: "Successfully Bookmarked")
                      .show(context);
                  context
                      .read<BookmarkBloc>()
                      .add(const BookmarkEvent.getBookmarks());
                },
              ),
            );
          },
          builder: (context, state) {
            return UserSearchScreen(search: search);
          },
        ),
      ),
    );
  }
}
