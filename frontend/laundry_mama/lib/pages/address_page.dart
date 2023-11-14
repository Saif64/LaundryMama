import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laundry_mama/dummy_data/dummy_data.dart';
import 'package:laundry_mama/widgets/head5.dart';
import 'package:laundry_mama/widgets/head6.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: const CircleBorder(),
        elevation: 5,
        onPressed: () {},
        child: const Icon(
          Icons.add_location_alt_outlined,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Hero(
          tag: 'address',
          child: Material(
            type: MaterialType.transparency,
            child: AutoSizeText(
              'Your Location',
              style: TextStyle(
                color: Colors.amber[900],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        toolbarHeight: height * 0.08,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: address.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Head5(text: address[index]['heading'].toString()),
                  subtitle: Head6(
                    text: address[index]['location'].toString(),
                    fontWeight: FontWeight.w500,
                  ),
                  leading: address[index]['icon'] as Icon,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
