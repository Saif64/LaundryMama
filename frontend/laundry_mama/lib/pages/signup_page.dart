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
              const SizedBox(height: 35),

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

              const SizedBox(height: 10),
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

              const SizedBox(height: 10),
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

              const SizedBox(height: 30),

              // sign in button
              // if (isAuthenticating) onClickLogin,
              // if (isAuthenticating)
              LongButton(
                onTap: registerUser,
                text: 'Create an account',
              ),
              const SizedBox(height: 15),
              // or continue with
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
                        'Or continue with',
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
                    'Already a member?',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: widget.onTap,
                    child: const Text(
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
