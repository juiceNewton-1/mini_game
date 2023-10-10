import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color firstColor;
  final Color secondColor;
  final Color? fontColor;
  final VoidCallback? onPressed;
  const AppButton({
    super.key,
    required this.text,
    required this.firstColor,
    required this.secondColor,
    this.onPressed,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: 235,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              firstColor,
              secondColor,
            ],
          ),
        ),
        child: Text(
          text.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: fontColor),
        ),
      ),
    );
  }
}
