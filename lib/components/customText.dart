import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final EdgeInsets padding;

  const CustomText(
      this.text, {
        this.style = const TextStyle(),
        this.textAlign = TextAlign.center,
        this.padding = const EdgeInsets.symmetric(vertical: 20),
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}
