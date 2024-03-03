import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';

class ApplicationWidget extends StatelessWidget {
  const ApplicationWidget({
    super.key,
    required this.colors,
    required this.accepted,
  });

  final Color colors;
  final String accepted;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Card(
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(TSizes.buttonRadius),
              color: dark ? TColors.darkContainer : TColors.lightContainer,
              border: Border(
                left: BorderSide(
                  color: colors, // Sol kenar rengi
                  width: 8, // Sol kenar genişliği
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // İstanbul Kodluyor başlığı
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(TSizes.sm),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(TTexts.istCod,
                              style: Theme.of(context).textTheme.titleLarge),

                          // Kabul edildi /  Değerlendirmede bu yazının bulunnduğu kutu
                          Padding(
                            padding: const EdgeInsets.only(
                                left: TSizes.loadingIndicatorSize),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: MediaQuery.of(context).size.width * 0.36,
                              decoration: BoxDecoration(
                                color: colors,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(TSizes.lg),
                                    bottomLeft: Radius.circular(TSizes.lg)),
                              ),

                              // Kabul edildi /  Değerlendirmede
                              child: Center(
                                child: Text(accepted,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(color: TColors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Başvuru Formu onaylandı.
                Padding(
                  padding: const EdgeInsets.all(TSizes.xs),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.checkmark_alt,
                        color: colors,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.xs),
                        child: Text(TTexts.formDone,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                    ],
                  ),
                ),

                // Belge Yükleme Formu onaylandı.
                Padding(
                  padding: const EdgeInsets.all(TSizes.xs),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.checkmark_alt,
                        color: colors,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.xs),
                        child: Text(TTexts.documentDone,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
