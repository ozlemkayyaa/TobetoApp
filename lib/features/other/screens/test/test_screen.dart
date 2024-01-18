import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/features/other/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/features/other/screens/test/widgets/test_widget.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

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
      body: const Padding(
        padding: EdgeInsets.all(TSizes.sm),
        child: Column(
          children: [
            TestWidget(
                testName: "Tobeto İşte Başarı Modeli", buttonPadding: 42),
            SizedBox(height: TSizes.md),
            TestWidget(testName: "Front End", buttonPadding: 170),
            SizedBox(height: TSizes.md),
            TestWidget(testName: "Full Stack", buttonPadding: 168),
            SizedBox(height: TSizes.md),
            TestWidget(testName: "Back End", buttonPadding: 173),
            SizedBox(height: TSizes.md),
            TestWidget(testName: "Microsoft SQL Server", buttonPadding: 74),
            SizedBox(height: TSizes.md),
            TestWidget(testName: "Masaüstü Programlama", buttonPadding: 53),
          ],
        ),
      ),
    );
  }
}
