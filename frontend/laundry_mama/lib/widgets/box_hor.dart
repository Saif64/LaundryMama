import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HorizBox extends StatelessWidget {
  const HorizBox({
    super.key,
    required this.buttonText,
    required this.descriptionText,
    required this.isCurrent,
    required this.containerWidth,
    this.onPressed,
  });

  final String buttonText;
  final String descriptionText;
  final bool isCurrent;
  final double containerWidth;
  final void Function()? onPressed;

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
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.015, vertical: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isCurrent
                      ? Color.fromARGB(255, 32, 123, 148)
                      : Color.fromARGB(255, 196, 192, 192),
                  enableFeedback: true,
                  elevation: 0,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(45)),
                ),
                onPressed: onPressed,
                child: AutoSizeText(
                  buttonText,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: isCurrent ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Gap(7),
              AutoSizeText(
                descriptionText,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
