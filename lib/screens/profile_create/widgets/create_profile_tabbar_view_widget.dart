import 'package:flutter/material.dart';
import 'package:tobeto/screens/profile_create/widgets/form/certificate.dart';
import 'package:tobeto/screens/profile_create/widgets/form/language.dart';
import 'package:tobeto/screens/profile_create/widgets/form/settings.dart';
import 'package:tobeto/screens/profile_create/widgets/form/personal_information.dart';
import 'package:tobeto/screens/profile_create/widgets/form/education_life.dart';
import 'package:tobeto/screens/profile_create/widgets/form/experience.dart';
import 'package:tobeto/screens/profile_create/widgets/form/skills.dart';
import 'package:tobeto/screens/profile_create/widgets/form/social_media.dart';
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
