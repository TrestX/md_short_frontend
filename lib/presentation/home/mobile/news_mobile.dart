import 'package:MD_Shorts/application/news/news_form/news_form_bloc.dart';
import 'package:MD_Shorts/application/news/news_watcher/news_watcher_dart_bloc.dart';
import 'package:MD_Shorts/application/news_display/news_display_bloc/news_display_bloc.dart';
import 'package:MD_Shorts/application/updatenews/bloc/updatenews_bloc.dart';
import 'package:MD_Shorts/injection.dart';
import 'package:MD_Shorts/presentation/home/mobile/widget/news_list.dart';
import 'package:MD_Shorts/presentation/home/mobile/widget/news_list_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NewsMobile extends StatelessWidget {
  final String newID;
  const NewsMobile({Key? key, this.newID = ""}) : super(key: key);
  Future<bool> onWillPop() {
    SystemNavigator.pop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: onWillPop,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NewsWatcherDartBloc>(
            create: (context) => getIt<NewsWatcherDartBloc>()
              ..add(
                NewsWatcherDartEvent.watchAllStarted(newID),
              ),
          ),
          BlocProvider<NewsFormBloc>(
            create: (context) => getIt<NewsFormBloc>()
              ..add(
                const NewsFormEvent.initialized(),
              ),
          ),
          BlocProvider<NewsDisplayBloc>(
            create: (context) => getIt<NewsDisplayBloc>()
          ),
          BlocProvider<UpdatenewsBloc>(
              create: (context) => getIt<UpdatenewsBloc>()),
        ],
        child: BlocBuilder<NewsWatcherDartBloc, NewsWatcherDartState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.end,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.95,
                      child: NewsListSkeleton()),
                ],
              ),
              loadInProgress: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.end,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.95,
                      child: NewsListSkeleton()),
                ],
              ),
              loadSuccess: (productValue) => Scaffold(
                body: NewsList(news: productValue.news),
              ),
              loadFailure: (_) => Container(),
            );
          },
        ),
      ),
    );
  }
}
