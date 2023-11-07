import 'package:flutter/material.dart';
import 'package:laundry_mama/global/routes.dart';

import 'package:laundry_mama/widgets/head4.dart';
import 'package:laundry_mama/widgets/head5.dart';
import 'package:laundry_mama/widgets/head6.dart';

class OfferProgressCard extends StatelessWidget {
  const OfferProgressCard({
    super.key,
    this.onPressed,
    required this.containerWidth,
    this.backgroundColor,
    required this.headline,
    required this.subHeader,
    this.offerImage = 'assets/images/clothes.png',
  });

  final String headline;
  final String subHeader;
  final double containerWidth;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final String offerImage;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        top: height * 0.019,
        right: width * 0.025,
        bottom: height * 0.019,
      ),
      child: Container(
        width: containerWidth,
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 84, 74, 74)),
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.012),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.012),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Head5(text: headline),
                    Head6(
                      text: subHeader,
                      fontWeight: FontWeight.w400,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, IN_PROGRESS),
                      child: Head4(
                        text: 'Check Now!',
                        color: Colors.amber[400],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: height * 0.15,
                width: width * 0.3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber[400],
                ),
                child: Image.asset(
                  offerImage,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
