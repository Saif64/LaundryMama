import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:laundry_mama/widgets/shiny_text.dart';
import 'package:lottie/lottie.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with TickerProviderStateMixin {
  late final AnimationController _registerAnimationController;

  @override
  void initState() {
    super.initState();
    _registerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2000,
      ),
    )..forward();
  }

  @override
  void dispose() {
    _registerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animations/register.json',
                controller: _registerAnimationController,
              ),
              const CustomText(
                      text: "Register",
                      fontSize: 24,
                      fontWeight: FontWeight.bold)
                  .animate()
                  .fadeIn(duration: const Duration(milliseconds: 1200))
                  .moveY(duration: const Duration(milliseconds: 375)),
            ],
          ),
        ),
      ),
    );
  }
}
