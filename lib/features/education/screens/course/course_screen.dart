import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/features/education/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/features/education/screens/home/widgets/tabbar_widgets/education_widget.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(TImages.education),
            ),

            // Arama
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: TColors.white,
                      padding:
                          const EdgeInsets.symmetric(vertical: TSizes.iconXs),
                      side: const BorderSide(
                        color: TColors.white,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(TSizes.defaultSpace))),
                  child: Text(
                    "Arama",
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),

            // Kurum Seçiniz
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: TColors.white,
                      padding:
                          const EdgeInsets.symmetric(vertical: TSizes.iconXs),
                      side: const BorderSide(
                        color: TColors.white,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(TSizes.defaultSpace))),
                  child: Text(
                    "Kurum Seçiniz",
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),

            // Adına Göre
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: TColors.white,
                      padding:
                          const EdgeInsets.symmetric(vertical: TSizes.iconXs),
                      side: const BorderSide(
                        color: TColors.white,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(TSizes.defaultSpace))),
                  child: Text(
                    "Adına Göre (A-Z)",
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
            //const SizedBox(height: TSizes.defaultSpace),
            TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorColor: TColors.primary,
              unselectedLabelColor: TColors.darkGrey,
              labelColor: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.primary,
              tabs: [
                Tab(
                    child: Text(TTexts.allLesson,
                        style: Theme.of(context).textTheme.titleLarge)),
                Tab(
                    child: Text(TTexts.continueLesson,
                        style: Theme.of(context).textTheme.titleLarge)),
                Tab(
                    child: Text(TTexts.doneLesson,
                        style: Theme.of(context).textTheme.titleLarge)),
              ],
            ),
            const Expanded(
              child: TabBarView(children: [
                Padding(
                  padding: EdgeInsets.all(TSizes.spaceBtwItems),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        EducationWidget(
                            image: TImages.ecmelHoca,
                            title: TTexts.ecmel,
                            date: TTexts.ecmelDate),
                        SizedBox(width: TSizes.spaceBtwItems),
                        EducationWidget(
                            image: TImages.istKod,
                            title: TTexts.howEducation,
                            date: TTexts.howEducationDate),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(TSizes.spaceBtwItems),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        EducationWidget(
                            image: TImages.ecmelHoca,
                            title: TTexts.ecmel,
                            date: TTexts.ecmelDate),
                        SizedBox(width: TSizes.spaceBtwItems),
                        EducationWidget(
                            image: TImages.istKod,
                            title: TTexts.howEducation,
                            date: TTexts.howEducationDate),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(TSizes.spaceBtwItems),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        EducationWidget(
                            image: TImages.ecmelHoca,
                            title: TTexts.ecmel,
                            date: TTexts.ecmelDate),
                        SizedBox(width: TSizes.spaceBtwItems),
                        EducationWidget(
                            image: TImages.istKod,
                            title: TTexts.howEducation,
                            date: TTexts.howEducationDate),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
