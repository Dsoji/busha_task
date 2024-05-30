import 'package:flutter/material.dart';

class FullButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color bgColor;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final VoidCallback? longPressed;
  final double fontSize;

  const FullButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.color,
    this.longPressed,
    required this.bgColor,
    this.fontSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      onLongPress: longPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: bgColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
