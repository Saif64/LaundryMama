import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Head5 extends StatelessWidget {
  const Head5({
    super.key,
    required this.text,
    this.color,
  });
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(
        fontSize: 18,
        color: color,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
