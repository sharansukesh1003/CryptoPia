import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:btc_tracker/constants/constant_colors.dart';

ConstantColors constantColors = ConstantColors();

class WebViewer extends StatefulWidget {
  final String url;
  WebViewer({this.url});

  @override
  _WebViewerState createState() => _WebViewerState();
}

class _WebViewerState extends State<WebViewer> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: constantColors.secondaryColor,
        elevation: 3,
        title: Text(
          "Cryptopia.",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
              fontFamily: 'Poppins'),
        ),
      ),
      body: WebView(
        initialUrl: widget.url,
        onWebViewCreated: ((WebViewController webViewController) {
          _controller.complete(webViewController);
        }),
      ),
    );
  }
}
