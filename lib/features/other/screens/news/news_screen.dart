import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/features/other/screens/course/widgets/choise_button_widget.dart';
import 'package:tobeto/features/other/screens/course/widgets/search_button_widget.dart';
import 'package:tobeto/features/other/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/features/other/screens/home/widgets/tabbar_widgets/news_widget.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';
import 'package:tobeto/utils/theme/custom_themes/button_theme.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(TImages.news),
            ),

            // Arama Butonu
            TabButtonWidget(
              iconColor: TColors.black,
              icon: Icons.search,
              buttonName: TTexts.searchButton,
              styleFrom: ButtonStyles.elevatedButtonStyle(),
            ),

            // Tür Butou
            TabButtonWidget(
              iconColor: TColors.black,
              icon: Icons.keyboard_arrow_down,
              buttonName: TTexts.type,
              styleFrom: ButtonStyles.elevatedButtonStyle(),
            ),

            // Organizasyon Butonu
            ChoiseButtonWidget(
              buttonName: TTexts.organization,
              styleFrom: ButtonStyles.elevatedButtonStyle(),
            ),

            // Sıralama
            TabButtonWidget(
              iconColor: TColors.black,
              icon: Icons.keyboard_arrow_down,
              buttonName: TTexts.sort,
              styleFrom: ButtonStyles.elevatedButtonStyle(),
            ),
            const SizedBox(height: TSizes.sm),
            const NewsWidget(
                announcement: TTexts.announce1, dateTime: TTexts.date1),
            const SizedBox(height: TSizes.sm),
            const NewsWidget(
                announcement: TTexts.announce2, dateTime: TTexts.date2),
            const SizedBox(height: TSizes.sm),
            const NewsWidget(
                announcement: TTexts.announce3, dateTime: TTexts.date3),
            const SizedBox(height: TSizes.sm),
            const NewsWidget(
                announcement: TTexts.announce1, dateTime: TTexts.date1),
            const SizedBox(height: TSizes.sm),
            const NewsWidget(
                announcement: TTexts.announce2, dateTime: TTexts.date2),
            const SizedBox(height: TSizes.sm),
            const NewsWidget(
                announcement: TTexts.announce3, dateTime: TTexts.date3),
            const SizedBox(height: TSizes.sm),
          ],
        ),
      ),
    );
  }
}

class CupertinoIcon {}



/*
Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: selectedOption,
              onChanged: (String? newValue) {
                selectedOption = newValue!;
                print('Seçilen: $selectedOption');
              },
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
 */