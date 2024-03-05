import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class AboutWidget extends StatelessWidget {
  final String baslangic;
  final String bitis;
  final String tahminiSure;
  final String egitimTuru;
  final String kategori;
  final String seviye;
  final String icerik;
  final String? gorev;
  final String? video;
  final String? eEgitim;
  final String ureticiFirma;
  final String explain;

  const AboutWidget({
    super.key,
    required this.baslangic,
    required this.bitis,
    required this.tahminiSure,
    required this.egitimTuru,
    required this.kategori,
    required this.seviye,
    required this.icerik,
    this.gorev,
    this.video,
    this.eEgitim,
    required this.ureticiFirma,
    required this.explain,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: TSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var entry in {
              TTexts.baslangic: baslangic,
              TTexts.bitis: bitis,
              TTexts.tahminiSure: tahminiSure,
              TTexts.egitimTuru: egitimTuru,
              TTexts.category: kategori,
              TTexts.level: seviye,
              TTexts.icerik: icerik,
              if (gorev != null) TTexts.gorev: gorev!,
              if (video != null) TTexts.video: video!,
              if (eEgitim != null) TTexts.eEgitim: eEgitim!,
              TTexts.ureticiFirma: ureticiFirma,
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
                    Text(entry.key,
                        style: Theme.of(context).textTheme.headlineSmall),
                    Text(entry.value,
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
            const SizedBox(height: TSizes.md),
            Padding(
              padding: const EdgeInsets.only(
                  left: TSizes.iconXs,
                  right: TSizes.iconXs,
                  top: TSizes.xs,
                  bottom: TSizes.xs),
              child: Text(TTexts.explain,
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: TSizes.sm,
                  right: TSizes.sm,
                  top: TSizes.xs,
                  bottom: TSizes.xs),
              child:
                  Text(explain, style: Theme.of(context).textTheme.bodySmall),
            ),
          ],
        ),
      ),
    );
  }
}
