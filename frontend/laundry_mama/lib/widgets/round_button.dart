import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Function()? onTap;
  final Icon icon;
  final Color? color;
  final double? fontsize;

  const RoundButton(
      {super.key,
      required this.onTap,
      required this.icon,
      this.color = const Color.fromARGB(255, 92, 157, 94),
      this.fontsize = 16});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.018),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
