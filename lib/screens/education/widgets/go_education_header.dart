import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class GoEducationHeader extends StatefulWidget {
  const GoEducationHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<GoEducationHeader> createState() => _GoEducationHeaderState();
}

class _GoEducationHeaderState extends State<GoEducationHeader> {
  Color _favoriteColor = TColors.black;
  Color _bookmarkColor = TColors.black;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Başlık
        Padding(
          padding: const EdgeInsets.all(TSizes.md),
          child: Text(
            widget.title,
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
        Padding(
          padding: const EdgeInsets.only(right: TSizes.lg),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.favorite_outlined),
                color: _favoriteColor,
                onPressed: () {
                  setState(() {
                    _favoriteColor = _favoriteColor == TColors.error
                        ? TColors.black
                        : TColors.error;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.bookmark_outlined),
                color: _bookmarkColor,
                onPressed: () {
                  setState(() {
                    _bookmarkColor = _bookmarkColor == TColors.accent
                        ? TColors.black
                        : TColors.accent;
                  });
                },
              ),
            ],
          ),
        ),

        // İlerlemeyi gösteren indicator
        Padding(
          padding: const EdgeInsets.all(TSizes.xs),
          child: LinearPercentIndicator(
            width: 395,
            lineHeight: 10.0,
            percent: 0.1,
            barRadius: const Radius.circular(20),
            backgroundColor: TColors.grey,
            progressColor: TColors.info,
          ),
        ),
      ],
    );
  }
}
