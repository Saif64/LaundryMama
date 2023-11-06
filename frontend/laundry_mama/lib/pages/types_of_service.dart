import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:laundry_mama/widgets/head4.dart';
import 'package:laundry_mama/widgets/head5.dart';

import 'package:laundry_mama/widgets/medium_button.dart';

class TypesOfService extends StatefulWidget {
  const TypesOfService({super.key});

  @override
  State<TypesOfService> createState() => _TypesOfServiceState();
}

class _TypesOfServiceState extends State<TypesOfService> {
  bool isSelectd = false;
  int _selectedIndex = -1;

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
          padding: EdgeInsets.symmetric(horizontal: width * 0.065),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(height * 0.05),
              const Head4(text: 'Let\'s proceed with your order'),
              Gap(height * 0.02),
              const Head5(
                text: 'Costumise select how you wish to \ndo your laundry',
                fontWeight: FontWeight.w400,
              ),
              Gap(height * 0.05),
              SizedBox(
                height: height * 0.4,
                child: ListView.builder(
                  itemCount: services.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: ListTile(
                          title: AutoSizeText(services[index]),
                          selectedColor: Colors.amber[900],
                          trailing: Icon(
                            index == _selectedIndex
                                ? Icons.check
                                : Icons.circle_outlined,
                            color: Colors.green,
                          ),
                          selected: index == _selectedIndex,
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Gap(height * 0.001),
              MediumButton(
                onTap: () {},
                text: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
