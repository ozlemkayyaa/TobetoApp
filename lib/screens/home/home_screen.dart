import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto/api/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/screens/home/widgets/tabbar_view_widget.dart';
import 'package:tobeto/screens/home/widgets/tabbar_widget.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/helpers/helper_functions.dart';
import 'package:tobeto/utils/extensions/string_extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(TImages.appBarLogo, height: 18),
          ]),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: TSizes.defaultSpace),
              child: Icon(Iconsax.profile_circle),
            )
          ],
        ),
        drawer: const DrawerWidget(),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            // Listener kısmı
          },
          builder: (context, state) {
            if (state is Authenticated && state.userName != null) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: TSizes.defaultSpace),
                    Padding(
                      padding: const EdgeInsets.only(left: TSizes.sm),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${TTexts.tobetoPurple} ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .apply(color: TColors.primary),
                            ),
                            TextSpan(
                              text: TTexts.welcome,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            TextSpan(
                              text:
                                  '${state.userName?.capitalizeFirstLetter()} ',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: TSizes.xl),
                    // İkinci Text
                    Padding(
                      padding: const EdgeInsets.only(left: TSizes.xs),
                      child: Text(
                        TTexts.introduction,
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: TSizes.xl),
                    // İstanbul Kodluyor Resmi
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(
                              dark
                                  ? TImages.istanbulWhite
                                  : TImages.istanbulBlack,
                            ),
                            width: 150,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: TSizes.xs),
                    const TabBarWidget(),
                    const TabBarViewWidget(),
                  ],
                ),
              );
            } else if (state is Authenticated && state.userName == null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: TSizes.defaultSpace),
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.sm),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${TTexts.tobetoPurple} ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .apply(color: TColors.primary),
                              ),
                              TextSpan(
                                text: TTexts.welcome,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.emoji_emotions,
                          color: TColors.primary,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.xl),
                  // İkinci Text
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.xs),
                    child: Text(
                      TTexts.introduction,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: TSizes.lg),
                  // İstanbul Kodluyor Resmi
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                            dark
                                ? TImages.istanbulWhite
                                : TImages.istanbulBlack,
                          ),
                          width: 160,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.md),
                  const TabBarWidget(),
                  const TabBarViewWidget(),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
