import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:skeletons/skeletons.dart';

class BMListsSkeleton extends StatelessWidget {
  const BMListsSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.78,
      child: ListView(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.87,
                  height: 38,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      isDense: true, // Added this
                      contentPadding: EdgeInsets.all(2),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search for news",
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.67,
            child: GridView.builder(
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.67),
              itemBuilder: (BuildContext context, int i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // add this
                  children: <Widget>[
                    const SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          width: double.infinity, height: 120),
                    ),
                    ListTile(
                      title: SkeletonParagraph(
                        style: SkeletonParagraphStyle(
                            lines: 3,
                            spacing: 6,
                            lineStyle: SkeletonLineStyle(
                              width: double.infinity,
                              height: 10,
                              borderRadius: BorderRadius.circular(6),
                            )),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 36,
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
