import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobeto/screens/education/widgets/search_button_widget.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class CatalogHeaderWidget extends StatelessWidget {
  const CatalogHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          image: AssetImage(TImages.startLearn),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 20),
          child: Text(
            "Öğrenmeye  Başla!",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .apply(color: TColors.white),
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
                padding:
                    EdgeInsets.only(top: 90, left: TSizes.sm, right: TSizes.sm),
                child: SearchButtonWidget(
                  buttonName: TTexts.searchEducatiion,
                )),
          ),
        )
      ],
    );
  }
}
