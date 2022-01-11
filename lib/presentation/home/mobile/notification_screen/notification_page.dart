import 'package:MD_Shorts/application/notification/bloc/notification_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaWidth = widthGetMethod(context);
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 14.0),
          child: Text(
            "Notifications",
          ),
        ),
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
      body: Center(
        child: SizedBox(
          width: mediaWidth,
          child: MediaQuery.of(context).size.width > 768
              ? Card(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.07),
                  child: Content(mediaWidth: mediaWidth),
                )
              : Content(mediaWidth: mediaWidth),
        ),
      ),
    );
  }

  double widthGetMethod(BuildContext context) {
    return MediaQuery.of(context).size.width > 768
        ? 768
        : MediaQuery.of(context).size.width;
  }
}

class Content extends StatelessWidget {
  final double mediaWidth;
  const Content({Key? key, required this.mediaWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "TODAY",
                      style: TextStyle(
                        color: Color(0xFF015397),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        height: 36,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 150,
                  child: BlocBuilder<NotificationBloc, NotificationState>(
                    builder: (context, state) {
                      return state.map(
                        initial: (_) => Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const SizedBox(height: 10),
                            const CircularProgressIndicator()
                          ],
                        ),
                        loadInProgress: (_) => Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const SizedBox(height: 10),
                            const CircularProgressIndicator()
                          ],
                        ),
                        loadSuccess: (noti) => NList(
                          noti: noti.data,
                        ),
                        loadFailure: (_) => Container(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NList extends StatelessWidget {
  final List noti;
  const NList({Key? key, required this.noti}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: noti.length,
        itemBuilder: (bContext, i) {
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  noti[i].body,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF015397),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    DateTime.now()
                                .difference(DateTime.parse(noti[i].sentTime))
                                .inMinutes >
                            60
                        ? DateTime.now()
                                    .difference(
                                        DateTime.parse(noti[i].sentTime))
                                    .inMinutes >
                                60 * 24
                            ? DateTime.now()
                                    .difference(
                                        DateTime.parse(noti[i].sentTime))
                                    .inDays
                                    .toString() +
                                "d ago"
                            : DateTime.now()
                                    .difference(
                                        DateTime.parse(noti[i].sentTime))
                                    .inHours
                                    .toString() +
                                "h ago"
                        : DateTime.now()
                                .difference(DateTime.parse(noti[i].sentTime))
                                .inMinutes
                                .toString() +
                            "m ago",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  height: 36,
                ),
              ],
            ),
          );
        });
  }
}
