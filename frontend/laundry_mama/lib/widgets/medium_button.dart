import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MediumButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color? color;
  final double? fontsize;

  const MediumButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.color = const Color.fromARGB(255, 92, 157, 94),
      this.fontsize = 16});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02),
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.28),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: AutoSizeText(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: fontsize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
