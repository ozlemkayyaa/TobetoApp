import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/features/other/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/features/other/screens/home/widgets/tabbar_view_widget.dart';
import 'package:tobeto/features/other/screens/home/widgets/tabbar_widget.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

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
            const SizedBox(height: TSizes.defaultSpace),
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
            const SizedBox(height: TSizes.defaultSpace),

            // İkinci Text
            Padding(
              padding: const EdgeInsets.only(left: TSizes.xs),
              child: Text(
                TTexts.introduction,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Profilimi oluştur yazıları,  yana kaymalı
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Image(
                    image: AssetImage(
                        dark ? TImages.istanbulWhite : TImages.istanbulBlack),
                    width: 170,
                  ),
                  // Ardığın is burada yazısı
                  const SizedBox(height: TSizes.lg),
                  Text(TTexts.work,
                      style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),
            ),

            const SizedBox(height: TSizes.sm),

            const TabBarWidget(),

            const TabBarViewWidget(),
          ],
        ),
      ),
    );
  }
}
