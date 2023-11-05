import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Head4 extends StatelessWidget {
  const Head4({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
