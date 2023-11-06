import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laundry_mama/global/routes.dart';
import 'package:laundry_mama/widgets/box_hor.dart';
import 'package:laundry_mama/widgets/long_button.dart';

import '../widgets/head4.dart';
import '../widgets/price_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void toSignupPage() {
    Navigator.pushNamed(context, SIGNUP_PAGE);
  }

  void toAdressPage() {
    Navigator.pushNamed(context, ADDRESS_PAGE);
  }

  String initialLocation = 'Dhanmondi 27, Dhaka-1209';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: homepageAppbar(context, width),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.065),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(height * 0.025),
              const AutoSizeText(
                'Hi, saif',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Gap(height * 0.015),
              const Head4(text: 'Get your clothes done in \n3 simple steps'),
              Gap(height * 0.012),
              SizedBox(
                height: height * 0.18,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      HorizBox(
                        buttonText: 'Add Clothes',
                        descriptionText:
                            'Start your \nlaundry by adding basket',
                        isCurrent: true,
                        containerWidth: width * 0.36,
                        onPressed: () =>
                            Navigator.pushNamed(context, NEW_ORDER),
                      ),
                      HorizBox(
                        buttonText: 'Reivew',
                        descriptionText:
                            'Laundry in process... \nthanks for waiting',
                        isCurrent: false,
                        containerWidth: width * 0.42,
                      ),
                      HorizBox(
                        buttonText: 'Reivew',
                        descriptionText: 'Out for delivery ',
                        isCurrent: false,
                        containerWidth: width * 0.42,
                      ),
                    ],
                  ),
                ),
              ),
              Gap(height * 0.018),
              const Head4(
                text: 'Price Chart',
              ),
              Gap(height * 0.018),
              PriceChart(height: height, width: width),
              Gap(height * 0.03),
              LongButton(
                onTap: () => Navigator.pushNamed(context, NEW_ORDER),
                text: 'Add clothes into your basket ',
                color: const Color.fromARGB(255, 63, 34, 113),
                fontsize: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar homepageAppbar(BuildContext context, double width) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: false,
      title: TextButton(
        onPressed: toAdressPage,
        child: Row(children: [
          Icon(
            Icons.location_on_outlined,
            color: Colors.amber[900],
          ),
          Hero(
            tag: 'address',
            child: Material(
              type: MaterialType.transparency,
              child: AutoSizeText(
                initialLocation,
                style: TextStyle(
                  color: Colors.amber[900],
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ]),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(width * 0.015),
            child: CircleAvatar(
              maxRadius: width * 0.05,
              minRadius: width * 0.03,
              backgroundColor: Colors.red,
              child: const Icon(
                Icons.shopping_bag_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: toSignupPage,
          child: Padding(
            padding: EdgeInsets.all(width * 0.015),
            child: CircleAvatar(
              maxRadius: width * 0.05,
              minRadius: width * 0.03,
              backgroundImage:
                  const AssetImage('assets/images/professional image.jpeg'),
            ),
          ),
        ),
      ],
    );
  }
}
