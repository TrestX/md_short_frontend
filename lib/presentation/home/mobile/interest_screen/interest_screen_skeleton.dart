import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class InterestScreenSkeleton extends StatelessWidget {
  const InterestScreenSkeleton({Key? key, required this.mediaWidth})
      : super(key: key);
  final double mediaWidth;
  @override
  Widget build(BuildContext context) {
    var mediaWidth = widthGetMethod(context);
    return Scaffold(
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
        height: MediaQuery.of(context).size.height * 0.7,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            Wrap(spacing: 6.0, runSpacing: 6.0, children: [
                              for (var i = 0; i < 17; i++) _buildChip()
                            ]),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 25.0, left: 10.0),
                            child: Row(
                              children: <Widget>[
                                TextButton.icon(
                                  icon: const Text(
                                    "See all topics",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF015397),
                                    ),
                                  ),
                                  label: const Icon(Icons.navigate_next,
                                      size: 30, color: Color(0xFF015397)),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChip() {
    return const SkeletonAvatar(
      style: SkeletonAvatarStyle(
          shape: BoxShape.rectangle,
          width: 110,
          height: 40,
          borderRadius: BorderRadius.all(Radius.circular(25))),
    );
  }
}
