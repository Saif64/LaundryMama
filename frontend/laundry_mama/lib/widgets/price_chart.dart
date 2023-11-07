import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laundry_mama/dummy_data/dummy_data.dart';
import 'package:laundry_mama/widgets/head5.dart';
import 'package:laundry_mama/widgets/head6.dart';

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
          height: height * 0.28,
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
                  text: 'Our Featured Services',
                  color: Colors.white,
                ),
                Gap(height * 0.018),
                Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.01),
                          child: Head6(
                            text: priceChart[index],
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ));
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
            size: MediaQuery.of(context).size.width * 0.12,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
