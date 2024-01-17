import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_mama/widgets/head5.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

import '../global/routes.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(height * 0.2),
              Lottie.asset(
                'assets/animations/otp.json',
                height: height * 0.27,
                reverse: true,
                frameRate: FrameRate.max,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const AutoSizeText(
                'Enter your 6 digit OTP to verify your number',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Pinput(
                length: 6,
                onCompleted: (value) {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  // Navigator.pushReplacementNamed(context, HOMEPAGE);
                  context.go(HOMEPAGE);
                },
              ),
              SizedBox(height: height * 0.05),
              const Head5(text: "Haven't recieved code yet?"),
              SizedBox(height: height * 0.01),
              TextButton(
                  onPressed: () {},
                  child: const AutoSizeText(
                    'Send Again',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
