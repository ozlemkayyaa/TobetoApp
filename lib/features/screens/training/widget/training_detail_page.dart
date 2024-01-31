import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/features/screens/training/models/go_training_model.dart';
import 'package:tobeto/features/screens/training/widget/detail_widget.dart';
import 'package:tobeto/features/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class TrainingDetailPage extends StatelessWidget {
  final GoTrainingModel lessonData;

  const TrainingDetailPage({
    super.key,
    required this.lessonData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: DetailWidget(
        lessonData: lessonData,
        category: "Kişisel Mükemmellik",
        content: "Konu Uzmanı Videosu",
        factory: "Enocta",
        language: "Türkçe",
      ),
    );
  }
}
