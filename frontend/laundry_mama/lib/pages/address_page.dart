import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laundry_mama/widgets/back_button.dart';
import 'package:laundry_mama/widgets/head4.dart';
import 'package:laundry_mama/widgets/locations.dart';
import 'package:laundry_mama/widgets/long_button.dart';

import '../widgets/head5.dart';

class AdressPage extends StatefulWidget {
  const AdressPage({super.key});

  @override
  State<AdressPage> createState() => _AdressPageState();
}

class _AdressPageState extends State<AdressPage> {
  openAddNewAdressModal() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;

        return Container(
          height: 200,
          color: const Color.fromARGB(255, 230, 228, 228),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Gap(height * 0.003),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black,
                  ),
                  width: 50,
                  height: 5,
                ),
                Gap(height * 0.02),
                const Head5(text: 'Add new address'),
                Gap(height * 0.02),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Location',
          style: TextStyle(color: Theme.of(context).shadowColor),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        toolbarHeight: height * 0.08,
        automaticallyImplyLeading: false,
        leading: const BackBtn(),
      ),
      body: Column(
        children: [
          Gap(height * 0.045),
          LongButton(
            onTap: openAddNewAdressModal,
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
