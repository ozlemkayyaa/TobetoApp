import 'package:flutter/material.dart';
import 'package:tobeto/screens/profile/create_profile/widgets/form/certificate.dart';
import 'package:tobeto/screens/profile/create_profile/widgets/form/language.dart';
import 'package:tobeto/screens/profile/create_profile/widgets/form/settings.dart';
import 'package:tobeto/screens/profile/create_profile/widgets/form/personal_information.dart';
import 'package:tobeto/screens/profile/create_profile/widgets/form/education_life.dart';
import 'package:tobeto/screens/profile/create_profile/widgets/form/experience.dart';
import 'package:tobeto/screens/profile/create_profile/widgets/form/skills.dart';
import 'package:tobeto/screens/profile/create_profile/widgets/form/social_media.dart';
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
            PersonalInformationForm(),
            Experience(),
            EducationLife(),
            Skills(),
            Certificate(),
            SocialMedia(),
            Language(),
            Settings(),
          ],
        ),
      ),
    );
  }
}
