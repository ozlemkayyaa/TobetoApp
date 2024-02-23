import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/screens/profile/widget/profile_about.dart';
import 'package:tobeto/screens/profile/widget/profile_avatar.dart';
import 'package:tobeto/screens/profile/widget/profile_information.dart';
import 'package:tobeto/screens/profile/widget/profile_skills.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(TImages.appBarLogo, height: 18),
        ]),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: TSizes.defaultSpace),
            child: Icon(Iconsax.profile_circle),
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ProfileAvatar(),
            ProfileInformation(),
            ProfileAbout(),
            ProfileSkills(),
          ],
        ),
      ),
    );
  }
}
