import 'package:flutter/material.dart';

class IconCheckedButton extends StatelessWidget {
  const IconCheckedButton({
    required this.onPressed,
    required this.backgroundIcon,
    required this.foregroundIcon,
    required this.backgroundColorChecked,
    required this.backgroundColorUnchecked,
    required this.initialChecked,
    required this.padding,
    required this.alignment,
    Key? key,
  }) : super(key: key);

  final IconData backgroundIcon;
  final IconData foregroundIcon;

  final Color backgroundColorChecked;
  final Color backgroundColorUnchecked;
  final bool initialChecked;
  final EdgeInsets padding;
  final Alignment alignment;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        color: Colors.transparent,
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.zero, // widget.padding,
            child: Stack(
              alignment: alignment,
              children: [
                Icon(
                  backgroundIcon,
                  color: initialChecked
                      ? backgroundColorChecked
                      : backgroundColorUnchecked,
                ),
                Icon(
                  foregroundIcon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
