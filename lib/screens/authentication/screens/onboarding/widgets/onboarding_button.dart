import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/authentication/screens/login/login_screen.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/device/device_utility.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtility.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(), backgroundColor: TColors.primary),
        onPressed: () {
          // Eğer son sayfadaysak login sayfasına geçiş yap
          if (pageController.page == 2) {
            // 2, son sayfanın index'i
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const LoginScreen()), // LoginScreen yerine geçiş yapmak istediğiniz sayfanın adını ekleyin
            );
          } else {
            pageController.nextPage(
                duration: const Duration(microseconds: 300),
                curve: Curves.ease);
          }
        },
        child: const Icon(
          Iconsax.arrow_right_3,
          color: TColors.white,
        ),
      ),
    );
  }
}
