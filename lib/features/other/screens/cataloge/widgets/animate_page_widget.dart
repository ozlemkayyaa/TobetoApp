import 'package:flutter/material.dart';
import 'package:tobeto/features/other/screens/cataloge/data/training_data.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class AnimatePageWidget extends StatelessWidget {
  const AnimatePageWidget({
    super.key,
    required this.itemsPerPage,
    required PageController pageController,
    required this.currentPage,
  }) : _pageController = pageController;

  final int itemsPerPage;
  final PageController _pageController;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TSizes.spaceBtwSections,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          (trainingDataList.length / itemsPerPage).ceil(),
          (index) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(TSizes.sm),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: currentPage == index ? TColors.info : TColors.darkGrey,
                ),
                child: Text(
                  (index + 1).toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
