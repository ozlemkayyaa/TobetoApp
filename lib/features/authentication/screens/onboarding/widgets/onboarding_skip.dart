import 'package:flutter/material.dart';
import 'package:tobeto/features/authentication/screens/login/login_screen.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtility.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
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
        child: const Text("Skip"),
      ),
    );
  }
}
