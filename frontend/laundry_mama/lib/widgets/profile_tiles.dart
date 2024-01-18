import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTiles extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const ProfileTiles({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      trailing: const Icon(
        Icons.arrow_right_rounded,
      ),
      title: AutoSizeText(
        title,
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.w300,
          fontSize: 20,
        ),
      ),
    )
        .animate()
        .fadeIn(duration: const Duration(milliseconds: 325))
        .moveX(delay: const Duration(milliseconds: 30));
  }
}
