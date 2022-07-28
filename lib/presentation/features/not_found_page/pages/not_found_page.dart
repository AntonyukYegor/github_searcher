import 'package:flutter/material.dart';
import 'package:github_searcher/components/constants.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppConstants.notFoundPage),
    );
  }
}
