import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laundry_mama/global/routes.dart';
import 'package:laundry_mama/widgets/head5.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff688782), Color(0xff26e8e5)],
            stops: [0.25, 0.75],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
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
                'Enter your 4 digit OTP to verify your number',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: OTPTextField(
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  fieldStyle: FieldStyle.box,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  outlineBorderRadius: 10,
                  fieldWidth: width * 0.15,
                  contentPadding: const EdgeInsets.all(20),
                  isDense: true,
                  onCompleted: (value) {
                    print("completed" + value);
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.pushReplacementNamed(context, HOMEPAGE);
                  },
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
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
