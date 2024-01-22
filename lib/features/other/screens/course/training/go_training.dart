import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tobeto/features/other/screens/course/training/widget/go_training_tabbar_view_widget.dart';
import 'package:tobeto/features/other/screens/course/training/widget/go_training_tabbar_widget.dart';
import 'package:tobeto/features/other/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class GoTraining extends StatelessWidget {
  const GoTraining({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(TImages.appBarLogo, height: 18),
          ]),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: TSizes.defaultSpace),
              child: Icon(Iconsax.profile_circle),
            )
          ],
        ),
        drawer: const DrawerWidget(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(TSizes.md),
              child: Text(
                TTexts.title1,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.md),
              child: Text(
                TTexts.lets,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(color: TColors.info),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: TSizes.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.favorite_outline_outlined),
                  SizedBox(width: TSizes.xs),
                  Icon(Icons.bookmark_outline_outlined),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.xs),
              child: LinearPercentIndicator(
                width: 395,
                lineHeight: 10.0,
                percent: 0.2,
                barRadius: const Radius.circular(20),
                backgroundColor: TColors.grey,
                progressColor: TColors.info,
              ),
            ),
            const GoTrainingTabBarWidget(),
            const GoTrainingTabBarViewWidget()
          ],
        ),
      ),
    );
  }
}
