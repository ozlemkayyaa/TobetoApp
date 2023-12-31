import 'package:flutter/material.dart';
import 'package:tobeto/features/authentication/screens/onboarding/widgets/onboarding_button.dart';
import 'package:tobeto/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:tobeto/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:tobeto/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/texts.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable Pages
          PageView(
            controller: _pageController,
            children: const [
              OnBoardingPage(
                image: TImages.welcome,
                title: TTexts.onboardingTitle1,
                subTitle: TTexts.onboardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.personal,
                title: TTexts.onboardingTitle2,
                subTitle: TTexts.onboardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.coding,
                title: TTexts.onboardingTitle3,
                subTitle: TTexts.onboardingSubTitle3,
              ),
            ],
          ),
          // Skip Button
          OnBoardingSkip(pageController: _pageController),
          // Dot Navigation SmoothPageIndicator(paketi yükle)
          OnBoardingDotNavigation(pageController: _pageController),
          // Circular Button
          OnBoardingButton(pageController: _pageController),
        ],
      ),
    );
  }
}
