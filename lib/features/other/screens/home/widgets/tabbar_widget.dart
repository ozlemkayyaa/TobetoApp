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
      tabs: [
        Tab(
            child: Text(TTexts.applications,
                style: Theme.of(context).textTheme.titleLarge)),
        Tab(
            child: Text(TTexts.trainings,
                style: Theme.of(context).textTheme.titleLarge)),
        Tab(
            child: Text(TTexts.exam,
                style: Theme.of(context).textTheme.titleLarge)),
        Tab(
            child: Text(TTexts.news,
                style: Theme.of(context).textTheme.titleLarge)),
        Tab(
            child: Text(TTexts.polls,
                style: Theme.of(context).textTheme.titleLarge)),
      ],
    );
  }
}
