import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class GoTrainingTabBarWidget extends StatelessWidget {
  const GoTrainingTabBarWidget({
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
            child: Text(TTexts.contents,
                style: Theme.of(context).textTheme.headlineSmall)),
        Tab(
            child: Text(TTexts.about2,
                style: Theme.of(context).textTheme.headlineSmall)),
      ],
    );
  }
}
