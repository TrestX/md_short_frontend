import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:skeletons/skeletons.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TopStoriesSkeleton extends StatelessWidget {
  TopStoriesSkeleton({Key? key}) : super(key: key);
  final Completer<WebViewController>? _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const SkeletonAvatar(
          style: SkeletonAvatarStyle(
            width: double.infinity,
            height: 170,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SkeletonParagraph(
          style: SkeletonParagraphStyle(
              lines: 1,
              spacing: 6,
              lineStyle: SkeletonLineStyle(
                width: 80,
                height: 10,
                borderRadius: BorderRadius.circular(6),
                minLength: MediaQuery.of(context).size.width / 2,
              )),
        ),
        const SizedBox(
          height: 15,
        ),
        SkeletonParagraph(
          style: SkeletonParagraphStyle(
              lines: 3,
              spacing: 6,
              lineStyle: SkeletonLineStyle(
                randomLength: true,
                height: 15,
                borderRadius: BorderRadius.circular(6),
                minLength: MediaQuery.of(context).size.width / 2,
              )),
        ),
        const SizedBox(height: 400, child: TopListStoriesSkeleton()),
      ],
    );
  }
}

class TopListStoriesSkeleton extends StatelessWidget {
  const TopListStoriesSkeleton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.60),
      itemBuilder: (BuildContext context, int i) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // add this
            children: <Widget>[
              const SkeletonAvatar(
                style: SkeletonAvatarStyle(height: 130, width: double.infinity),
              ),
              const SizedBox(height: 20),
              SkeletonParagraph(
                style: SkeletonParagraphStyle(
                    lines: 1,
                    spacing: 6,
                    lineStyle: SkeletonLineStyle(
                      width: 60,
                      height: 10,
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                isThreeLine: true,
                title: SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 3,
                      spacing: 6,
                      lineStyle: SkeletonLineStyle(
                        randomLength: true,
                        height: 10,
                        borderRadius: BorderRadius.circular(8),
                        minLength: MediaQuery.of(context).size.width / 2,
                      )),
                ),
                subtitle: SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                      lines: 1,
                      lineStyle: SkeletonLineStyle(
                        width: 50,
                        height: 10,
                        borderRadius: BorderRadius.circular(8),
                      )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
