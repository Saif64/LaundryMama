import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laundry_mama/global/routes.dart';

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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextButton(
          onPressed: toAdressPage,
          child: Row(children: [
            Icon(
              Icons.location_on_outlined,
              color: Theme.of(context).shadowColor,
            ),
            AutoSizeText(
              initialLocation,
              style: TextStyle(
                color: Theme.of(context).shadowColor,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/profile_avatar.png',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
