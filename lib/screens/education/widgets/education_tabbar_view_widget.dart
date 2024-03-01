import 'package:flutter/material.dart';
import 'package:tobeto/screens/education/widgets/ecmel.dart';
import 'package:tobeto/screens/education/widgets/education_widget.dart';
import 'package:tobeto/screens/education/widgets/istCode.dart';
import 'package:tobeto/screens/education/widgets/mobil.dart';
import 'package:tobeto/screens/education/widgets/soft_skill.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class EducationTabBarViewWidget extends StatelessWidget {
  const EducationTabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(children: [
        // Tüm Eğitimlerim
        Padding(
          padding: EdgeInsets.all(TSizes.sm),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                EducationWidget(
                    navigateTo: Ecmel(),
                    image: TImages.ecmelHoca,
                    title: TTexts.ecmel,
                    date: TTexts.ecmelDate),
                SizedBox(height: TSizes.sm),
                EducationWidget(
                    navigateTo: IstCode(),
                    image: TImages.istKod,
                    title: TTexts.howEducation,
                    date: TTexts.howEducationDate),
                SizedBox(height: TSizes.sm),
                EducationWidget(
                    navigateTo: Mobil(),
                    image: TImages.mobil,
                    title: TTexts.mobil,
                    date: TTexts.mobilDate),
                SizedBox(height: TSizes.sm),
                EducationWidget(
                    navigateTo: SoftSkill(),
                    image: TImages.softskill,
                    title: TTexts.softSkill,
                    date: TTexts.softSkillDate),
              ],
            ),
          ),
        ),

        // Devam Ettiklerim
        Padding(
          padding: EdgeInsets.all(TSizes.sm),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                EducationWidget(
                    navigateTo: IstCode(),
                    image: TImages.istKod,
                    title: TTexts.howEducation,
                    date: TTexts.howEducationDate),
                SizedBox(height: TSizes.sm),
                EducationWidget(
                    navigateTo: SoftSkill(),
                    image: TImages.softskill,
                    title: TTexts.softSkill,
                    date: TTexts.softSkillDate),
              ],
            ),
          ),
        ),

        // Tamamladıklarım
        Padding(
          padding: EdgeInsets.all(TSizes.sm),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                EducationWidget(
                    navigateTo: Ecmel(),
                    image: TImages.ecmelHoca,
                    title: TTexts.ecmel,
                    date: TTexts.ecmelDate),
                SizedBox(height: TSizes.sm),
                EducationWidget(
                    navigateTo: Mobil(),
                    image: TImages.mobil,
                    title: TTexts.mobil,
                    date: TTexts.mobilDate),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
