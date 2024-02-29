import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/education/widgets/education_tabbar_widget.dart';
import 'package:tobeto/screens/education/widgets/education_tabbar_view_widget.dart';
import 'package:tobeto/screens/education/widgets/search_button_widget.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(TImages.education),
            ),

            // Arama
            SizedBox(height: TSizes.sm),
            SearchButtonWidget(
              buttonName: TTexts.searchButton,
            ),

            EducationTabBarWidget(),

            EducationTabBarViewWidget(),
          ],
        ),
      ),
    );
  }
}
