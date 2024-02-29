import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/education/widgets/go_education_header.dart';
import 'package:tobeto/screens/go_training/data/go_training_data.dart';
import 'package:tobeto/screens/go_training/models/go_training_model.dart';
import 'package:tobeto/screens/go_training/widget/about_widget.dart';
import 'package:tobeto/screens/go_training/widget/go_training_widget.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class Ecmel extends StatelessWidget {
  const Ecmel({super.key});

  @override
  Widget build(BuildContext context) {
    List<GoTrainingModel> trainingData9 = GoTrainingData.getLessons9();

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
        body: Column(
          children: [
            const GoEducationHeader(title: TTexts.ecmel),
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
                    child: Text(TTexts.contents,
                        style: Theme.of(context).textTheme.headlineSmall)),
                Tab(
                    child: Text(TTexts.about2,
                        style: Theme.of(context).textTheme.headlineSmall)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // İçerik
                  ListView(
                    children: [
                      ...trainingData9
                          .map((data) => GoTrainingWidget(lessonData: data)),
                    ],
                  ),

                  // Hakkında
                  const AboutWidget(
                    baslangic: '21 EYL 2023 12:20',
                    bitis: '31 MAR 2024 23:59',
                    tahminiSure: "3 dk",
                    egitimTuru: "Eğitim",
                    kategori: "Genel",
                    seviye: "İleri",
                    icerik: "1",
                    ureticiFirma: "Enocta",
                    eEgitim: "5",
                    gorev: "5",
                    video: "1",
                    explain: TTexts.explain1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
