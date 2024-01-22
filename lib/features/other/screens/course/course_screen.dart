import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/features/other/screens/course/widgets/az_button_widget.dart';
import 'package:tobeto/features/other/screens/course/widgets/choise_button_widget.dart';
import 'package:tobeto/features/other/screens/course/widgets/course_tabbar_widget.dart';
import 'package:tobeto/features/other/screens/course/widgets/couse_tabbar_view_widget.dart';
import 'package:tobeto/features/other/screens/course/widgets/search_button_widget.dart';
import 'package:tobeto/features/other/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

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
        drawer: const DrawerWidget(),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(TImages.education),
            ),

            // Arama
            TabButtonWidget(
              icon: Icons.search,
              buttonName: TTexts.searchButton,
            ),

            // Kurum Seçiniz
            ChoiseButtonWidget(
              buttonName: TTexts.choise,
            ),

            // Adına Göre
            AZButtonWidget(),

            CourseTabBarWidget(),

            CourseTabBarViewWidget(),
          ],
        ),
      ),
    );
  }
}
