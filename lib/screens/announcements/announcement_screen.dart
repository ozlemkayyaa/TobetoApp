import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/announcements/widget/announcement_widget.dart';
import 'package:tobeto/screens/education/widgets/search_button_widget.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(TImages.appBarLogo, height: TSizes.fontSizeLg),
        ]),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: TSizes.defaultSpace),
            child: Icon(Iconsax.profile_circle),
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(TImages.news),
            ),

            // Arama Butonu
            SizedBox(height: TSizes.sm),
            SearchButtonWidget(
              buttonName: TTexts.searchButton,
            ),

            SizedBox(height: TSizes.sm),
            AnnouncementWidget(
                title: TTexts.baslik1,
                message: TTexts.duyuru1,
                announcement: TTexts.announce1,
                dateTime: TTexts.date1),
            SizedBox(height: TSizes.sm),
            AnnouncementWidget(
                title: TTexts.baslik2,
                message: TTexts.duyuru2,
                announcement: TTexts.announce2,
                dateTime: TTexts.date2),
            SizedBox(height: TSizes.sm),
            AnnouncementWidget(
                title: TTexts.baslik3,
                message: TTexts.duyuru3,
                announcement: TTexts.announce3,
                dateTime: TTexts.date3),
            SizedBox(height: TSizes.sm),
            AnnouncementWidget(
                title: TTexts.baslik1,
                message: TTexts.duyuru1,
                announcement: TTexts.announce1,
                dateTime: TTexts.date1),
            SizedBox(height: TSizes.sm),
            AnnouncementWidget(
                title: TTexts.baslik2,
                message: TTexts.duyuru2,
                announcement: TTexts.announce2,
                dateTime: TTexts.date2),
            SizedBox(height: TSizes.sm),
            AnnouncementWidget(
                title: TTexts.baslik3,
                message: TTexts.duyuru3,
                announcement: TTexts.announce3,
                dateTime: TTexts.date3),
            SizedBox(height: TSizes.sm),
          ],
        ),
      ),
    );
  }
}
