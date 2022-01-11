import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:skeletons/skeletons.dart';

class CategoriesSkeleton extends StatelessWidget {
  const CategoriesSkeleton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (_, i) {
            return SizedBox(
              width: 120,
              child: Container(
                margin: const EdgeInsets.only(right: 13),
                padding: EdgeInsets.zero,
                child: Column(children: [
                  const Center(
                    child: SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          shape: BoxShape.circle, width: 80, height: 80),
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
                          minLength: MediaQuery.of(context).size.width / 2,
                        )),
                  ),
                ]),
              ),
            );
          }),
    );
  }
}
