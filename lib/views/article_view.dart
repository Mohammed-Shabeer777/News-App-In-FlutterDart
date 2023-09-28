import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String newsUrl;
  ArticleView({required this.newsUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '                 Flash',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.newsUrl,
          onWebViewCreated: ((WebViewController webviewController) {
            _completer.complete(webviewController);
          }),
        ),
      ),
    );
  }
}
