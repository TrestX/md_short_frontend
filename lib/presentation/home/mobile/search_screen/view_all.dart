import 'package:MD_Shorts/application/news/news_all/bloc/allnews_bloc.dart';
import 'package:MD_Shorts/application/news/news_search/bloc/news_search_bloc.dart';
import 'package:MD_Shorts/application/news/news_search_form/bloc/newssearchform_bloc.dart';
import 'package:MD_Shorts/application/news/news_top_stories/bloc/newstopstories_bloc.dart';
import 'package:MD_Shorts/application/news/news_trending/bloc/newstrending_bloc.dart';
import 'package:MD_Shorts/application/news/news_watcher/news_watcher_dart_bloc.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/search_list.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/search_list_skeleton.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewAll extends StatelessWidget {
  String titleS;
  ViewAll({Key? key, required this.titleS}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          appBar: AppBar(
            title: Text(titleS),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Color(0xFF015397),
              ),
              onPressed: () {
                if (kIsWeb) {
                  context.router.navigate(HomePageRoute());
                } else {
                  context.router.navigate(CustomBottomNavigationBarRoute());
                }
              },
            ),
          ),
          body: Dismissible(
            direction: DismissDirection.endToStart,
            resizeDuration: null,
            key: const ValueKey(0),
            onDismissed: (dismissDirection) {
              if (dismissDirection == DismissDirection.endToStart) {
                context.router.popAndPush(HomePageRoute());
              } else {
                return;
              }
            },
            child: BlocBuilder<NewssearchformBloc, NewssearchformState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.964,
                            height: 38,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                isDense: true, // Added this
                                contentPadding: EdgeInsets.all(2),
                                prefixIcon: Icon(Icons.search),
                                hintText: "Search for news",
                              ),
                              onChanged: (value) {
                                context.read<NewssearchformBloc>().add(
                                    NewssearchformEvent.changeSearch(value));
                              },
                              onTap: () {
                                context.router.popAndPush(
                                    CustomBottomNavigationBarRoute(
                                        index: 1, search: state.search));
                              },
                              onEditingComplete: () {
                                context.router.popAndPush(
                                    CustomBottomNavigationBarRoute(
                                        index: 1, search: state.search));
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            const SizedBox(height: 10),
                            CommonHomeLists(
                              title: titleS,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CommonHomeLists extends StatelessWidget {
  final String title;
  const CommonHomeLists({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: const [
              SizedBox(
                width: 2,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SizedBox(
                child: title == "All News"
                ? BlocBuilder<AllnewsBloc, AllnewsState>(
                    builder: commonBuilder,
                  )
                : title == "My Feed"
                    ? BlocBuilder<NewsWatcherDartBloc, NewsWatcherDartState>(
                        builder: commonBuilder,
                      )
                    : title == "Trending"
                        ? BlocBuilder<NewstrendingBloc, NewstrendingState>(
                            builder: commonBuilder,
                          )
                        : BlocBuilder<NewstopstoriesBloc, NewstopstoriesState>(
                            builder: commonBuilder,
                          )
                              
                              ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget commonBuilder(context, state) {
    return state.map(
      initial: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.83,
              child: SearchListSkeleton())
        ],
      ),
      loadInProgress: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.83,
              child: SearchListSkeleton())
        ],
      ),
      loadSuccess: (newsData) =>
          SearchList(news: newsData.news, searched: true),
      loadFailure: (_) => Container(),
    );
  }
}
