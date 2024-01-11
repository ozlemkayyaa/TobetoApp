import 'package:flutter/material.dart';
import 'package:tobeto/features/other/screens/profile/create_profile/widgets/form/four_form.dart';
import 'package:tobeto/features/other/screens/profile/create_profile/widgets/form/one_form.dart';
import 'package:tobeto/features/other/screens/profile/create_profile/widgets/form/three_form.dart';
import 'package:tobeto/features/other/screens/profile/create_profile/widgets/form/two_form.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';

class ProfileTabBarViewWidget extends StatelessWidget {
  const ProfileTabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TabBarView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: TColors.grey,
                    backgroundImage: AssetImage(TImages.profileImage),
                  ),
                  OneForm(),
                ],
              ),
            ),
            TwoForm(),
            ThreeForm(),
            FourForm(),
          ],
        ),
      ),
    );
  }
}
