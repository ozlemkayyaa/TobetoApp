import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class ContainerIstkodWidget extends StatelessWidget {
  const ContainerIstkodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const CodeScreen(),
        //     ));
      },
      child: Container(
        height: 150,
        width: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0), // sivri kenar
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [TColors.profile1, TColors.primary],
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(TSizes.sm),
          child: Image(
            image: AssetImage(TImages.istanbulWhite),
          ),
        ),
      ),
    );
  }
}
