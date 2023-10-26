import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:laundry_mama/global/routes.dart';
import 'package:laundry_mama/widgets/auth_page_input.dart';
import 'package:laundry_mama/widgets/head2.dart';
import 'package:lottie/lottie.dart';

import '../widgets/auth_icons.dart';
import '../widgets/long_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onTap});
  final Function()? onTap;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late final AnimationController _loginAnimationController;

  // text editing controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isAuthenticating = false;

  /// The `initState` function initializes an animation controller with a duration of 2000 milliseconds
  /// and starts the animation.
  @override
  void initState() {
    super.initState();
    _loginAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 7800,
      ),
    )..forward();
  }

  @override
  void dispose() {
    _loginAnimationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        toolbarHeight: 10,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Lottie.asset(
                'assets/animations/login_animation.json',
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const Head2(
                        text:
                            'Enjoy hassle free laundry with in one click away',
                        fontSize: 30,
                        fontWeight: FontWeight.w900)
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 1200))
                    .moveY(duration: const Duration(milliseconds: 565))
                    .shimmer(
                      delay: const Duration(milliseconds: 370),
                    ),
              ),
              const SizedBox(height: 30),
              AuthInput(
                controller: _emailController,
                hintText: 'Email',
                obscureText: false,
                inputType: TextInputType.emailAddress,
                labelText: 'Email',
              ),
              const SizedBox(height: 25),
              AuthInput(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: true,
                inputType: TextInputType.visiblePassword,
                labelText: 'Password',
              ),
              const SizedBox(height: 25),
              LongButton(
                onTap: () => Navigator.pushReplacementNamed(context, HOMEPAGE),
                text: 'Continue the journey',
              ),
              const SizedBox(height: 15),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 3,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or Login with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 3,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),
              // google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  AuthIconButton(
                    imagePath: 'assets/icons/google.png',
                    onTap: () {},
                  ).animate().shimmer(
                        delay: const Duration(milliseconds: 1200),
                        duration: const Duration(milliseconds: 875),
                      ),

                  const SizedBox(width: 25),

                  // apple button
                  AuthIconButton(
                    imagePath: 'assets/icons/apple.png',
                    onTap: () {},
                  ).animate().shimmer(
                        delay: const Duration(milliseconds: 1200),
                        duration: const Duration(milliseconds: 875),
                      ),
                ],
              ),

              const SizedBox(height: 30),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member yet???',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: widget.onTap,
                    child: const Text(
                      'Let\'s register',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
