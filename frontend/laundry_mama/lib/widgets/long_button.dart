import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const LongButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.055,
            vertical: MediaQuery.of(context).size.height * 0.025),
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.055),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 92, 157, 94),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: AutoSizeText(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
