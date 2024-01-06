import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

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
      tabs: const [
        Tab(child: Text(TTexts.applications)),
        Tab(child: Text(TTexts.trainings)),
        Tab(child: Text(TTexts.exam)),
        Tab(child: Text(TTexts.news)),
        Tab(child: Text(TTexts.polls)),
      ],
    );
  }
}
