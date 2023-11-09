import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laundry_mama/dummy_data/dummy_data.dart';
import 'package:laundry_mama/global/routes.dart';

import 'package:laundry_mama/widgets/box_hor.dart';

import 'package:laundry_mama/widgets/head6.dart';
import 'package:laundry_mama/widgets/offer_progress_card.dart';
import 'package:provider/provider.dart';

import '../providers/cart_model.dart';
import '../widgets/head4.dart';
import '../widgets/featured_service.dart';

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
                'Hi, saif,',
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
              const Head4(
                text: 'Offers & more',
              ),
              SizedBox(
                height: height * 0.2,
                child: ListView.builder(
                  itemCount: offerNMore.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return OfferProgressCard(
                      containerWidth: width * 0.78,
                      headline: offerNMore[index]["headline"].toString(),
                      subHeader: offerNMore[index]['subHeader'].toString(),
                      backgroundColor: const Color.fromARGB(255, 0, 129, 189),
                      offerImage: offerImage[index],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Head4(
                    text: 'Featured Services',
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Head6(
                      text: 'View All',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
              Gap(height * 0.018),
              SizedBox(
                height: height * 0.4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredService.length,
                  itemBuilder: (BuildContext context, int index) {
                    var service = featuredService[index];
                    return FeaturedServiceCard(
                      height: height * 0.2,
                      width: width * 0.6,
                      imageUrl: service['imageUrl'].toString(),
                      offerHeading: service['heading'].toString(),
                      offerSubHeading: service['subHeading'].toString(),
                    );
                  },
                ),
              ),
              Gap(height * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  AppBar homepageAppbar(BuildContext context, double width) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return AppBar(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
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
          onTap: () => Navigator.pushNamed(context, CART_PAGE),
          child: Padding(
            padding: EdgeInsets.all(width * 0.015),
            child: Stack(children: [
              CircleAvatar(
                maxRadius: width * 0.05,
                minRadius: width * 0.03,
                backgroundColor: Colors.red,
                child: const Icon(
                  Icons.shopping_basket_outlined,
                  color: Colors.white,
                ),
              ),
              Positioned(
                left: 0,
                bottom: -14,
                child: Container(
                  width: width * 0.05,
                  height: height * 0.05,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(230, 218, 198, 198),
                  ),
                  child: Center(
                    child:
                        Consumer<CartProvider>(builder: (context, cart, child) {
                      return AutoSizeText(
                        cart.totalQuantity.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      );
                    }),
                  ),
                ),
              )
            ]),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, PROFILE_PAGE),
          child: Padding(
            padding: EdgeInsets.all(width * 0.015),
            child: Hero(
              tag: 'profile-pic',
              child: CircleAvatar(
                maxRadius: width * 0.05,
                minRadius: width * 0.03,
                backgroundImage:
                    const AssetImage('assets/images/professional image.jpeg'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
