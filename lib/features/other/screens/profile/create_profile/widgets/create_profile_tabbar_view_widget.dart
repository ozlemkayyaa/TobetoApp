import 'package:flutter/material.dart';
import 'package:tobeto/features/other/screens/profile/create_profile/widgets/form/four_form.dart';
import 'package:tobeto/features/other/screens/profile/create_profile/widgets/form/one_form.dart';
import 'package:tobeto/features/other/screens/profile/create_profile/widgets/form/three_form.dart';
import 'package:tobeto/features/other/screens/profile/create_profile/widgets/form/two_form.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class ProfileTabBarViewWidget extends StatelessWidget {
  const ProfileTabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.sm),
        child: TabBarView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor:
                        dark ? TColors.darkGrey : TColors.lightGrey,
                    backgroundImage: const AssetImage(TImages.profileImage),
                  ),
                  const OneForm(),
                ],
              ),
            ),
            const TwoForm(),
            const ThreeForm(),
            const FourForm(),
          ],
        ),
      ),
    );
  }
}
