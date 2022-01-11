import 'dart:async';
import 'dart:io';

import 'package:MD_Shorts/application/news/news_form/news_form_bloc.dart';
import 'package:MD_Shorts/application/news_display/news_display_bloc/news_display_bloc.dart';
import 'package:MD_Shorts/application/updatenews/bloc/updatenews_bloc.dart';
import 'package:MD_Shorts/domain/news/news.dart';
import 'package:MD_Shorts/presentation/core/custom_bottom_nav_bar_bloc.dart';
import 'package:MD_Shorts/presentation/home/mobile/widget/news_display.dart';
import 'package:MD_Shorts/presentation/home/mobile/widget/news_web_view.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:MD_Shorts/shared_preferences/profile_shared_preference.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsList extends StatelessWidget {
  final List<News> news;
  NewsList({Key? key, required this.news}) : super(key: key);
  Widget newsCard(int index) {
    return NewsCard(
      newsID: news[index].id.getOrCrash(),
      imgUrl: news[index].urlToImage,
      primaryText: news[index].title,
      secondaryText: news[index].description,
      sourceName: news[index].sourceName,
      author: news[index].author,
      publishedAt: news[index].publishedAt,
      url: news[index].url,
    );
  }

  final Completer<WebViewController>? _controller =
      Completer<WebViewController>();

  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers = {
    Factory(() => EagerGestureRecognizer())
  };
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    PageController _pageController = PageController();

    context
        .read<NewsFormBloc>()
        .add(NewsFormEvent.changeEntryTime(DateTime.now()));
    int pageC = 0;
    void stateUpdate(int val) {
      context
          .read<NewsFormBloc>()
          .add(const NewsFormEvent.changeUrlClicked(true));
      context.read<NewsDisplayBloc>().add(const NewsDisplayEvent.changePage(1));
      _pageController = PageController(initialPage: val);
      pageC = val;
    }

    return BlocBuilder<NewsFormBloc, NewsFormState>(
      builder: (context, state) {
        return BlocBuilder<NewsDisplayBloc, NewsDisplayState>(
          builder: (context, ndState) {
            return ndState.page == 1
                ? Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.center,
                    children: [
                      Scaffold(
                        backgroundColor: Colors.transparent,
                        appBar: AppBar(
                          title: const Text("My Feed"),
                          centerTitle: true,
                          actions: [
                            IconButton(
                              onPressed: () {
                                context.router.push(HomePageRoute());
                              },
                              icon: const Icon(
                                Icons.refresh_outlined,
                                color: Color(0xFF015397),
                              ),
                            ),
                          ],
                          leadingWidth: 105,
                          leading: TextButton.icon(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(0)),
                            ),
                            onPressed: () {
                              context.router
                                  .navigate(CustomBottomNavigationBarRoute());
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 15,
                              color: Color(0xFF015397),
                            ),
                            label: const Text(
                              "Discover",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        body: PageView.builder(
                          controller: _pageController,
                          allowImplicitScrolling: false,
                          onPageChanged: (page) async {
                            final timeSpent = DateTime.now()
                                .difference(state.entryTime)
                                .inSeconds;
                            pageC = page;
                            if (page > 0) {
                              context.read<UpdatenewsBloc>().add(
                                  UpdatenewsEvent.updateNews(
                                      news[page - 1].id.getOrCrash(),
                                      "Read",
                                      news[page - 1].url,
                                      state.urlClicked,
                                      timeSpent,
                                      DateTime.now().toString()));
                            }
                            context
                                .read<NewsFormBloc>()
                                .add(NewsFormEvent.changeLastIndex(page));
                            context.read<NewsFormBloc>().add(
                                NewsFormEvent.changeEntryTime(DateTime.now()));
                            context.read<NewsFormBloc>().add(
                                const NewsFormEvent.changeUrlClicked(false));
                            if (page > 0) {
                              await FirebaseAnalytics()
                                  .logEvent(name: 'view_news', parameters: {
                                'news_id':
                                    news[page - 1].id.getOrCrash().toString(),
                                'url_clicked': state.urlClicked.toString(),
                                "timeSpent": timeSpent.toString(),
                                "readat": DateTime.now().toString(),
                                "author": news[page - 1].author.toString(),
                                "sourceName":
                                    news[page - 1].sourceName.toString(),
                              });
                            }
                            var email = await ProfileNotifier().getEmail();
                            if (email == "" && page > 2) {
                              logInDialog(context);
                            }
                          },
                          itemCount: news.length,
                          scrollDirection: Axis.vertical,
                          padEnds: false,
                          itemBuilder: (_, index) {
                            return newsCard(index);
                          },
                        ),
                        bottomNavigationBar:
                            BlocBuilder<NewsDisplayBloc, NewsDisplayState>(
                          builder: (context, state) {
                            return state.page == 1
                                ? CustomBottomNavigationBarStory(
                                    id: news[pageC].id.getOrCrash(),
                                    url: news[pageC].url,
                                    imageURL: news[pageC].urlToImage,
                                    title: news[pageC].title,
                                    source: news[pageC].sourceName,
                                  )
                                : const SizedBox();
                          },
                        ),
                      ),
                    ],
                  )
                : NewsWebView(
                    gestureRecognizers: gestureRecognizers,
                    callback: stateUpdate,
                    controller: _controller,
                    sourceName: news[pageC].sourceName,
                    url: news[pageC].url,
                    page: pageC,
                  );
          },
        );
      },
    );
  }

  void logInDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF015397),
          title: const Text(
            'Login or register to read this article',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 27,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text(
                  'If you do not have a Log in, please register to be part of a big community, experience premium content and stay informed about exclusive professional events.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        onPressed: () => context.router
                            .popAndPush(const CategoryPageRoute()),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[300],
                          minimumSize: Size(
                              MediaQuery.of(context).size.width > 500
                                  ? MediaQuery.of(context).size.width * 0.5
                                  : MediaQuery.of(context).size.width * 0.7,
                              40),
                        ),
                        child: const Text("Sign up",
                            style: TextStyle(
                                color: Color(0xFF015397),
                                fontSize: 16,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () =>
                        context.router.popAndPush(LoginPageRoute()),
                    child: const Text(
                      "Already a member? Sign in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
