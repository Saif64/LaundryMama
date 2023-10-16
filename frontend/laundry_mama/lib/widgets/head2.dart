import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Head2 extends StatelessWidget {
  const Head2(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontWeight});
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
