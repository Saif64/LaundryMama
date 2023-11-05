import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laundry_mama/widgets/locations.dart';
import 'package:laundry_mama/widgets/long_button.dart';

class AdressPage extends StatefulWidget {
  const AdressPage({super.key});

  @override
  State<AdressPage> createState() => _AdressPageState();
}

class _AdressPageState extends State<AdressPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Location',
          style: TextStyle(
            color: Colors.amber[900],
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        toolbarHeight: height * 0.08,
      ),
      body: Column(
        children: [
          Gap(height * 0.045),
          LongButton(
            onTap: () {},
            text: 'Add new Address',
          ),
          Gap(height * 0.065),
          const Divider(thickness: 2),
          Gap(height * 0.065),
          const Hero(
            tag: 'address',
            child: Material(
              type: MaterialType.transparency,
              child: AutoSizeText(
                'Saved Locations',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Gap(height * 0.03),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return const LocationTiles();
              },
            ),
          ),
        ],
      ),
    );
  }
}
