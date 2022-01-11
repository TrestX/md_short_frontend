import 'dart:async';

import 'package:MD_Shorts/application/bookmark/bloc/bookmark_bloc.dart';
import 'package:MD_Shorts/application/bookmark/bookmark_setter/bookmark_setter_bloc.dart';
import 'package:MD_Shorts/application/seefewerstories/bloc/seefewerstories_bloc.dart';
import 'package:MD_Shorts/application/share/bloc/share_bloc.dart';
import 'package:MD_Shorts/presentation/core/custom_bottom_navigation_bar_story.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/large_news_comp.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:MD_Shorts/shared_preferences/profile_shared_preference.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mailto/mailto.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopStories extends StatelessWidget {
  TopStories({Key? key, required this.news}) : super(key: key);
  final List news;
  final Completer<WebViewController>? _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        LargeNewsComp(news: news),
        SizedBox(height: 400, child: TopListStories(news: news.sublist(1))),
      ],
    );
  }
}

class TopListStories extends StatelessWidget {
  const TopListStories({Key? key, required this.news}) : super(key: key);
  final List news;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.60),
      itemBuilder: (BuildContext context, int i) {
        return GestureDetector(
          onTap: () {
            var newS = news[i].id.getOrCrash();
            context.router.popAndPush(HomePageRoute(newID: newS));
          },
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // add this
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                  child: news[i].urlToImage.toString().isNotEmpty &&
                          news[i].urlToImage.toString().contains("https")
                      ? Image.network(news[i].urlToImage,
                          height: 130, fit: BoxFit.fill)
                      : Image.asset('assets/images/A_blank_flag.png',
                          height: 130, fit: BoxFit.fill),
                ),
                const SizedBox(height: 20),
                Text(
                  news[i].sourceName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  isThreeLine: true,
                  title: Text(
                    news[i].title + "\n\n",
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            DateTime.now()
                                        .difference(
                                            DateTime.parse(news[i].publishedAt))
                                        .inMinutes >
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
                                        .difference(
                                            DateTime.parse(news[0].publishedAt))
                                        .inMinutes
                                        .toString() +
                                    "m ago",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              BlocBuilder<BookmarkBloc, BookmarkState>(
                                builder: (context, state) {
                                  return state.map(
                                    initial: (_) => IconButton(
                                      constraints:
                                          const BoxConstraints(minWidth: 35),
                                      icon: const Icon(
                                        Icons.bookmark_outline,
                                        color: Color(0xFF015397),
                                        size: 25,
                                      ),
                                      onPressed: () async {
                                        var email =
                                            await ProfileNotifier().getEmail();
                                        if (email == "") {
                                        } else {
                                          context
                                              .read<BookmarkSetterBloc>()
                                              .add(BookmarkSetterEvent
                                                  .setBookmark(
                                                      news[i].id.getOrCrash()));
                                        }
                                      },
                                    ),
                                    loadInProgress: (_) => IconButton(
                                      splashRadius: 15,
                                      iconSize: 15,
                                      constraints:
                                          const BoxConstraints(minWidth: 35),
                                      icon: const Icon(
                                        Icons.bookmark_border_outlined,
                                        color: Color(0xFF015397),
                                        size: 25,
                                      ),
                                      onPressed: () async {
                                        var email =
                                            await ProfileNotifier().getEmail();
                                        if (email == "") {
                                        } else {
                                          context
                                              .read<BookmarkSetterBloc>()
                                              .add(BookmarkSetterEvent
                                                  .setBookmark(
                                                      news[i].id.getOrCrash()));
                                        }
                                      },
                                    ),
                                    loadSuccess: (bookmarks) => IconButton(
                                      splashRadius: 15,
                                      iconSize: 15,
                                      constraints:
                                          const BoxConstraints(minWidth: 35),
                                      icon: bookmarks.data
                                              .where((elem) =>
                                                  elem.id.getOrCrash() ==
                                                  news[i].id.getOrCrash())
                                              .isEmpty
                                          ? const Icon(
                                              Icons.bookmark_outline,
                                              color: Color(0xFF015397),
                                              size: 25,
                                            )
                                          : const Icon(
                                              Icons.bookmark,
                                              color: Color(0xFF015397),
                                              size: 25,
                                            ),
                                      onPressed: () async {
                                        var email =
                                            await ProfileNotifier().getEmail();
                                        if (email == "") {
                                        } else {
                                          if (bookmarks.data
                                              .where((elem) =>
                                                  elem.id.getOrCrash() ==
                                                  news[i].id.getOrCrash())
                                              .isEmpty) {
                                            context
                                                .read<BookmarkSetterBloc>()
                                                .add(BookmarkSetterEvent
                                                    .setBookmark(news[i]
                                                        .id
                                                        .getOrCrash()));
                                          } else {
                                            context
                                                .read<BookmarkSetterBloc>()
                                                .add(BookmarkSetterEvent
                                                    .removeBookmark(news[i]
                                                        .id
                                                        .getOrCrash()));
                                          }
                                        }
                                      },
                                    ),
                                    loadFailure: (_) => IconButton(
                                      constraints:
                                          const BoxConstraints(minWidth: 35),
                                      splashRadius: 15,
                                      iconSize: 15,
                                      icon: const Icon(
                                        Icons.bookmark_border_outlined,
                                        color: Color(0xFF015397),
                                        size: 25,
                                      ),
                                      onPressed: () async {
                                        var email =
                                            await ProfileNotifier().getEmail();
                                        if (email == "") {
                                        } else {
                                          context
                                              .read<BookmarkSetterBloc>()
                                              .add(BookmarkSetterEvent
                                                  .setBookmark(
                                                      news[i].id.getOrCrash()));
                                        }
                                      },
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(minWidth: 35),
                                splashRadius: 15,
                                iconSize: 15,
                                icon: const Icon(
                                  Icons.share,
                                  size: 25,
                                  color: Color(0xFF015397),
                                ),
                                onPressed: () async {
                                  context.read<ShareBloc>().add(
                                      ShareEvent.watchAllStarted(
                                          news[i].id.getOrCrash()));
                                  final RenderSliver box = context
                                      .findRenderObject() as RenderSliver;
                                  Share.share(
                                    news[i].title +
                                        ' (www.mdshorts.com/home/${news[i].id.getOrCrash()}) via MDShorts',
                                    subject: news[i].title +
                                        ' (www.mdshorts.com/home/${news[i].id.getOrCrash()}) via MDShorts',
                                  );
                                },
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(minWidth: 35),
                                splashRadius: 15,
                                iconSize: 15,
                                icon: const Icon(
                                  Icons.more_horiz,
                                  size: 25,
                                  color: Color(0xFF015397),
                                ),
                                onPressed: () {
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
