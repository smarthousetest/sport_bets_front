import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatelessWidget {
  // final String title;
  // final String selectedUrl;

  WebViewController? controller;

  MyWebView(
      {
      // required this.title,
      // required this.selectedUrl,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: WebViewWidget(
          controller: controller!,
        ));
  }
}
