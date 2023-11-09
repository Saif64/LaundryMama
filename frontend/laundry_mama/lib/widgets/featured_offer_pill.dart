import 'package:flutter/material.dart';
import 'package:laundry_mama/widgets/head6.dart';

class FeaturedOfferPill extends StatelessWidget {
  const FeaturedOfferPill({
    super.key,
    required this.text,
    this.color = const Color.fromARGB(255, 234, 18, 3),
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: color,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Head6(
          text: text,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
