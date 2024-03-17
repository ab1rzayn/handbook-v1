import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final double width;
  final double height;
  final double borderRadius;
  final Color color;
  final TextStyle textStyle;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
    this.width = 150, // Default to full width
    this.height = 50, // Provide a default height
    this.borderRadius = 11,
    this.color = Colors.blue,
    this.textStyle = const TextStyle(
      fontFamily: 'TiroBangla',
      fontSize: 18,
      color: Colors.white,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          primary: color,
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}