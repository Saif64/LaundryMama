import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:laundry_mama/dummy_data/dummy_data.dart';
import 'package:laundry_mama/widgets/head4.dart';
import 'package:laundry_mama/widgets/head5.dart';
import 'package:laundry_mama/widgets/head6.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: height * 0.05,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit_note_rounded,
              size: width * 0.07,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.logout_rounded,
              size: width * 0.06,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(height * 0.05),
              const Head4(text: 'Account Info'),
              Gap(height * 0.02),
              Hero(
                tag: 'profile-pic',
                child: CircleAvatar(
                  maxRadius: width * 0.1,
                  minRadius: width * 0.1,
                  backgroundImage:
                      const AssetImage('assets/images/professional image.jpeg'),
                ),
              ),
              Gap(height * 0.06),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: const Head5(text: 'Basic Info'),
              ),
              Gap(height * 0.01),
              SizedBox(
                height: height * 0.9,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: accountInfo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Head5(
                        text: accountInfo[index]["headline"].toString(),
                      ),
                      subtitle: Head6(
                        text: accountInfo[index]["info"].toString(),
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
