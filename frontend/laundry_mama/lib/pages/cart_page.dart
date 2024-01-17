import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_mama/global/routes.dart';

import 'package:laundry_mama/widgets/head6.dart';
import 'package:provider/provider.dart';

import '../dummy_data/dummy_data.dart';
import '../providers/cart_model.dart';
import '../widgets/head4.dart';
import '../widgets/head5.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String selectedChip = '';
  List<String> chipsOptions = ['Cash On Delivery', 'Bkash'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // final Map<String, dynamic> args =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // final time = args['time'];
    // final date = args['date'];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: height * 0.032,
        title: const Head5(text: "Your Orders"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.035),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(height * 0.02),
              const Head4(text: 'Your Digital Recipt')
                  .animate()
                  .fadeIn(duration: const Duration(milliseconds: 325))
                  .moveX(delay: const Duration(milliseconds: 30)),
              Gap(height * 0.02),
              const Head5(
                text: 'Your pickup request has been received!',
                fontWeight: FontWeight.w400,
              )
                  .animate()
                  .fadeIn(duration: const Duration(milliseconds: 325))
                  .moveX(delay: const Duration(milliseconds: 30)),
              Gap(height * 0.03),
              SizedBox(
                height: height * 0.5,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.008),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        title: AutoSizeText(
                          items[index]["item"].toString(),
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: AutoSizeText(
                          items[index]["price"].toString(),
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            items[index]["url"].toString(),
                          ),
                        ),
                        trailing: Head5(
                          text: items[index]['quantity'].toString(),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Gap(height * 0.01),
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
                  Gap(height * 0.02),
                  SizedBox(
                    height: height * 0.06,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: chipsOptions.length - 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: chipsOptions.map((String option) {
                              return ChoiceChip(
                                label: Text(option),
                                selected: selectedChip == option,
                                onSelected: (bool selected) {
                                  setState(() {
                                    selectedChip = selected ? option : '';
                                  });
                                  print(selectedChip);
                                },
                              );
                            }).toList());
                      },
                    ),
                  ),
                  Gap(height * 0.015),
                  SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer<CartProvider>(builder: (context, cart, child) {
                          return Head5(
                              text:
                                  'Total Price: ৳${(cart.totalQuantity * 15) + deliveryFee}');
                        })
                            .animate()
                            .fadeIn(duration: const Duration(milliseconds: 325))
                            .moveY(delay: const Duration(milliseconds: 30)),
                        ElevatedButton(
                          onPressed: () => context.go(IN_PROGRESS),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 60, 4, 157),
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.01),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.shopping_basket_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Gap(width * 0.02),
                                AutoSizeText(
                                  'Checkout',
                                  style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        )
                            .animate()
                            .fadeIn(duration: const Duration(milliseconds: 325))
                            .moveX(delay: const Duration(milliseconds: 30)),
                      ],
                    ),
                  ),
                  Gap(height * 0.07),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
