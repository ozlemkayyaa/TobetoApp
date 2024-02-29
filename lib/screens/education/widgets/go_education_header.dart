import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class GoEducationHeader extends StatelessWidget {
  const GoEducationHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Başlık
        Padding(
          padding: const EdgeInsets.all(TSizes.md),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),

        // Hadi Başlayalım yazısı.
        Padding(
          padding: const EdgeInsets.only(left: TSizes.md),
          child: Text(
            TTexts.lets,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .apply(color: TColors.info),
          ),
        ),

        // Beğenme ve Kaydetme iconu
        const Padding(
          padding: EdgeInsets.only(right: TSizes.lg),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.favorite_outline_outlined),
              SizedBox(width: TSizes.xs),
              Icon(Icons.bookmark_outline_outlined),
            ],
          ),
        ),

        // İlerlemeyi gösteren indicator
        Padding(
          padding: const EdgeInsets.all(TSizes.xs),
          child: LinearPercentIndicator(
            width: 395,
            lineHeight: 10.0,
            percent: 0.2,
            barRadius: const Radius.circular(20),
            backgroundColor: TColors.grey,
            progressColor: TColors.info,
          ),
        ),
      ],
    );
  }
}
