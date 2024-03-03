import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/announcements/announcement_screen.dart';
import 'package:tobeto/screens/education/education_screen.dart';
import 'package:tobeto/screens/education/widgets/ecmel.dart';
import 'package:tobeto/screens/education/widgets/ist_code.dart';
import 'package:tobeto/screens/home/widgets/application_widget.dart';
import 'package:tobeto/screens/exam/widgets/exam_home_widget.dart';
import 'package:tobeto/screens/education/widgets/education_widget.dart';
import 'package:tobeto/screens/announcements/widget/announcement_widget.dart';
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
        const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.sm),
            child: Column(
              children: [
                ApplicationWidget(
                    colors: TColors.secondary, accepted: TTexts.done),
                SizedBox(height: TSizes.sm),
                ApplicationWidget(
                    colors: TColors.accent, accepted: TTexts.notDone),
              ],
            ),
          ),
        ),

        // Eğitimlerim butonunun altındaki Cardlar
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(TSizes.sm),
              child: Row(
                children: [
                  const EducationWidget(
                      navigateTo: Ecmel(),
                      image: TImages.ecmelHoca,
                      title: TTexts.ecmel,
                      date: TTexts.ecmelDate),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  const EducationWidget(
                      navigateTo: IstCode(),
                      image: TImages.istKod,
                      title: TTexts.howEducation,
                      date: TTexts.howEducationDate),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  const SizedBox(height: TSizes.defaultSpace),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EducationScreen()),
                            );
                          },
                          icon: const Icon(Iconsax.arrow_circle_right)),
                      Text(TTexts.more,
                          style: Theme.of(context).textTheme.bodyLarge)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // Sınavlarım butonunun altındaki Cardlar
        const Padding(
          padding: EdgeInsets.all(TSizes.spaceBtwItems),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ExamHomeWidget(
                        message: TTexts.examMessage,
                        title: TTexts.examEveryone,
                        examTitle: TTexts.examEveryone,
                        classTitle: TTexts.everyone,
                        examTime: TTexts.time),
                    SizedBox(width: TSizes.defaultSpace),
                    ExamHomeWidget(
                        message: TTexts.examMessage,
                        title: TTexts.examEveryone,
                        examTitle: TTexts.examEveryone,
                        classTitle: TTexts.everyone,
                        examTime: TTexts.time),
                    SizedBox(width: TSizes.defaultSpace),
                    ExamHomeWidget(
                        message: TTexts.examMessage,
                        title: TTexts.examEveryone,
                        examTitle: TTexts.examEveryone,
                        classTitle: TTexts.everyone,
                        examTime: TTexts.time),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Duyuru ve Haberlerim altındaki Cardlar
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.iconXs),
            child: Column(
              children: [
                const Column(
                  children: [
                    AnnouncementWidget(
                        title: TTexts.baslik1,
                        message: TTexts.duyuru1,
                        announcement: TTexts.announce1,
                        dateTime: TTexts.date1),
                    SizedBox(width: TSizes.defaultSpace),
                    AnnouncementWidget(
                        title: TTexts.baslik2,
                        message: TTexts.duyuru2,
                        announcement: TTexts.announce2,
                        dateTime: TTexts.date2),
                  ],
                ),
                const SizedBox(height: TSizes.sm),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AnnouncementScreen()),
                          );
                        },
                        icon: const Icon(Iconsax.arrow_circle_right)),
                    Text(TTexts.more,
                        style: Theme.of(context).textTheme.bodyLarge)
                  ],
                ),
              ],
            ),
          ),
        ),

        // Anketlerim
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const Image(
                  image: AssetImage(TImages.anket),
                  height: 230,
                ),
                const SizedBox(height: TSizes.defaultSpace + 5),
                Text(TTexts.anket,
                    style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
