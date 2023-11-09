import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laundry_mama/global/routes.dart';
import 'package:laundry_mama/widgets/featured_offer_pill.dart';

class FeaturedServiceCard extends StatelessWidget {
  const FeaturedServiceCard({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    this.containerColor = Colors.transparent,
    required this.offerHeading,
    required this.offerSubHeading,
  });

  final String imageUrl;
  final String offerHeading;
  final String offerSubHeading;
  final double height;
  final double width;
  final Color? containerColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, NEW_ORDER),
            child: Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Stack(
                children: [
                  Container(
                    width: width * 2.5,
                    height: height * 2.5,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        color: containerColor),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(height * 0.045),
                      FeaturedOfferPill(text: offerHeading),
                      Gap(height * 0.035),
                      FeaturedOfferPill(text: offerSubHeading),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
