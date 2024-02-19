import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';

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
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 90, left: TSizes.sm, right: TSizes.sm),
              child: Form(
                child: TextFormField(
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: TColors.grey,
                      suffixIcon: Icon(CupertinoIcons.search),
                      suffixIconColor: TColors.darkerGrey,
                      labelText: "Eğitim Arayın...",
                      labelStyle: TextStyle(color: TColors.darkerGrey)),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
