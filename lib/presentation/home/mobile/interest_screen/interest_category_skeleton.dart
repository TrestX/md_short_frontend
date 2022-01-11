import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class InterestCategoryContentSkeleton extends StatelessWidget {
  const InterestCategoryContentSkeleton({
    Key? key,
    required this.mediaWidth,
  }) : super(key: key);

  final double mediaWidth;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: mediaWidth,
              child: MediaQuery.of(context).size.width > 768
                  ? Card(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: CardContent(
                        mediaWidth: mediaWidth,
                      ),
                    )
                  : CardContent(
                      mediaWidth: mediaWidth,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  const CardContent({
    Key? key,
    required this.mediaWidth,
  }) : super(key: key);

  final double mediaWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: mediaWidth > 750
            ? const EdgeInsets.only(left: 150, right: 150, top: 10, bottom: 70)
            : const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            width: mediaWidth,
            height: MediaQuery.of(context).size.height * 0.66,
            child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: MediaQuery.of(context).size.width > 1400
                        ? 6 / 5
                        : MediaQuery.of(context).size.width > 1000
                            ? 3 / 2
                            : 6 / 5,
                    crossAxisSpacing:
                        MediaQuery.of(context).size.width > 900 ? 10 : 0,
                    mainAxisSpacing: 20),
                itemCount: 27,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    child: Column(
                      children: [
                        const Center(
                          child: SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                                shape: BoxShape.circle, width: 75, height: 75),
                          ),
                        ),
                        SkeletonParagraph(
                          style: SkeletonParagraphStyle(
                              lines: 1,
                              spacing: 6,
                              lineStyle: SkeletonLineStyle(
                                randomLength: true,
                                height: 10,
                                borderRadius: BorderRadius.circular(8),
                                minLength:
                                    MediaQuery.of(context).size.width / 2,
                              )),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: SkeletonParagraph(
                    style: SkeletonParagraphStyle(
                        lines: 1,
                        spacing: 6,
                        lineStyle: SkeletonLineStyle(
                          width: 100,
                          height: 40,
                          borderRadius: BorderRadius.circular(25),
                        )),
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
