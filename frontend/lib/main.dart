import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:laundry_mama/global/routes.dart';
import 'package:laundry_mama/pages/homepage.dart';
import 'package:laundry_mama/pages/login_page.dart';
import 'package:laundry_mama/pages/signup_page.dart';

void main() {
  Client client = Client();
  client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('652a980791a50b3a0e59')
      .setSelfSigned(status: true);
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
        SIGNUP_PAGE: (context) => SignupPage(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(LOGIN_PAGE),
            ),
        LOGIN_PAGE: (context) => LoginPage()
      },
    );
  }
}
