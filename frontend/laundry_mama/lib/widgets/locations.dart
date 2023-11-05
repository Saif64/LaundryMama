import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LocationTiles extends StatelessWidget {
  const LocationTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.008),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.share_location_rounded,
            size: MediaQuery.of(context).size.width * 0.07,
          ),
          Gap(MediaQuery.of(context).size.width * 0.04),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Gap(3),
              AutoSizeText('Dhanmondi 27, Dhaka-1209'),
              Gap(6),
            ],
          )
        ],
      ),
    );
  }
}
