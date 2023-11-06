import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_mama/dummy_data/dummy_data.dart';
import 'package:laundry_mama/global/routes.dart';
import 'package:laundry_mama/widgets/round_button.dart';

import '../widgets/head4.dart';
import '../widgets/head5.dart';

class QuantityPage extends StatefulWidget {
  const QuantityPage({super.key});

  @override
  State<QuantityPage> createState() => _QuantityPageState();
}

class _QuantityPageState extends State<QuantityPage> {
  int totalQuantity = 0;
  var selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    calculateTotalQuantity();
  }

  void calculateTotalQuantity() {
    int total = 0;
    for (var item in items) {
      total += (item['quantity'] as int);
    }
    totalQuantity = total;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: height * 0.032,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.065),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(height * 0.02),
              const Head4(text: 'Select the items & quantity'),
              Gap(height * 0.02),
              const Head5(
                text: 'Costumise what service you wish to \nhave from us',
                fontWeight: FontWeight.w400,
              ),
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
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                if (items[index]['quantity'] > 0) {
                                  setState(() {
                                    items[index]['quantity']--;
                                    calculateTotalQuantity();
                                  });
                                }
                              },
                            ),
                            Text(items[index]['quantity'].toString()),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  items[index]['quantity']++;
                                  calculateTotalQuantity();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Head5(text: 'Delivery Fee:', fontWeight: FontWeight.w400),
                      Head5(
                        text: 'BDT 30',
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Head4(text: 'Total price:'),
                      Head4(text: 'BDT 240')
                    ],
                  )
                ],
              ),
              Gap(height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      RoundButton(
                        onTap: () =>
                            Navigator.pushNamed(context, TIME_SLOT_PAGE),
                        icon: const Icon(
                          Icons.date_range_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Gap(height * 0.007),
                      const Head5(
                        text: 'PICK TIME SLOT',
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      RoundButton(
                        onTap: () {},
                        icon: const Icon(
                          Icons.add_shopping_cart_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Gap(height * 0.007),
                      const Head5(
                        text: 'ADD TO CART',
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                ],
              ),
              Gap(height * 0.07),
            ],
          ),
        ),
      ),
    );
  }
}
