import 'dart:async';
import 'dart:io';

import 'package:MD_Shorts/application/news/news_form/news_form_bloc.dart';
import 'package:MD_Shorts/application/news_display/news_display_bloc/news_display_bloc.dart';
import 'package:MD_Shorts/presentation/home/mobile/widget/news_web_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'news_widget.dart';

class NewsCard extends StatelessWidget {
  final String url,
      imgUrl,
      primaryText,
      secondaryText,
      sourceName,
      author,
      publishedAt,
      newsID;
  NewsCard({
    Key? key,
    required this.url,
    required this.imgUrl,
    required this.primaryText,
    required this.secondaryText,
    required this.sourceName,
    required this.author,
    required this.publishedAt,
    required this.newsID,
  });

  final UniqueKey _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsDisplayBloc, NewsDisplayState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Dismissible(
              resizeDuration: null,
              key: ValueKey(state.page),
              onDismissed: (DismissDirection direction) {
                if (state.page > -1 && state.page < 2) {
                  if (direction == DismissDirection.endToStart) {
                    context
                        .read<NewsDisplayBloc>()
                        .add(const NewsDisplayEvent.changePage(2));
                  } else {
                    if (state.page == 2) {
                      context
                          .read<NewsDisplayBloc>()
                          .add(const NewsDisplayEvent.changePage(1));
                    } else {
                      context.router.navigate(CustomBottomNavigationBarRoute());
                    }
                  }
                }
              },
              child: GestureDetector(
                onTap: () {
                  context
                      .read<NewsDisplayBloc>()
                      .add(const NewsDisplayEvent.changeShowBottomBar());
                },
                child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: NewWidget(
                      showBottomBar: state.showBottomBar,
                      author: author,
                      imgUrl: imgUrl,
                      secondaryText: secondaryText,
                      primaryText: primaryText,
                      sourceName: sourceName,
                    )),
              )),
        );
      },
    );
  }
}
