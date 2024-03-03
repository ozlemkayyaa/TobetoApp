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

class Mobil extends StatelessWidget {
  const Mobil({super.key});

  @override
  Widget build(BuildContext context) {
    List<GoTrainingModel> trainingData11 = GoTrainingData.getLessons11();

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
            const GoEducationHeader(title: TTexts.mobil),
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
                      ...trainingData11
                          .map((data) => GoTrainingWidget(lessonData: data)),
                    ],
                  ),

                  // Hakkında
                  const AboutWidget(
                    baslangic: TTexts.baslangic1,
                    bitis: TTexts.bitis1,
                    tahminiSure: TTexts.tahminiSure1,
                    egitimTuru: TTexts.egitimTuru1,
                    kategori: TTexts.category,
                    seviye: TTexts.seviye1,
                    icerik: TTexts.icerik1,
                    ureticiFirma: TTexts.ureticiFirma,
                    eEgitim: TTexts.eEgitim1,
                    gorev: TTexts.gorev1,
                    video: TTexts.video1,
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
