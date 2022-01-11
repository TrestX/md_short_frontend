import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:skeletons/skeletons.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchListSkeleton extends StatelessWidget {
  SearchListSkeleton({Key? key}) : super(key: key);
  final Completer<WebViewController>? _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (bContext, i) {
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonParagraph(
                          style: SkeletonParagraphStyle(
                              lines: 1,
                              spacing: 6,
                              lineStyle: SkeletonLineStyle(
                                width: 80,
                                height: 10,
                                borderRadius: BorderRadius.circular(6),
                              )),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        SkeletonParagraph(
                          style: SkeletonParagraphStyle(
                              lines: 2,
                              spacing: 6,
                              lineStyle: SkeletonLineStyle(
                                width: double.infinity,
                                height: 10,
                                borderRadius: BorderRadius.circular(6),
                              )),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        SkeletonParagraph(
                          style: SkeletonParagraphStyle(
                              lines: 1,
                              spacing: 6,
                              lineStyle: SkeletonLineStyle(
                                width: 50,
                                height: 10,
                                borderRadius: BorderRadius.circular(6),
                              )),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          width: double.infinity, height: 80),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.black,
                height: 6,
              ),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        );
      },
    );
  }
}
