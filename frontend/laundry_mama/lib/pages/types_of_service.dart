import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_mama/global/routes.dart';
import 'package:laundry_mama/widgets/head4.dart';
import 'package:laundry_mama/widgets/head5.dart';
import 'package:laundry_mama/widgets/round_button.dart';

class TypesOfService extends StatefulWidget {
  const TypesOfService({super.key});

  @override
  State<TypesOfService> createState() => _TypesOfServiceState();
}

class _TypesOfServiceState extends State<TypesOfService> {
  // bool isSelectd = false;
  // int _selectedIndex = -1;
  List<int> selectedItems = [];

  var services = [
    'Regular Wash',
    'Regular Wash + Iorning',
    'Dry cleaning',
    'Just Ironing'
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: height * 0.05,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.035),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(height * 0.05),
              const Head4(text: 'Let\'s proceed with your order')
                  .animate()
                  .fadeIn(duration: const Duration(milliseconds: 325))
                  .moveY(delay: const Duration(milliseconds: 30)),
              Gap(height * 0.02),
              const Head5(
                text: 'Costumise what service you wish to \nhave from us',
                fontWeight: FontWeight.w400,
              )
                  .animate()
                  .fadeIn(duration: const Duration(milliseconds: 325))
                  .moveY(delay: const Duration(milliseconds: 30)),
              Gap(height * 0.05),
              SizedBox(
                height: height * 0.4,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: services.length,
                  itemBuilder: (BuildContext context, int index) {
                    final isSelected = selectedItems.contains(index);

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        title: AutoSizeText(services[index]),
                        selectedColor: Colors.amber[900],
                        trailing: Icon(
                          isSelected ? Icons.check : Icons.circle_outlined,
                          color: Colors.green,
                        ),
                        selected: isSelected,
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedItems.remove(index);
                            } else {
                              selectedItems.add(index);
                            }
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              Gap(height * 0.001),
              Align(
                alignment: Alignment.center,
                child: RoundButton(
                  onTap: () => context.push(QUANTITY_PAGE),
                  icon: const Icon(
                    Icons.arrow_right_alt_rounded,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
