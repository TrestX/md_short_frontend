import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:skeletons/skeletons.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsListSkeleton extends StatelessWidget {
  NewsListSkeleton({Key? key}) : super(key: key);
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
            height: 250,
          ),
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
        const SizedBox(
          height: 10,
        ),
        SkeletonParagraph(
          style: SkeletonParagraphStyle(
              lines: 8,
              spacing: 6,
              lineStyle: SkeletonLineStyle(
                randomLength: true,
                height: 15,
                borderRadius: BorderRadius.circular(6),
                minLength: MediaQuery.of(context).size.width / 2,
              )),
        ),
                const SizedBox(
          height: 15,
        ),
              SkeletonParagraph(
          style: SkeletonParagraphStyle(
              lines: 1,
              spacing: 6,
              lineStyle: SkeletonLineStyle(
                randomLength: true,
                height: 15,
                borderRadius: BorderRadius.circular(6),
                minLength: MediaQuery.of(context).size.width / 2,
              )),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

