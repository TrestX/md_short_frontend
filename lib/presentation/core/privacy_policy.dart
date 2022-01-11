import 'dart:async';

import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatelessWidget {
  PrivacyPolicy({Key? key}) : super(key: key);
  final Completer<WebViewController>? controller =
      Completer<WebViewController>();
  final String url =
      "https://docs.google.com/document/d/1ERASaBRwcvKk0TO6FjfbLHGR-ScoKdR2/edit?usp=sharing&ouid=107412855873497106356&rtpof=true&sd=true";
  @override
  Widget build(BuildContext context) {
    var height2 = MediaQuery.of(context).size.height;
    var width2 = MediaQuery.of(context).size.width > 700
        ? MediaQuery.of(context).size.width * 0.5
        : MediaQuery.of(context).size.width;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF015397),
            ),
            onPressed: () {
              if (kIsWeb) {
                context.router.popAndPush(HomePageRoute());
              } else {
                context.router.popAndPush(CustomBottomNavigationBarRoute());
              }
            },
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: kIsWeb
                ? Html(
                    data:
                        "<div><iframe src=\"https://docs.google.com/document/d/e/2PACX-1vSaOwx97sJ9ffVqGfay0wMmAVMx50PbLgvl4q2DmOleWr8zR0ZxBMpgqq5aAnoYfA/pub?embedded=true\"  height=\"$height2\" width=\"$width2\"></iframe></div>",
                    style: {
                      'html': Style(textAlign: TextAlign.center),
                    },
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    child: WebView(
                      initialUrl: Uri.dataFromString(
                              '<html><body><div><iframe src=\"https://docs.google.com/document/d/e/2PACX-1vSaOwx97sJ9ffVqGfay0wMmAVMx50PbLgvl4q2DmOleWr8zR0ZxBMpgqq5aAnoYfA/pub?embedded=true\"  height=\"$height2\" width=\"$width2\"></iframe></div></body></html>',
                              mimeType: 'text/html')
                          .toString(),
                      javascriptMode: JavascriptMode.unrestricted,
                    )),
          ),
        ),
      ),
    );
  }
}
