import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Head6 extends StatelessWidget {
  const Head6({
    super.key,
    required this.text,
    this.color,
    this.fontWeight = FontWeight.w300,
    this.decoration,
  });
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(
        fontSize: 13,
        color: color,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
  }
}
