import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/features/education/screens/home/widgets/container_style_widget.dart';
import 'package:tobeto/features/education/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/features/education/screens/home/widgets/tabbar_view_widget.dart';
import 'package:tobeto/features/education/screens/home/widgets/tabbar_widget.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: TSizes.spaceBtwItems),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '${TTexts.tobetoPurple} ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: TColors.primary)),
                    TextSpan(
                        text: TTexts.welcome,
                        style: Theme.of(context).textTheme.headlineMedium),
                    TextSpan(
                        text: '${TTexts.user} ',
                        style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // İkinci Text
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Text(
                TTexts.introduction,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: TSizes.defaultSpace),

            // İstanbul kodluyor ve profilimi oluştur yazıları,  yana kaymalı
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ContainerStyleWidget(
                      gradientStartColor: TColors.profile1,
                      gradientEndColor: TColors.profile2,
                      buttonText: TTexts.start,
                      containerTitle: TTexts.createProfile),
                  ContainerStyleWidget(
                      gradientStartColor: TColors.yourself1,
                      gradientEndColor: TColors.yourself2,
                      buttonText: TTexts.start,
                      containerTitle: TTexts.yourself),
                  ContainerStyleWidget(
                      gradientStartColor: TColors.learning1,
                      gradientEndColor: TColors.learning2,
                      buttonText: TTexts.start,
                      containerTitle: TTexts.startLearning),
                ],
              ),
            ),

            const SizedBox(height: TSizes.defaultSpace),

            const TabBarWidget(),

            const TabBarViewWidget(),
          ],
        ),
      ),
    );
  }
}
