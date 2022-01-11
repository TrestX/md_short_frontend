import 'package:MD_Shorts/application/bookmark/bloc/bookmark_bloc.dart';
import 'package:MD_Shorts/application/bookmark/bookmark_setter/bookmark_setter_bloc.dart';
import 'package:MD_Shorts/application/seefewerstories/bloc/seefewerstories_bloc.dart';
import 'package:MD_Shorts/injection.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:MD_Shorts/shared_preferences/profile_shared_preference.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:auto_route/auto_route.dart';
import 'package:MD_Shorts/application/share/bloc/share_bloc.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomBottomNavigationBarStoryW extends StatelessWidget {
  final String id;
  final String url;
  final String title;
  final String imageURL;
  final String source;
  const CustomBottomNavigationBarStoryW({
    Key? key,
    required this.id,
    required this.url,
    required this.title,
    required this.imageURL,
    required this.source,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarkSetterBloc, BookmarkSetterState>(
      builder: (context, state) {
        return CustomNavigationBar(
          iconSize: 30.0,
          selectedColor: const Color(0xff040307),
          strokeColor: const Color(0x30040307),
          unSelectedColor: const Color(0xff040307),
          backgroundColor: Colors.white,
          onTap: (i) async {
            if (i == 2) {
              var email = await ProfileNotifier().getEmail();
              if (email == "") {
                logInDialog(context);
              } else {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext sbcontext) =>
                      MoreOptionsDialog(id: id, source: source, title: title),
                );
              }
            }
          },
          items: [
            CustomNavigationBarItem(
              icon: Center(
                child: BlocBuilder<BookmarkBloc, BookmarkState>(
                  builder: (context, state) {
                    return state.map(
                      initial: (_) => IconButton(
                        icon: const Icon(Icons.bookmark_outline),
                        onPressed: () async {
                          var email = await ProfileNotifier().getEmail();
                          if (email == "") {
                            logInDialog(context);
                          } else {
                            context
                                .read<BookmarkSetterBloc>()
                                .add(BookmarkSetterEvent.setBookmark(id));
                          }
                        },
                      ),
                      loadInProgress: (_) => const CircularProgressIndicator(),
                      loadSuccess: (bookmarks) => IconButton(
                        icon: bookmarks.data
                                .where((elem) => elem.id.getOrCrash() == id)
                                .isEmpty
                            ? const Icon(Icons.bookmark_outline)
                            : const Icon(Icons.bookmark),
                        onPressed: () async {
                          var email = await ProfileNotifier().getEmail();
                          if (email == "") {
                            logInDialog(context);
                          } else {
                            if (bookmarks.data
                                .where((elem) => elem.id.getOrCrash() == id)
                                .isEmpty) {
                              context
                                  .read<BookmarkSetterBloc>()
                                  .add(BookmarkSetterEvent.setBookmark(id));
                            } else {
                              context
                                  .read<BookmarkSetterBloc>()
                                  .add(BookmarkSetterEvent.removeBookmark(id));
                            }
                          }
                        },
                      ),
                      loadFailure: (_) => IconButton(
                        icon: const Icon(Icons.bookmark_outline),
                        onPressed: () async {
                          var email = await ProfileNotifier().getEmail();
                          if (email == "") {
                            logInDialog(context);
                          } else {
                            context
                                .read<BookmarkSetterBloc>()
                                .add(BookmarkSetterEvent.setBookmark(id));
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            CustomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.share),
                onPressed: () async {
                  context.read<ShareBloc>().add(ShareEvent.watchAllStarted(id));
                  final RenderBox box = context.findRenderObject() as RenderBox;

                  Share.share('$title (www.mdshorts.com/home/$id) via MDShorts',
                      subject:
                          '$title (www.mdshorts.com/home/$id) via MDShorts',
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size);
                },
              ),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.more_horiz),
            ),
          ],
          currentIndex: 0,
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
            'Login or register to bookmark/update this article',
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

class MoreOptionsDialog extends StatelessWidget {
  const MoreOptionsDialog({
    Key? key,
    required this.id,
    required this.source,
    required this.title,
    this.pushToHome = true,
  }) : super(key: key);

  final String id;
  final String source;
  final String title;
  final bool pushToHome;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SeeFewStoriesColumn(
                id: id,
                source: source,
                title: title,
                pushToHome: pushToHome,
              ),
              TextButton(
                onPressed: () {
                  context.router.navigate(const InterestPageRoute());
                },
                child: Row(
                  children: const [
                    FaIcon(FontAwesomeIcons.slidersH),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Manage Interests",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () async {
                  final mailtoLink = Mailto(
                    to: ['update@mdshorts.com'],
                    subject: 'Report Content',
                    body:
                        'Story Id:$id  Story Title: $title  Source name:$source ',
                  );
                  // Convert the Mailto instance into a string.
                  // Use either Dart's string interpolation
                  // or the toString() method.
                  await launch('$mailtoLink');
                },
                child: Row(
                  children: const [
                    Icon(Icons.flag_outlined),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Report content",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () async {
                  final mailtoLink = Mailto(
                    to: ['update@mdshorts.com'],
                    subject: 'Send FeedBack',
                    body:
                        'Story Id:$id  Story Title: $title  Source name:$source',
                  );
                  // Convert the Mailto instance into a string.
                  // Use either Dart's string interpolation
                  // or the toString() method.
                  await launch('$mailtoLink');
                },
                child: Row(
                  children: const [
                    Icon(Icons.feedback_outlined),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Send feedback",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SeeFewStoriesColumn extends StatelessWidget {
  const SeeFewStoriesColumn({
    Key? key,
    required this.id,
    required this.source,
    required this.title,
    required this.pushToHome,
  }) : super(key: key);

  final String id;
  final String source;
  final String title;
  final bool pushToHome;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SeefewerstoriesBloc>(),
      child: BlocConsumer<SeefewerstoriesBloc, SeefewerstoriesState>(
        listener: (context, state) {
          state.seeFewerFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                FlushbarHelper.createError(
                  message: failure.map(
                    cancelledByUser: (_) => 'Cancelled',
                    serverError: (_) => 'Already Clicked',
                  ),
                ).show(context);
              },
              (_) async {
                FlushbarHelper.createSuccess(
                        message: "Successfully Added to blocker")
                    .show(context);
                await FirebaseAnalytics()
                    .logEvent(name: 'See Fewer stories', parameters: {
                  'news_id': id,
                  "addedat": DateTime.now().toString(),
                  "sourceName": source,
                  "title": title
                });
                if (pushToHome) {
                  context.router.popAndPush(HomePageRoute());
                }
                Navigator.pop(context);
              },
            ),
          );
        },
        builder: (context, state) {
          return Column(
            children: [
              TextButton(
                onPressed: () {
                  context
                      .read<SeefewerstoriesBloc>()
                      .add(SeefewerstoriesEvent.addtoseefewer(source));
                },
                child: Row(
                  children: const [
                    Icon(Icons.thumb_down_off_alt_outlined),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "See fewer stories like this",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  context
                      .read<SeefewerstoriesBloc>()
                      .add(SeefewerstoriesEvent.addtoseefewer(source));
                },
                child: Row(
                  children: [
                    const FaIcon(FontAwesomeIcons.ban),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "Dont show stories from \n$source",
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
