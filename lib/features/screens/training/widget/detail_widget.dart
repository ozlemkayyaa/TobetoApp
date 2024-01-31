import 'package:flutter/material.dart';
import 'package:tobeto/features/screens/training/models/go_training_model.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class DetailWidget extends StatelessWidget {
  final String category;
  final String language;
  final String content;
  final String factory;

  const DetailWidget({
    super.key,
    required this.lessonData,
    required this.category,
    required this.language,
    required this.content,
    required this.factory,
  });

  final GoTrainingModel lessonData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Eğitim Resmi
              Image(
                image: AssetImage(lessonData.image),
                fit: BoxFit.fill,
                width: 200,
                height: 150,
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
                    Container(
                      decoration: BoxDecoration(
                          color: TColors.info,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: TColors.info)),
                      child: Padding(
                        padding: const EdgeInsets.all(TSizes.xs),
                        child: Text("VIDEO",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .apply(color: TColors.white)),
                      ),
                    ),
                    const SizedBox(width: TSizes.xl),
                    const Icon(Icons.access_alarm),
                    const SizedBox(width: TSizes.sm),
                    Text(lessonData.time),
                    const SizedBox(width: TSizes.xl),
                    const Icon(Icons.visibility_outlined),
                    const SizedBox(width: TSizes.sm),
                    Text(lessonData.visible.toString()),
                    const SizedBox(width: TSizes.xl),
                    const Icon(Icons.favorite_outline),
                    const SizedBox(width: TSizes.sm),
                    Text(lessonData.like.toString()),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.md),
              Row(
                children: [
                  const SizedBox(width: TSizes.sm),
                  const Padding(
                    padding: EdgeInsets.all(TSizes.xs),
                    child: Icon(Icons.circle_rounded,
                        color: TColors.darkGrey, size: 15),
                  ),
                  const SizedBox(width: TSizes.xs),
                  const Text(TTexts.notStart),
                  Padding(
                    padding: const EdgeInsets.only(left: 150.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(5)),
                        child: const Text(TTexts.go)),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: TSizes.sm),
          for (var entry in {
            "Kategori": category,
            "Dili": language,
            "Alt Tip": content,
            "Üretici Firma": factory,
          }.entries)
            Padding(
              padding: const EdgeInsets.only(
                  left: TSizes.md,
                  right: TSizes.md,
                  top: TSizes.xs,
                  bottom: TSizes.xs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    entry.key,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    entry.value,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(
                left: TSizes.md,
                right: TSizes.md,
                top: TSizes.sm,
                bottom: TSizes.xs),
            child: Text("İçerik",
                style: Theme.of(context).textTheme.headlineSmall),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: TSizes.md,
                right: TSizes.md,
                top: TSizes.xs,
                bottom: TSizes.xs),
            child: Text(lessonData.content),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: TSizes.md,
                right: TSizes.md,
                top: TSizes.sm,
                bottom: TSizes.xs),
            child: Text("İlgi Alanları",
                style: Theme.of(context).textTheme.headlineSmall),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: TSizes.md,
                right: TSizes.md,
                top: TSizes.xs,
                bottom: TSizes.xs),
            child: Text(lessonData.interest),
          ),
        ],
      ),
    );
  }
}
