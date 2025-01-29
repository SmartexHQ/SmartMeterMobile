// import 'package:flutter/material.dart';
//
// import 'custom_scaffold_widget.dart';
// import 'custom_text_widget.dart';
//
// class WebviewScreen extends StatefulWidget {
//   const WebviewScreen(this.url, {Key? key, this.title = "InApp Webview"})
//       : super(key: key);
//
//   final String url;
//   final String title;
//
//   @override
//   State<WebviewScreen> createState() => _WebviewScreenState();
// }
//
// class _WebviewScreenState extends State<WebviewScreen> {
//   late WebViewController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {},
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             // if (request.url.startsWith('https://www.youtube.com/')) {
//             //   return NavigationDecision.prevent;
//             // }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(widget.url));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ScaffoldWidget(
//       usePadding: false,
//       useSingleScroll: false,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: kcWhite),
//         title: TextWidget(widget.title, textColor: kcWhite),
//         backgroundColor: kcPrimaryColor,
//       ),
//       body: WebViewWidget(controller: _controller),
//     );
//   }
// }
