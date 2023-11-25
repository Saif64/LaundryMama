import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
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
  final _phoneController = TextEditingController();
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
    _phoneController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xfffc466b), Color(0xff817731)],
            stops: [0.25, 0.75],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Gap(height * 0.09),
                ColorFiltered(
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcATop),
                  child: Lottie.asset(
                    'assets/animations/login_animation.json',
                    height: height * 0.27,
                    reverse: true,
                    frameRate: FrameRate.max,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Head2(
                    text: 'Enjoy hassle free laundry with in one click away',
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  )
                      .animate()
                      .fadeIn(duration: const Duration(milliseconds: 1200))
                      .moveY(duration: const Duration(milliseconds: 565))
                      .shimmer(
                        delay: const Duration(milliseconds: 370),
                      ),
                ),
                SizedBox(height: height * 0.065),
                AuthInput(
                  controller: _phoneController,
                  hintText: 'Phone Number',
                  obscureText: false,
                  inputType: TextInputType.phone,
                  labelText: 'Phone Number',
                ),

                SizedBox(height: height * 0.085),
                LongButton(
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.pushReplacementNamed(context, OTP_PAGE);
                  },
                  text: "Let's wash clothes",
                ),
                SizedBox(height: height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.07, vertical: height * 0.015),
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
                        child: AutoSizeText(
                          'Or Login with',
                          style: TextStyle(
                            color: Colors.grey[300],
                          ),
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

                SizedBox(height: height * 0.025),
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

                    SizedBox(width: width * 0.04),

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

                // SizedBox(height: height * 0.035),

                // not a member? register now
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const AutoSizeText(
                //       'Not a member yet???',
                //       style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         color: Colors.white,
                //       ),
                //     ),
                //     SizedBox(width: width * 0.009),
                //     InkWell(
                //       onTap: widget.onTap,
                //       child: AutoSizeText(
                //         'Let\'s register',
                //         style: TextStyle(
                //           color: Colors.grey[400],
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
