import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class TeamTabBarWidget extends StatelessWidget {
  const TeamTabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabAlignment: TabAlignment.center,
      isScrollable: true,
      indicatorColor: TColors.primary,
      unselectedLabelColor: TColors.darkGrey,
      labelColor: THelperFunctions.isDarkMode(context)
          ? TColors.white
          : TColors.primary,
      tabs: [
        Tab(
            child: Text(TTexts.team,
                style: Theme.of(context).textTheme.titleLarge)),
        Tab(
            child: Text(TTexts.danisma,
                style: Theme.of(context).textTheme.titleLarge)),
      ],
    );
  }
}
