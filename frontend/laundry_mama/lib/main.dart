import 'package:flutter/material.dart';
import 'package:laundry_mama/global/routes.dart';
import 'package:laundry_mama/pages/address_page.dart';
import 'package:laundry_mama/pages/cart_page.dart';
import 'package:laundry_mama/pages/homepage.dart';
import 'package:laundry_mama/pages/in_progress.dart';
import 'package:laundry_mama/pages/login_page.dart';
import 'package:laundry_mama/pages/profile_page.dart';
import 'package:laundry_mama/pages/quantity_page.dart';
import 'package:laundry_mama/pages/register_user_page.dart';
import 'package:laundry_mama/pages/time_slot_page.dart';
import 'package:laundry_mama/pages/types_of_service.dart';

import 'package:laundry_mama/providers/auth_provider.dart';

import 'package:provider/provider.dart';

import 'providers/cart_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: ap.isLoogedIn // when true get data from sharedPreference
          ? HOMEPAGE
          : LOGIN_PAGE,
      routes: {
        HOMEPAGE: (context) => const HomePage(),
        REGISTER_USER: (context) => const RegisterUser(),
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
