import 'package:flutter/material.dart';
import 'package:tobeto/features/education/screens/home/widgets/tabbar_widgets/application_widget.dart';
import 'package:tobeto/features/education/screens/home/widgets/tabbar_widgets/exam_widget.dart';
import 'package:tobeto/features/education/screens/home/widgets/tabbar_widgets/education_widget.dart';
import 'package:tobeto/features/education/screens/home/widgets/tabbar_widgets/news_widget.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class TabBarViewWidget extends StatelessWidget {
  const TabBarViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(children: [
        // Başvurularım butonunun altındaki Cardlar
        const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ApplicationWidget(
                    colors: TColors.secondary, accepted: TTexts.done),
                SizedBox(width: TSizes.defaultSpace),
                ApplicationWidget(
                    colors: TColors.accent, accepted: TTexts.notDone),
              ],
            ),
          ),
        ),

        // Eğitimlerim butonunun altındaki Cardlar
        const Padding(
          padding: EdgeInsets.all(TSizes.spaceBtwItems),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                EducationWidget(
                    image: TImages.ecmelHoca,
                    title: TTexts.ecmel,
                    date: TTexts.ecmelDate),
                SizedBox(width: TSizes.defaultSpace),
                EducationWidget(
                    image: TImages.istKod,
                    title: TTexts.howEducation,
                    date: TTexts.howEducationDate),
              ],
            ),
          ),
        ),

        // Sınavlarım butonunun altındaki Cardlar
        const Padding(
          padding: EdgeInsets.all(TSizes.spaceBtwItems),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ExamWidget(
                    examTitle: TTexts.examEveryone,
                    classTitle: TTexts.everyone,
                    examTime: TTexts.time),
                SizedBox(width: TSizes.defaultSpace),
                ExamWidget(
                    examTitle: TTexts.examEveryone,
                    classTitle: TTexts.everyone,
                    examTime: TTexts.time),
                SizedBox(width: TSizes.defaultSpace),
                ExamWidget(
                    examTitle: TTexts.examEveryone,
                    classTitle: TTexts.everyone,
                    examTime: TTexts.time),
              ],
            ),
          ),
        ),

        // Duyuru ve Haberlerim altındaki Cardlar
        const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                NewsWidget(
                    announcement: TTexts.announce1, dateTime: TTexts.date1),
                SizedBox(width: TSizes.defaultSpace),
                NewsWidget(
                    announcement: TTexts.announce2, dateTime: TTexts.date2),
                SizedBox(width: TSizes.defaultSpace),
                NewsWidget(
                    announcement: TTexts.announce3, dateTime: TTexts.date3),
              ],
            ),
          ),
        ),

        // Anketlerim
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const Image(
                image: AssetImage(TImages.anket),
                height: 200,
              ),
              const SizedBox(height: TSizes.defaultSpace),
              Text(TTexts.anket,
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ]),
    );
  }
}
