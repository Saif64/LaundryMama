import 'package:flutter/material.dart';
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
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: HOMEPAGE,
      routes: {
        HOMEPAGE: (context) => const HomePage(),
        REGISTER_USER: (context) => const RegisterUser(),
        OTP_PAGE: (context) => OtpPage(),
        LOGIN_PAGE: (context) => LoginPage(),
        ADDRESS_PAGE: (context) => const AdressPage(),
        NEW_ORDER: (context) => const TypesOfService(),
        TIME_SLOT_PAGE: (context) => const TimeSlotPage(),
        QUANTITY_PAGE: (context) => const QuantityPage(),
        PROFILE_PAGE: (context) => const ProfilePage(),
        CART_PAGE: (context) => const CartPage(),
        IN_PROGRESS: (context) => const InProgress()
      },
    );
  }
}
