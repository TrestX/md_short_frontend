import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsWebDisplay extends StatelessWidget {
  final String url,
      id,
      imgUrl,
      primaryText,
      secondaryText,
      sourceName,
      author,
      publishedAt;

  // ignore: use_key_in_widget_constructors
  const NewsWebDisplay(
      {Key? key,
      required this.id,
      required this.url,
      required this.imgUrl,
      required this.primaryText,
      required this.secondaryText,
      required this.sourceName,
      required this.author,
      required this.publishedAt});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: imgUrl != ""
          ? MediaQuery.of(context).size.width > 768
              ? Container(
                  margin: const EdgeInsets.only(bottom: 13),
                  height: 300,
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: ClipRRect(
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/A_blank_flag.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(imgUrl),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10.0, sigmaY: 10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.0),
                                        image: DecorationImage(
                                          image: NetworkImage(imgUrl),
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
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16.0, 16.0, 16.0, 8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 10,
                                          child: Text(
                                            primaryText,
                                            textAlign: TextAlign.justify,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18.0),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: IconButton(
                                            onPressed: () {
                                              final RenderBox box =
                                                  context.findRenderObject()
                                                      as RenderBox;

                                              Share.share(
                                                  '$primaryText (www.mdshorts.com/home/$id) via MDShorts',
                                                  subject:
                                                      '$primaryText (www.mdshorts.com/home/$id) via MDShorts',
                                                  sharePositionOrigin:
                                                      box.localToGlobal(
                                                              Offset.zero) &
                                                          box.size);
                                            },
                                            icon: const Icon(Icons.share),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      "short by $author/$publishedAt",
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Html(
                                      data: secondaryText,
                                      style: {
                                        "*": Style(
                                            color: Colors.grey.shade700,
                                            maxLines: 4,
                                            fontSize: FontSize.medium,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Montserrat')
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      onPressed: _launchURL,
                                      child: Text(
                                        "Read more at $sourceName",
                                        style: TextStyle(
                                            color: Colors.grey.shade800,
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
                      ),
                    ),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(bottom: 25, top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: ClipRRect(
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/A_blank_flag.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(imgUrl),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10.0, sigmaY: 10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.0),
                                        image: DecorationImage(
                                          image: NetworkImage(imgUrl),
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
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16.0, 16.0, 16.0, 8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 10,
                                          child: Text(
                                            primaryText,
                                            textAlign: TextAlign.justify,
                                            maxLines: 3,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18.0),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: IconButton(
                                            onPressed: () {
                                              final RenderBox box =
                                                  context.findRenderObject()
                                                      as RenderBox;

                                              Share.share(
                                                  '$primaryText (www.mdshorts.com/home/$id) via MDShorts',
                                                  subject:
                                                      '$primaryText (www.mdshorts.com/home/$id) via MDShorts',
                                                  sharePositionOrigin:
                                                      box.localToGlobal(
                                                              Offset.zero) &
                                                          box.size);
                                            },
                                            icon: const Icon(Icons.share),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      "short by $author/$publishedAt",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontWeight: FontWeight.w100,
                                          fontSize: 11.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Html(
                                      data: secondaryText,
                                      style: {
                                        "*": Style(
                                            color: Colors.grey.shade700,
                                            maxLines: 3,
                                            fontSize: FontSize.medium,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Montserrat')
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      onPressed: _launchURL,
                                      child: Text(
                                        "Read more at $sourceName",
                                        style: TextStyle(
                                            color: Colors.grey.shade800,
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
                      ),
                    ),
                  ),
                )
          : const SizedBox(),
    );
  }

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
