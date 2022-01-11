import 'package:MD_Shorts/application/bookmark/bloc/bookmark_bloc.dart';
import 'package:MD_Shorts/application/news/news_all/bloc/allnews_bloc.dart';
import 'package:MD_Shorts/application/news/news_search/bloc/news_search_bloc.dart';
import 'package:MD_Shorts/application/news/news_search_form/bloc/newssearchform_bloc.dart';
import 'package:MD_Shorts/application/news/news_top_stories/bloc/newstopstories_bloc.dart';
import 'package:MD_Shorts/application/news/news_trending/bloc/newstrending_bloc.dart';
import 'package:MD_Shorts/application/news/news_watcher/news_watcher_dart_bloc.dart';
import 'package:MD_Shorts/presentation/home/mobile/bookmark_screen/bookmark_page.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/search_list.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/search_list_skeleton.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/serach_categories.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/top_stories.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/top_stories_skeleton_view.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Column(
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
                            context
                                .read<NewssearchformBloc>()
                                .add(NewssearchformEvent.changeSearch(value));
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
                  SearchCategories(),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: const [
                        CommonHomeLists(
                          title: "My Feed",
                        ),
                        SizedBox(height: 10),
                        CommonHomeLists(
                          title: "All News",
                        ),
                        SizedBox(height: 10),
                        CommonHomeLists(
                          title: "Top News",
                        ),
                        SizedBox(height: 10),
                        CommonHomeLists(
                          title: "Trending",
                        ),
                        SizedBox(height: 10),
                        CommonHomeLists(
                          title: "Bookmarks",
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
      height: 710,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF015397),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: title == "All News"
                ? BlocBuilder<AllnewsBloc, AllnewsState>(
                    builder: commonBuilder,
                  )
                : title == "My Feed"
                    ? BlocBuilder<NewsWatcherDartBloc, NewsWatcherDartState>(
                        builder: topStoriesBuilder,
                      )
                    : title == "Trending"
                        ? BlocBuilder<NewstrendingBloc, NewstrendingState>(
                            builder: commonBuilder,
                          )
                        : title == "Top News" 
                        ? BlocBuilder<NewstopstoriesBloc, NewstopstoriesState>(
                            builder: topStoriesBuilder,
                          )
                        : BlocBuilder<BookmarkBloc, BookmarkState>(
                            builder: bookmarkStoriesBuilder,
                          )

          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      title=="Bookmarks"?context.router.navigate(const BookmarkPageRoute()):
                      context.router.navigate(ViewAllPageRoute(title: title));
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'view all',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF015397),
                        ),
                      ),
                      textAlign: TextAlign.start,
                    )),
              ],
            ),
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
              height: MediaQuery.of(context).size.height * 0.70,
              child: SearchListSkeleton())
        ],
      ),
      loadInProgress: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              child: SearchListSkeleton())
        ],
      ),
      loadSuccess: (newsData) => SearchList(news: newsData.news),
      loadFailure: (_) => Container(),
    );
  }

  Widget topStoriesBuilder(context, state) {
    return state.map(
      initial: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              child: TopStoriesSkeleton())
        ],
      ),
      loadInProgress: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              child: TopStoriesSkeleton())
        ],
      ),
      loadSuccess: (newsData) => TopStories(news: newsData.news),
      loadFailure: (_) => Container(),
    );
  }
    Widget bookmarkStoriesBuilder(context, state) {
    return state.map(
      initial: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              child: TopStoriesSkeleton())
        ],
      ),
      loadInProgress: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              child: TopStoriesSkeleton())
        ],
      ),
      loadSuccess: (newsData) => TopStories(news: newsData.data),
      loadFailure: (_) => Container(),
    );
  }
}
