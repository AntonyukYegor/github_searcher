import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsPageArgument {
  final String url;

  DetailsPageArgument({required this.url});
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({required this.model, Key? key}) : super(key: key);

  static const String navigationPath = '/detailsPage';

  final DetailsPageArgument model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: model.url,
        ),
      ),
    );
  }
}
