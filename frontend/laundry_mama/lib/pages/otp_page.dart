import 'package:flutter/material.dart';
import 'package:laundry_mama/global/routes.dart';
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

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/otp.json',
            height: height * 0.27,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          const Text(
            'Enter your 6 digit OTP to authenticate your number',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          OTPTextField(
            length: 6,
            width: MediaQuery.of(context).size.width,
            fieldStyle: FieldStyle.underline,
            textFieldAlignment: MainAxisAlignment.spaceAround,
            outlineBorderRadius: 8,
            isDense: true,
            onCompleted: (value) {
              print("completed" + value);
              Navigator.pushReplacementNamed(context, HOMEPAGE);
            },
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(height: height * 0.02),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Send Again',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.green,
                ),
              ))
        ],
      ),
    );
  }
}
