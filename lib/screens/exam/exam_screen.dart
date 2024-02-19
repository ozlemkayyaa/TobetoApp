import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/screens/exam/widgets/exam_widget.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

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
            ExamWidget(
                testName: "Tobeto İşte Başarı Modeli", buttonPadding: 42),
            SizedBox(height: TSizes.md),
            ExamWidget(testName: "Front End", buttonPadding: 170),
            SizedBox(height: TSizes.md),
            ExamWidget(testName: "Full Stack", buttonPadding: 168),
            SizedBox(height: TSizes.md),
            ExamWidget(testName: "Back End", buttonPadding: 173),
            SizedBox(height: TSizes.md),
            ExamWidget(testName: "Microsoft SQL Server", buttonPadding: 74),
            SizedBox(height: TSizes.md),
            ExamWidget(testName: "Masaüstü Programlama", buttonPadding: 53),
          ],
        ),
      ),
    );
  }
}
