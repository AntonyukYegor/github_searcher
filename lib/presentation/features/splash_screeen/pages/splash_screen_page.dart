import 'package:flutter/material.dart';
import 'package:github_searcher/components/constants.dart';
import 'package:github_searcher/presentation/features/search/pages/search_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  static const String navigationPath = '/';

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void didChangeDependencies() {
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          Navigator.of(context).pushNamedAndRemoveUntil(
              SearchPage.navigationPath, (Route<dynamic> route) => false),
        });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(AppConstants.splashScreenTitle),
      ),
    );
  }
}
