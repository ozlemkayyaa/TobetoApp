import 'package:flutter/material.dart';
import 'package:tobeto/features/screens/training/models/go_training_model.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    super.key,
    required this.lessonData,
  });

  final GoTrainingModel lessonData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 360,
            child: Column(
              children: [
                // Eğitim Resmi
                Image(
                  image: AssetImage(lessonData.image),
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 260,
                ),
                const SizedBox(height: TSizes.sm),

                // Eğitim başlığı
                Padding(
                  padding: const EdgeInsets.only(
                    left: TSizes.md,
                    bottom: TSizes.xs,
                  ),
                  child: Text(
                    lessonData.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(height: TSizes.sm),

                // Video bilgisi
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.md),
                  child: Row(
                    children: [
                      const Text(TTexts.video),
                      Text(lessonData.time),
                      const SizedBox(width: TSizes.md),
                      const Icon(Icons.circle_rounded),
                      const SizedBox(width: TSizes.xs),
                      const Text(TTexts.notStart),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.md),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
