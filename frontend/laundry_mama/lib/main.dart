import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_mama/global/routes.dart';
import 'package:laundry_mama/pages/address_page.dart';
import 'package:laundry_mama/pages/cart_page.dart';
import 'package:laundry_mama/pages/homepage.dart';
import 'package:laundry_mama/pages/in_progress.dart';
import 'package:laundry_mama/pages/login_page.dart';
import 'package:laundry_mama/pages/otp_page.dart';
import 'package:laundry_mama/pages/profile_page.dart';
import 'package:laundry_mama/pages/quantity_page.dart';
import 'package:laundry_mama/pages/register_user_page.dart';
import 'package:laundry_mama/pages/time_slot_page.dart';
import 'package:laundry_mama/pages/types_of_service.dart';

import 'package:provider/provider.dart';

import 'providers/cart_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _routes = GoRouter(initialLocation: HOMEPAGE, routes: [
    GoRoute(path: HOMEPAGE, builder: (context, state) => const HomePage()),
    GoRoute(
        path: REGISTER_USER, builder: (context, state) => const RegisterUser()),
    GoRoute(path: LOGIN_PAGE, builder: (context, state) => const LoginPage()),
    GoRoute(path: OTP_PAGE, builder: (context, state) => const OtpPage()),
    GoRoute(
        path: ADDRESS_PAGE, builder: (context, state) => const AdressPage()),
    GoRoute(
        path: PROFILE_PAGE, builder: (context, state) => const ProfilePage()),
    GoRoute(path: CART_PAGE, builder: (context, state) => const CartPage()),
    GoRoute(path: IN_PROGRESS, builder: (context, state) => const InProgress()),
    GoRoute(
        path: TIME_SLOT_PAGE,
        builder: (context, state) => const TimeSlotPage()),
    GoRoute(
        path: NEW_ORDER, builder: (context, state) => const TypesOfService()),
    GoRoute(
        path: QUANTITY_PAGE, builder: (context, state) => const QuantityPage()),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.light,
      theme: ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routerConfig: _routes,
      // initialRoute: HOMEPAGE,
      // routes: {
      //   HOMEPAGE: (context) => const HomePage(),
      //   REGISTER_USER: (context) => const RegisterUser(),
      //   OTP_PAGE: (context) => const OtpPage(),
      //   LOGIN_PAGE: (context) => const LoginPage(),
      //   ADDRESS_PAGE: (context) => const AdressPage(),
      //   NEW_ORDER: (context) => const TypesOfService(),
      //   TIME_SLOT_PAGE: (context) => const TimeSlotPage(),
      //   QUANTITY_PAGE: (context) => const QuantityPage(),
      //   PROFILE_PAGE: (context) => const ProfilePage(),
      //   CART_PAGE: (context) => const CartPage(),
      //   IN_PROGRESS: (context) => const InProgress()
      // },
    );
  }
}
