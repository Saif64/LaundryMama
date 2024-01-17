import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_mama/widgets/head4.dart';
import 'package:laundry_mama/widgets/head5.dart';
import 'package:laundry_mama/widgets/offer_progress_card.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../dummy_data/dummy_data.dart';
import '../global/routes.dart';
import '../providers/cart_model.dart';
import '../widgets/head6.dart';

class InProgress extends StatefulWidget {
  const InProgress({super.key});

  @override
  State<InProgress> createState() => _InProgressState();
}

class _InProgressState extends State<InProgress> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: height * 0.05,
        automaticallyImplyLeading: false,
        title: const Head4(
          text: 'Order In Progress',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
            // Navigator.pushReplacementNamed(context, HOMEPAGE);
            context.go(HOMEPAGE);
          },
          icon: Icon(
            Icons.home_outlined,
            size: height * 0.038,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.035),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RepaintBoundary(
                  child: Lottie.asset(
                    'assets/animations/in_progress.json',
                    reverse: true,
                    fit: BoxFit.contain,
                    width: width * 0.8,
                    frameRate: FrameRate.max,
                  ),
                ),
                Gap(height * 0.03),
                const Head4(text: 'Your Service is being ready'),
                Gap(height * 0.03),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Head6(
                            text: 'Total Item:', fontWeight: FontWeight.w400),
                        Consumer<CartProvider>(builder: (context, cart, child) {
                          return Head6(
                            text: 'X ${cart.totalQuantity}',
                            fontWeight: FontWeight.w400,
                          );
                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Head6(
                            text: 'SubTotal', fontWeight: FontWeight.w400),
                        Consumer<CartProvider>(builder: (context, cart, child) {
                          return Head6(
                            text: '৳ ${cart.totalQuantity * 15}',
                            fontWeight: FontWeight.w400,
                          );
                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Head6(
                            text: 'Delivery Fee:', fontWeight: FontWeight.w400),
                        Head6(
                          text: '৳ $deliveryFee',
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Gap(height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Head5(
                            text: 'Payment Method:',
                            fontWeight: FontWeight.w600),
                        Head6(
                          text: 'Cash On Delivery',
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Head5(
                            text: 'TO PAY', fontWeight: FontWeight.w600),
                        Consumer<CartProvider>(builder: (context, cart, child) {
                          return Head6(
                            text:
                                'Total Price: ৳${(cart.totalQuantity * 15) + deliveryFee}',
                            fontWeight: FontWeight.w800,
                          );
                        }),
                      ],
                    ),
                  ],
                ),
                Gap(height * 0.03),
                const Head4(
                  text: 'Discounted Services',
                )
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 325))
                    .moveY(delay: const Duration(milliseconds: 30)),
                SizedBox(
                  height: height * 0.2,
                  child: ListView.builder(
                    itemCount: offerNMore.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return OfferProgressCard(
                        containerWidth: width * 0.78,
                        headline: '30TK OFF',
                        subHeader: 'USE KAPOR30 TO \nGET 30 TAKA DISCOUNT',
                        backgroundColor: const Color.fromARGB(255, 0, 129, 189),
                        offerImage: offerImage[index],
                      )
                          .animate()
                          .fadeIn(duration: const Duration(milliseconds: 325))
                          .moveY(delay: const Duration(milliseconds: 30));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
