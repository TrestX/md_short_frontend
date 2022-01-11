import 'package:MD_Shorts/application/news/news_form/news_form_bloc.dart';
import 'package:MD_Shorts/domain/news/news.dart';
import 'package:MD_Shorts/presentation/home/web/widgets/news_web_display.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:MD_Shorts/shared_preferences/profile_shared_preference.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsWebList extends StatefulWidget {
  final List<News> news;
  final double widthNew;
  const NewsWebList({Key? key, required this.news, required this.widthNew})
      : super(key: key);

  @override
  State<NewsWebList> createState() => _NewsWebListState();
}

class _NewsWebListState extends State<NewsWebList> {
  Widget newsCard(int index) {
    return NewsWebDisplay(
      id: widget.news[index].id.getOrCrash(),
      imgUrl: widget.news[index].urlToImage,
      primaryText: widget.news[index].title,
      secondaryText: widget.news[index].description,
      sourceName: widget.news[index].sourceName,
      author: widget.news[index].author,
      publishedAt: widget.news[index].publishedAt,
      url: widget.news[index].url,
    );
  }

  bool showMessage = true;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() async {
      var email = await ProfileNotifier().getEmail();
      if (email == "") {
        logInDialog(context);
      }
    });

    return BlocBuilder<NewsFormBloc, NewsFormState>(
      builder: (context, state) {
        return Center(
          child: SizedBox(
            width: widget.widthNew,
            child: MediaQuery.of(context).size.width > 1012
                ? Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                      bottom: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: ListView(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(20.0),
                          itemCount: widget.news.length,
                          scrollDirection: Axis.vertical,
                          controller: _scrollController,
                          itemBuilder: (_, index) {
                            return index == 0
                                ? Column(children: [
                                    Container(
                                      height: 100,
                                      padding: const EdgeInsets.all(20),
                                      color: const Color(0xFF015397),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Download mdshorts app to keep up to date with the latest news.",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                    height: 45,
                                                    child: Image.asset(
                                                        "assets/images/appstore.png")),
                                                const SizedBox(
                                                  width: 30,
                                                ),
                                                SizedBox(
                                                    height: 45,
                                                    child: Image.asset(
                                                        "assets/images/playstore.png")),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    newsCard(index),
                                  ])
                                : newsCard(index);
                          },
                        ),
                      ),
                    ]),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(20.0),
                    itemCount: widget.news.length,
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) {
                      return index == 0
                          ? SingleChildScrollView(
                              child: Column(children: [
                                MediaQuery.of(context).size.width > 800
                                    ? Container(
                                        height: 100,
                                        padding: const EdgeInsets.all(20),
                                        color: const Color(0xFF015397),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Download mdshorts app to keep up to date with the latest news.",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                      height: 45,
                                                      child: Image.asset(
                                                          "assets/images/appstore.png")),
                                                  const SizedBox(
                                                    width: 30,
                                                  ),
                                                  SizedBox(
                                                      height: 45,
                                                      child: Image.asset(
                                                          "assets/images/playstore.png")),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container(
                                        color: const Color(0xFF015397),
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Download mdshorts app to keep up to date with the latest news.",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                    height: 30,
                                                    child: Image.asset(
                                                        "assets/images/appstore.png")),
                                                const SizedBox(
                                                  width: 25,
                                                ),
                                                SizedBox(
                                                    height: 30,
                                                    child: Image.asset(
                                                        "assets/images/playstore.png")),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                const SizedBox(height: 10),
                                newsCard(index),
                              ]),
                            )
                          : newsCard(index);
                    },
                  ),
          ),
        );
      },
    );
  }

  _getCloseButton(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
      child: Container(
        alignment: FractionalOffset.topRight,
        child: IconButton(
          icon: const Icon(
            Icons.clear,
            color: Colors.red,
          ),
          onPressed: () {
            setState(() {
              showMessage = false;
            });
            Navigator.pop(context);
            return;
          },
        ),
      ),
    );
  }

  void logInDialog(BuildContext context) {
    if (showMessage) {
      setState(() {
        showMessage = false;
      });
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              backgroundColor: const Color(0xFF015397),
              titlePadding: const EdgeInsets.all(0.0),
              title: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _getCloseButton(context),
                    const Text(
                      'Login or register to more articles',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
              ),
              content: Builder(builder: (context) {
                var width = MediaQuery.of(context).size.width;
                return SizedBox(
                  width: width > 1000
                      ? 0.1
                      : width > 700
                          ? width * 0.2
                          : 0.5,
                  child: SingleChildScrollView(
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
                        const SizedBox(
                          height: 10,
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
                                          ? MediaQuery.of(context).size.width *
                                              0.3
                                          : MediaQuery.of(context).size.width *
                                              0.7,
                                      40),
                                ),
                                child: const Text("Sign up",
                                    style: TextStyle(
                                        color: Color(0xFF015397),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () =>
                                context.router.popAndPush(LoginPageRoute()),
                            child: const Text(
                              "Already a member? Sign in",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }));
        },
      );
    }
  }
}
