import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_mama/global/routes.dart';
import 'package:laundry_mama/widgets/head2.dart';
import 'package:laundry_mama/widgets/head4.dart';
import 'package:laundry_mama/widgets/medium_button.dart';
import 'package:laundry_mama/widgets/profile_tiles.dart';

import '../widgets/input.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: height * 0.2,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.green[800],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                  child: Center(
                    child: const Head4(
                      text: "Settings",
                      color: Colors.white,
                    )
                        .animate()
                        .fadeIn(duration: const Duration(milliseconds: 325))
                        .moveY(delay: const Duration(milliseconds: 30)),
                  ),
                ),
                Positioned(
                  top: height * 0.055,
                  left: width * 0.03,
                  child: Hero(
                    tag: 'profile-pic',
                    child: Container(
                      height: height * 0.1,
                      width: width * 0.1,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white54),
                      child: IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_left_rounded,
                          size: 25,
                        ),
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.1, vertical: height * 0.07),
              child: Column(
                children: [
                  ProfileTiles(
                    title: "Profile",
                    onTap: () {
                      // context.push(REGISTER_USER);
                      showModalBottomSheet(
                        showDragHandle: true,
                        elevation: 2,
                        isDismissible: true,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: const AssetImage(
                                      'assets/images/professional image.jpeg'),
                                  radius: width * 0.15,
                                ),
                                Gap(height * 0.05),
                                Input(
                                  prefixIcon:
                                      const Icon(Icons.person_add_alt_rounded),
                                  labelText: "Full name",
                                  keyboardType: TextInputType.text,
                                  controller: _nameController,
                                ),
                                Gap(height * 0.03),
                                Input(
                                  prefixIcon:
                                      const Icon(Icons.alternate_email_rounded),
                                  labelText: "Email Address",
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                ),
                                Gap(height * 0.03),
                                MediumButton(
                                    onTap: () {}, text: "Update Profile"),
                                Gap(height * 0.05)
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Divider(),
                  ProfileTiles(title: "Customer Support"),
                  Divider(),
                  ProfileTiles(title: "Settings"),
                ],
              ),
            ),
            Gap(height * 0.08),
            Center(
              child: InkWell(
                onTap: () {
                  context.go(LOGIN_PAGE);
                },
                child: Container(
                  width: width * 0.4,
                  height: height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Center(
                    child: Head2(
                      text: "Logout",
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            )
            // const Head4(text: '')
            //     .animate()
            //     .fadeIn(duration: const Duration(milliseconds: 325))
            //     .moveX(delay: const Duration(milliseconds: 30)),
            // Gap(height * 0.02),
            // Hero(
            //   tag: 'profile-pic',
            //   child: CircleAvatar(
            //     maxRadius: width * 0.1,
            //     minRadius: width * 0.1,
            //     backgroundImage: const AssetImage(
            //         'assets/images/professional image.jpeg'),
            //   ),
            // ),
            // Gap(height * 0.06),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            //   child: const Head5(text: 'Basic Info')
            //       .animate()
            //       .fadeIn(duration: const Duration(milliseconds: 325))
            //       .moveX(delay: const Duration(milliseconds: 30)),
            // ),
            // Gap(height * 0.01),
            // SizedBox(
            //   height: height * 0.9,
            //   child: ListView.builder(
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemCount: accountInfo.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return ListTile(
            //         title: Head5(
            //           text: accountInfo[index]["headline"].toString(),
            //         ),
            //         subtitle: Head6(
            //           text: accountInfo[index]["info"].toString(),
            //           fontWeight: FontWeight.w400,
            //         ),
            //       )
            //           .animate()
            //           .fadeIn(duration: const Duration(milliseconds: 325))
            //           .moveX(delay: const Duration(milliseconds: 30));
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
