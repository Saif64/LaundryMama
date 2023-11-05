import 'package:flutter/material.dart';
import 'package:laundry_mama/global/routes.dart';
import 'package:laundry_mama/pages/address_page.dart';
import 'package:laundry_mama/pages/homepage.dart';
import 'package:laundry_mama/pages/login_page.dart';
import 'package:laundry_mama/pages/otp_page.dart';
import 'package:laundry_mama/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // darkTheme: ThemeData.dark(),
      theme: ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: HOMEPAGE,
      routes: {
        HOMEPAGE: (context) => HomePage(),
        SIGNUP_PAGE: (context) => SignupPage(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(LOGIN_PAGE),
            ),
        LOGIN_PAGE: (context) => LoginPage(
              onTap: () => Navigator.pushReplacementNamed(context, SIGNUP_PAGE),
            ),
        OTP_PAGE: (context) => OtpPage(),
        ADDRESS_PAGE: (context) => AdressPage()
      },
    );
  }
}
