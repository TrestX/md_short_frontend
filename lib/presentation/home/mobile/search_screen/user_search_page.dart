import 'package:MD_Shorts/application/news/news_search/bloc/news_search_bloc.dart';
import 'package:MD_Shorts/application/news/news_search_form/bloc/newssearchform_bloc.dart';
import 'package:MD_Shorts/application/news/news_watcher/news_watcher_dart_bloc.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/search_chips.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/search_list.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/search_list_skeleton.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:MD_Shorts/shared_preferences/search_shared_preference.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSearchScreen extends StatelessWidget {
  final String search;
  const UserSearchScreen({Key? key, required this.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sear = search;
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          body: BlocBuilder<NewssearchformBloc, NewssearchformState>(
            builder: (context, state) {
              context
                  .read<NewssearchformBloc>()
                  .add(NewssearchformEvent.changeSearch(sear));
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
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              isDense: true, // Added this
                              contentPadding: EdgeInsets.all(8),
                              prefixIcon: Icon(Icons.search),
                              hintText: "Search for news",
                            ),
                            initialValue: search,
                            onChanged: (value) {
                              sear = value;
                              context
                                  .read<NewssearchformBloc>()
                                  .add(NewssearchformEvent.changeSearch(value));
                            },
                            onEditingComplete: () async {
                              if (state.search != "") {
                                await SearchHistoryNotifier()
                                    .setSearches(state.search);
                              }

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
                      child: sear != ""
                          ? BlocBuilder<NewsSearchBloc, NewsSearchState>(
                              builder: (context, state) {
                                return state.map(
                                  initial: (_) => Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.70,
                                          child: SearchListSkeleton())
                                    ],
                                  ),
                                  loadInProgress: (_) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.70,
                                          child: SearchListSkeleton())
                                    ],
                                  ),
                                  loadSuccess: (newsData) => newsData
                                          .news.isNotEmpty
                                      ? SearchList(
                                          news: newsData.news,
                                          searched: true,
                                        )
                                      : ListView(
                                          children: [
                                            const SearchScreenChips(),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.2,
                                                  left: 10,
                                                  right: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.network(
                                                      "https://img.icons8.com/external-kiranshastry-lineal-kiranshastry/100/000000/external-file-advertising-kiranshastry-lineal-kiranshastry-1.png"),
                                                  const Text(
                                                    "No results found",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Try adjusting your search to find what you're looking for",
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style: TextStyle(
                                                      color: Colors.grey[400],
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                  loadFailure: (_) => ListView(
                                    children: [
                                      const SearchScreenChips(),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            left: 10,
                                            right: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.network(
                                                "https://img.icons8.com/external-kiranshastry-lineal-kiranshastry/100/000000/external-file-advertising-kiranshastry-lineal-kiranshastry-1.png"),
                                            const Text(
                                              "No results found",
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              "Try adjusting your search to find what you're looking for",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          : ListView(
                              children: const [
                                SearchScreenChips(),
                        CommonHomeLists(
                          title: "Global",
                        ),
                        SizedBox(height: 10),
                        CommonHomeLists(
                          title: "Guidelines",
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
            child: title == "Global"
                ? BlocBuilder<NewsWatcherDartBloc, NewsWatcherDartState>(
                    builder: commonBuilder,
                  )
                :  BlocBuilder<NewsSearchBloc, NewsSearchState>(
                            builder: commonBuilder,
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
}