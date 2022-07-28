import 'package:flutter/material.dart';
import 'package:github_searcher/presentation/common/widget/icon_checked_button.dart';

class FavoriteCheckedTransparentButton extends StatelessWidget {
  const FavoriteCheckedTransparentButton({
    Key? key,
    required this.initialChecked,
    required this.alignment,
    required this.onPressed,
  }) : super(key: key);

  final bool initialChecked;
  final Alignment alignment;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconCheckedButton(
      onPressed: onPressed,
      initialChecked: initialChecked,
      foregroundIcon: Icons.star_outline,
      backgroundIcon: Icons.star,
      backgroundColorUnchecked: Colors.transparent,
      backgroundColorChecked: Colors.yellow,
      padding: const EdgeInsets.all(16),
      alignment: alignment,
    );
  }
}
