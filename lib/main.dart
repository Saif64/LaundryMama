import 'package:flutter/material.dart';
import 'package:laundry_mama/global/routes.dart';
import 'package:laundry_mama/pages/homepage.dart';
import 'package:laundry_mama/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HOMEPAGE,
      routes: {
        HOMEPAGE: (context) => HomePage(),
        SIGNUP_PAGE: (context) => SignupPage(),
      },
    );
  }
}
