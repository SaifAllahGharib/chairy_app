import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentUrlWebView extends StatefulWidget {
  static const String id = "/payment_url";
  final String url;

  const PaymentUrlWebView({super.key, required this.url});

  @override
  State<PaymentUrlWebView> createState() => _PaymentUrlWebViewState();
}

class _PaymentUrlWebViewState extends State<PaymentUrlWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    _initWebView();
    
    super.initState();
  }

  void _initWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            final url = request.url;

            if (url.contains("success")) {
              GoRouter.of(context).pop("success");
              return NavigationDecision.prevent;
            } else if (url.contains("failure") || url.contains("cancel")) {
              GoRouter.of(context).pop("failure");
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller),
    );
  }
}
