import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
  final _confirmedPasswordController = TextEditingController();

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
    _confirmedPasswordController.dispose();
    super.dispose();
  }

  // Functions
  void registerUser() async {
    setState(() {
      isAuthenticating = true;
    });
  }

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
                          fontWeight: FontWeight.bold)
                      .animate()
                      .fadeIn(duration: const Duration(milliseconds: 1200))
                      .moveY(duration: const Duration(milliseconds: 565))
                      .shimmer(delay: const Duration(milliseconds: 370))),
              const SizedBox(height: 35),

              // username textfield
              AuthInput(
                controller: _emailController,
                hintText: 'Email or Username',
                obscureText: false,
                inputType: TextInputType.emailAddress,
                labelText: 'Email or Username',
              ),

              const SizedBox(height: 10),

              // password textfield
              AuthInput(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: true,
                inputType: TextInputType.text,
                labelText: 'Password',
              ),

              const SizedBox(height: 10),

              // confirm password textfield
              AuthInput(
                controller: _confirmedPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
                inputType: TextInputType.text,
                labelText: 'Confirm Password',
              ),

              const SizedBox(height: 30),
              // sign in button
              if (isAuthenticating) const CircularProgressIndicator(),
              if (!isAuthenticating)
                LongButton(
                  onTap: registerUser,
                  text: 'Create an account',
                ),

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

              const SizedBox(height: 30),
              // google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  AuthIconButton(
                    imagePath: 'assets/icons/google.png',
                    onTap: () {},
                  ),

                  const SizedBox(width: 25),

                  // apple button
                  AuthIconButton(
                    imagePath: 'assets/icons/apple.png',
                    onTap: () {},
                  )
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
