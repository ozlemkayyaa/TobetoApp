import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class ProfileTabBarWidget extends StatelessWidget {
  const ProfileTabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorColor: TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
        labelColor: THelperFunctions.isDarkMode(context)
            ? TColors.white
            : TColors.primary,
        tabs: [
          Tab(
              child: Text(TTexts.personalInfo,
                  style: Theme.of(context).textTheme.titleLarge)),
          Tab(
              child: Text(TTexts.experience,
                  style: Theme.of(context).textTheme.titleLarge)),
          Tab(
              child: Text(TTexts.educationLife,
                  style: Theme.of(context).textTheme.titleLarge)),
          Tab(
              child: Text(TTexts.skill,
                  style: Theme.of(context).textTheme.titleLarge)),
          Tab(
              child: Text(TTexts.certificate,
                  style: Theme.of(context).textTheme.titleLarge)),
          Tab(
              child: Text(TTexts.socialMedia,
                  style: Theme.of(context).textTheme.titleLarge)),
          Tab(
              child: Text(TTexts.language,
                  style: Theme.of(context).textTheme.titleLarge)),
          Tab(
              child: Text(TTexts.settings,
                  style: Theme.of(context).textTheme.titleLarge)),
        ]);
  }
}
