import 'package:flutter/material.dart';
import 'package:tobeto/features/other/screens/home/widgets/tabbar_widgets/education_widget.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class CourseTabBarViewWidget extends StatelessWidget {
  const CourseTabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(children: [
        Padding(
          padding: EdgeInsets.all(TSizes.sm),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                EducationWidget(
                    image: TImages.ecmelHoca,
                    title: TTexts.ecmel,
                    date: TTexts.ecmelDate),
                SizedBox(height: TSizes.sm),
                EducationWidget(
                    image: TImages.istKod,
                    title: TTexts.howEducation,
                    date: TTexts.howEducationDate),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(TSizes.sm),
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
          padding: EdgeInsets.all(TSizes.sm),
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
    );
  }
}
