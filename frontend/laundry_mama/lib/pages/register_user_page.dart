import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laundry_mama/widgets/input.dart';
import 'package:laundry_mama/widgets/long_button.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({
    super.key,
  });

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser>
    with TickerProviderStateMixin {
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          "assets/images/gradient-background.jpeg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        const AssetImage('assets/images/profile_avatar.png'),
                    radius: _width * 0.15,
                  ),
                  Gap(_height * 0.09),
                  Input(
                    prefixIcon: const Icon(Icons.person_add_alt_rounded),
                    labelText: "Full name",
                    keyboardType: TextInputType.text,
                    controller: _nameController,
                  ),
                  Gap(_height * 0.03),
                  Input(
                    prefixIcon: const Icon(Icons.alternate_email_rounded),
                    labelText: "Email Address",
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                  ),
                  Gap(_height * 0.03),
                  LongButton(onTap: () {}, text: "Register with your details")
                ],
              ),
            )),
      ],
    );
  }
}
