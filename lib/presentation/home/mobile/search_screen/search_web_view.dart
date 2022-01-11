import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchWebView extends StatelessWidget {
  const SearchWebView({Key? key, required this.controller, required this.url})
      : super(key: key);
  final Completer<WebViewController>? controller;
  final String url;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF015397),
            ),
            onPressed: () => context.router.pop(),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: WebView(
            initialUrl: url,
            key: key,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              controller!.complete(webViewController);
            },
            gestureNavigationEnabled: true,
            onPageFinished: (initialUrl) {},
          ),
        ),
      ),
    );
  }
}
