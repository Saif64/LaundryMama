import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laundry_mama/widgets/head5.dart';

class PriceChart extends StatelessWidget {
  const PriceChart({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: height * 0.25,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 41, 47, 57),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.03, vertical: height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Head5(
                  text: 'Regular Iron + Wash',
                  color: Colors.white,
                ),
                Gap(height * 0.018),
                Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.01),
                        child: const AutoSizeText(
                          'Upto weight 4.5kg ➜ 220BDT - 330BDT',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Icon(
            Icons.shopping_basket_outlined,
            size: MediaQuery.of(context).size.width * 0.15,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
