import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.showBottomBar,
    required this.imgUrl,
    required this.author,
    required this.primaryText,
    required this.secondaryText,
    required this.sourceName,
  }) : super(key: key);

  final bool showBottomBar;
  final String imgUrl;
  final String author;
  final String primaryText;
  final String secondaryText;
  final String sourceName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: ClipRRect(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/A_blank_flag.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imgUrl.toString().isNotEmpty &&
                            imgUrl.toString().contains("https")
                        ? NetworkImage(imgUrl)
                        : const AssetImage('assets/images/A_blank_flag.png')
                            as ImageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.0),
                      image: DecorationImage(
                        image: imgUrl.toString().isNotEmpty &&
                                imgUrl.toString().contains("https")
                            ? NetworkImage(imgUrl)
                            : const AssetImage('assets/images/A_blank_flag.png')
                                as ImageProvider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: Tooltip(
                    message:primaryText,
                    child: Text(
                      primaryText,
                      maxLines: showBottomBar ? 2 : 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(7.0, 7.0, 7.0, 5.0),
                  child: Html(
                    data: secondaryText,
                    style: {
                      "*": Style(
                          color: Colors.grey.shade700,
                          fontSize: FontSize.large,
                          fontWeight: FontWeight.w500,
                          padding: EdgeInsets.zero,
                          textAlign: TextAlign.justify,
                          fontFamily: 'Montserrat')
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: !showBottomBar
                      ? Text(
                          "Swipe right to read more at ${sourceName}",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w100,
                              fontSize: 11.0),
                        )
                      : Tooltip(
                          message: "Short by ${author}",
                          child: Text(
                            "Short by ${author}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w100,
                                fontSize: 11.0),
                          ),
                        ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
