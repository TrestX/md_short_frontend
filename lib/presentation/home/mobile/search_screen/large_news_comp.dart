import 'dart:async';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LargeNewsComp extends StatelessWidget {
  LargeNewsComp({Key? key, required this.news}) : super(key: key);
  final List news;
  final Completer<WebViewController>? _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var newS = news[0].id.getOrCrash();
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
                child: news[0].urlToImage.toString().isNotEmpty &&
                        news[0].urlToImage.toString().contains("https")
                    ? Image.network(news[0].urlToImage,
                        height: 175,
                        width: MediaQuery.of(context).size.width * 92,
                        fit: BoxFit.fitWidth)
                    : Image.asset('assets/images/A_blank_flag.png',
                        height: 175, fit: BoxFit.fill),
              ),
              const SizedBox(height: 20),
              Text(
                news[0].sourceName,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                isThreeLine: true,
                title: Text(
                  news[0].title + "\n\n",
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    DateTime.now()
                                .difference(DateTime.parse(news[0].publishedAt))
                                .inMinutes >
                            60
                        ? DateTime.now()
                                    .difference(
                                        DateTime.parse(news[0].publishedAt))
                                    .inMinutes >
                                60 * 24
                            ? DateTime.now()
                                    .difference(
                                        DateTime.parse(news[0].publishedAt))
                                    .inDays
                                    .toString() +
                                "d ago"
                            : DateTime.now()
                                    .difference(
                                        DateTime.parse(news[0].publishedAt))
                                    .inHours
                                    .toString() +
                                "h ago"
                        : DateTime.now()
                                .difference(DateTime.parse(news[0].publishedAt))
                                .inMinutes
                                .toString() +
                            "m ago",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class LargeNewsBookmarkComp extends StatelessWidget {
  LargeNewsBookmarkComp({Key? key, required this.news}) : super(key: key);
  final List news;
  final Completer<WebViewController>? _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var newS = news[0].newsId;
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
                child: news[0].newss['urlToImage'].toString().isNotEmpty &&
                        news[0].newss['urlToImage'].toString().contains("https")
                    ? Image.network(news[0].newss['urlToImage'],
                        height: 175,
                        width: MediaQuery.of(context).size.width * 92,
                        fit: BoxFit.fitWidth)
                    : Image.asset('assets/images/A_blank_flag.png',
                        height: 175, fit: BoxFit.fill),
              ),
              const SizedBox(height: 20),
              Text(
                news[0].newss['sourceName'],
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                isThreeLine: true,
                title: Text(
                  news[0].newss['title'] + "\n\n",
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    DateTime.now()
                                .difference(DateTime.parse(
                                    news[0].newss['publishedAt']))
                                .inMinutes >
                            60
                        ? DateTime.now()
                                    .difference(DateTime.parse(
                                        news[0].newss['publishedAt']))
                                    .inMinutes >
                                60 * 24
                            ? DateTime.now()
                                    .difference(DateTime.parse(
                                        news[0].newss['publishedAt']))
                                    .inDays
                                    .toString() +
                                "d ago"
                            : DateTime.now()
                                    .difference(DateTime.parse(
                                        news[0].newss['publishedAt']))
                                    .inHours
                                    .toString() +
                                "h ago"
                        : DateTime.now()
                                .difference(DateTime.parse(
                                    news[0].newss['publishedAt']))
                                .inMinutes
                                .toString() +
                            "m ago",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
