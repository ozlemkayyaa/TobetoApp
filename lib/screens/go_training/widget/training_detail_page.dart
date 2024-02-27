import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/go_training/models/go_training_model.dart';
import 'package:tobeto/screens/go_training/widget/detail_widget.dart';
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
