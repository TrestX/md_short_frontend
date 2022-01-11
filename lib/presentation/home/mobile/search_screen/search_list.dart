import 'dart:async';

import 'package:MD_Shorts/application/bookmark/bloc/bookmark_bloc.dart';
import 'package:MD_Shorts/application/bookmark/bookmark_setter/bookmark_setter_bloc.dart';
import 'package:MD_Shorts/application/share/bloc/share_bloc.dart';
import 'package:MD_Shorts/domain/news/news.dart';
import 'package:MD_Shorts/presentation/core/custom_bottom_navigation_bar_story.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/search_web_view.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:MD_Shorts/shared_preferences/profile_shared_preference.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchList extends StatelessWidget {
  final bool searched;
  SearchList({Key? key, required this.news, this.searched = false})
      : super(key: key);
  final List<News> news;
  final Completer<WebViewController>? _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: searched
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemCount: searched ? news.length : 4,
      itemBuilder: (bContext, i) {
        return GestureDetector(
          onTap: () {
            var newsId = news[i].id.getOrCrash();
            context.router.popAndPush(HomePageRoute(newID: newsId));
          },
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            news[i].sourceName,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            news[i].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 17,
                            ),
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchWebView(
                                            url: news[i].url,
                                            controller: _controller)));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    DateTime.now().difference(DateTime.parse(news[i].publishedAt)).inMinutes >
                                            60
                                        ? DateTime.now()
                                                    .difference(DateTime.parse(
                                                        news[i].publishedAt))
                                                    .inMinutes >
                                                60 * 24
                                            ? DateTime.now()
                                                    .difference(DateTime.parse(
                                                        news[i].publishedAt))
                                                    .inDays
                                                    .toString() +
                                                "d ago"
                                            : DateTime.now()
                                                    .difference(DateTime.parse(
                                                        news[i].publishedAt))
                                                    .inHours
                                                    .toString() +
                                                "h ago"
                                        : DateTime.now()
                                                .difference(DateTime.parse(
                                                    news[i].publishedAt))
                                                .inMinutes
                                                .toString() +
                                            "m ago",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 14,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      BlocBuilder<BookmarkBloc, BookmarkState>(
                                        builder: (context, state) {
                                          return state.map(
                                            initial: (_) => IconButton(
                                              icon: const Icon(
                                                Icons.bookmark_outline,
                                                color: Color(0xFF015397),
                                              ),
                                              onPressed: () async {
                                                var email =
                                                    await ProfileNotifier()
                                                        .getEmail();
                                                if (email == "") {
                                                } else {
                                                  context
                                                      .read<
                                                          BookmarkSetterBloc>()
                                                      .add(BookmarkSetterEvent
                                                          .setBookmark(news[i]
                                                              .id
                                                              .getOrCrash()));
                                                }
                                              },
                                            ),
                                            loadInProgress: (_) => IconButton(
                                              icon: const Icon(
                                                Icons.bookmark_outline,
                                                color: Color(0xFF015397),
                                              ),
                                              onPressed: () async {
                                                var email =
                                                    await ProfileNotifier()
                                                        .getEmail();
                                                if (email == "") {
                                                } else {
                                                  context
                                                      .read<
                                                          BookmarkSetterBloc>()
                                                      .add(BookmarkSetterEvent
                                                          .setBookmark(news[i]
                                                              .id
                                                              .getOrCrash()));
                                                }
                                              },
                                            ),
                                            loadSuccess: (bookmarks) =>
                                                IconButton(
                                              icon: bookmarks.data
                                                      .where((elem) =>
                                                          elem.id
                                                              .getOrCrash() ==
                                                          news[i]
                                                              .id
                                                              .getOrCrash())
                                                      .isEmpty
                                                  ? const Icon(
                                                      Icons.bookmark_outline,
                                                      color: Color(0xFF015397),
                                                    )
                                                  : const Icon(
                                                      Icons.bookmark,
                                                      color: Color(0xFF015397),
                                                    ),
                                              onPressed: () async {
                                                var email =
                                                    await ProfileNotifier()
                                                        .getEmail();
                                                if (email == "") {
                                                } else {
                                                  if (bookmarks.data
                                                      .where((elem) =>
                                                          elem.id
                                                              .getOrCrash() ==
                                                          news[i]
                                                              .id
                                                              .getOrCrash())
                                                      .isEmpty) {
                                                    context
                                                        .read<
                                                            BookmarkSetterBloc>()
                                                        .add(BookmarkSetterEvent
                                                            .setBookmark(news[i]
                                                                .id
                                                                .getOrCrash()));
                                                  } else {
                                                    context
                                                        .read<
                                                            BookmarkSetterBloc>()
                                                        .add(BookmarkSetterEvent
                                                            .removeBookmark(news[
                                                                    i]
                                                                .id
                                                                .getOrCrash()));
                                                  }
                                                }
                                              },
                                            ),
                                            loadFailure: (_) => IconButton(
                                              icon: const Icon(
                                                Icons.bookmark_outline,
                                                color: Color(0xFF015397),
                                              ),
                                              onPressed: () async {
                                                var email =
                                                    await ProfileNotifier()
                                                        .getEmail();
                                                if (email == "") {
                                                } else {
                                                  context
                                                      .read<
                                                          BookmarkSetterBloc>()
                                                      .add(BookmarkSetterEvent
                                                          .setBookmark(news[i]
                                                              .id
                                                              .getOrCrash()));
                                                }
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.share,
                                          color: Color(0xFF015397),
                                        ),
                                        onPressed: () async {
                                          context.read<ShareBloc>().add(
                                              ShareEvent.watchAllStarted(
                                                  news[i].id.getOrCrash()));
                                          final RenderBox box = context
                                              .findRenderObject() as RenderBox;
                                          Share.share(
                                              news[i].title +
                                                  ' (www.mdshorts.com/home/${news[i].id}) via MDShorts',
                                              subject: news[i].title +
                                                  ' (www.mdshorts.com/home/${news[i].id}) via MDShorts',
                                              sharePositionOrigin:
                                                  box.localToGlobal(
                                                          Offset.zero) &
                                                      box.size);
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.more_horiz,
                                          color: Color(0xFF015397),
                                        ),
                                        onPressed: () async {
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                MoreOptionsDialog(
                                              id: news[i].id.getOrCrash(),
                                              source: news[i].sourceName,
                                              title: news[i].title,
                                              pushToHome: false,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Image.network(
                        news[i].urlToImage,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset('assets/images/A_blank_flag.png');
                        },
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                  height: 6,
                ),
                const SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
