import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/education/widgets/go_education_header.dart';
import 'package:tobeto/screens/go_training/widget/go_training_tabbar_view_widget.dart';
import 'package:tobeto/screens/go_training/widget/go_training_tabbar_widget.dart';
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
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GoEducationHeader(title: TTexts.title1),
            GoTrainingTabBarWidget(),
            GoTrainingTabBarViewWidget()
          ],
        ),
      ),
    );
  }
}
