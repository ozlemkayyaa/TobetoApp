import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/profile/create_profile/widgets/create_profile_tabbar_view_widget.dart';
import 'package:tobeto/screens/profile/create_profile/widgets/create_profile_tabbar_widget.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
        body: const Column(
          children: [
            ProfileTabBarWidget(),
            //SizedBox(height: TSizes.sm),
            ProfileTabBarViewWidget(),
          ],
        ),
      ),
    );
  }
}
