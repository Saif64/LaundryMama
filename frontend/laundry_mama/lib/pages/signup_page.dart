import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:laundry_mama/global/routes.dart';
import 'package:laundry_mama/widgets/auth_icons.dart';
import 'package:laundry_mama/widgets/auth_page_input.dart';
import 'package:laundry_mama/widgets/head2.dart';
import 'package:laundry_mama/widgets/long_button.dart';
import 'package:lottie/lottie.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.onTap});
  final Function()? onTap;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with TickerProviderStateMixin {
  late final AnimationController _registerAnimationController;

  // text editing controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneNumber = TextEditingController();

  bool isAuthenticating = false;

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
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumber.dispose();
    super.dispose();
  }

  // Functions
  void registerUser() async {
    setState(() {
      isAuthenticating = true;
    });
    Navigator.pushReplacementNamed(context, OTP_PAGE);
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  String? validatePassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  final onClickLogin = const SpinKitFadingCube(
    color: Colors.green,
  );

  // Build Methods & Widgets
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animations/register.json',
                controller: _registerAnimationController,
                height: height * 0.2,
                frameRate: FrameRate.max,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 36,
                ),
                child: const Head2(
                        text: "Welcome to the new era of Laundry",
                        fontSize: 30,
                        fontWeight: FontWeight.w900)
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 1200))
                    .moveY(duration: const Duration(milliseconds: 565))
                    .shakeX(
                        duration: const Duration(milliseconds: 479),
                        delay: const Duration(milliseconds: 250))
                    .shimmer(
                      delay: const Duration(milliseconds: 370),
                    ),
              ),
              SizedBox(height: height * 0.035),

              // username textfield
              AuthInput(
                controller: _emailController,
                hintText: 'Email or Username',
                obscureText: false,
                inputType: TextInputType.emailAddress,
                labelText: 'Email or Username',
                validator: validateEmail,
              ).animate().shimmer(
                    duration: const Duration(milliseconds: 875),
                  ),

              SizedBox(height: height * 0.015),
              // Phone Number textfield
              AuthInput(
                controller: _phoneNumber,
                hintText: 'Phone Number',
                obscureText: true,
                inputType: TextInputType.phone,
                labelText: 'Phone Number',
              ).animate().shimmer(
                    duration: const Duration(milliseconds: 875),
                  ),

              SizedBox(height: height * 0.015),
              // password textfield
              AuthInput(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: true,
                inputType: TextInputType.text,
                labelText: 'Password',
                validator: validatePassword,
              ).animate().shimmer(
                    duration: const Duration(milliseconds: 875),
                  ),

              SizedBox(height: height * 0.03),

              // sign in button
              // if (isAuthenticating) onClickLogin,
              // if (isAuthenticating)
              LongButton(
                onTap: registerUser,
                text: 'Create an account',
              ),
              SizedBox(height: height * 0.015),
              // or continue with
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
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

              SizedBox(height: height * 0.015),
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

              SizedBox(height: height * 0.035),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'Already a member?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: width * 0.009),
                  InkWell(
                    onTap: widget.onTap,
                    child: const AutoSizeText(
                      'Login instead',
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
