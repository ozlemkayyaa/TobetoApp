import 'package:flutter/material.dart';
import 'package:tobeto/screens/profile/create_profile/widgets/form/settings.dart';
import 'package:tobeto/screens/profile/create_profile/widgets/form/personal_information.dart';
import 'package:tobeto/screens/profile/create_profile/widgets/form/education_life.dart';
import 'package:tobeto/screens/profile/create_profile/widgets/form/experience.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class ProfileTabBarViewWidget extends StatelessWidget {
  const ProfileTabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.all(TSizes.sm),
        child: TabBarView(
          children: [
            PersonalInformation(),
            Experience(),
            EducationLife(),
            Settings(),
          ],
        ),
      ),
    );
  }
}
