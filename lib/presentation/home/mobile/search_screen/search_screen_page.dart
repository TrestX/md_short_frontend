import 'package:MD_Shorts/application/bookmark/bloc/bookmark_bloc.dart';
import 'package:MD_Shorts/application/bookmark/bookmark_setter/bookmark_setter_bloc.dart';
import 'package:MD_Shorts/application/category/search_category_bloc/bloc/searchcategory_bloc.dart';
import 'package:MD_Shorts/application/news/news_all/bloc/allnews_bloc.dart';
import 'package:MD_Shorts/application/news/news_search/bloc/news_search_bloc.dart';
import 'package:MD_Shorts/application/news/news_search_form/bloc/newssearchform_bloc.dart';
import 'package:MD_Shorts/application/news/news_top_stories/bloc/newstopstories_bloc.dart';
import 'package:MD_Shorts/application/news/news_trending/bloc/newstrending_bloc.dart';
import 'package:MD_Shorts/application/news/news_watcher/news_watcher_dart_bloc.dart';
import 'package:MD_Shorts/application/share/bloc/share_bloc.dart';
import 'package:MD_Shorts/injection.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/search_screen.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
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
          BlocProvider<NewstopstoriesBloc>(
            create: (context) => getIt<NewstopstoriesBloc>()
              ..add(
                const NewstopstoriesEvent.watchAllStarted(),
              ),
          ),
          BlocProvider(
            create: (context) => getIt<AllnewsBloc>()
              ..add(const AllnewsEvent.watchAllStarted()),
          ),
          BlocProvider<NewstrendingBloc>(
            create: (context) => getIt<NewstrendingBloc>()
              ..add(
                const NewstrendingEvent.watchAllStarted(),
              ),
          ),
          BlocProvider<NewssearchformBloc>(
            create: (context) => getIt<NewssearchformBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<SearchcategoryBloc>()
              ..add(const SearchcategoryEvent.started("")),
          ),
          BlocProvider<ShareBloc>(
            create: (context) => getIt<ShareBloc>(),
          ),
          BlocProvider<BookmarkSetterBloc>(
            create: (context) => getIt<BookmarkSetterBloc>(),
          ),
          BlocProvider<BookmarkBloc>(
            create: (context) =>
                getIt<BookmarkBloc>()..add(const BookmarkEvent.getBookmarks()),
          ),
        ],
        child: BlocConsumer<BookmarkSetterBloc, BookmarkSetterState>(
          listener: (context, state) {
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
            return const SearchScreen();
          },
        ),
      ),
    );
  }
}
