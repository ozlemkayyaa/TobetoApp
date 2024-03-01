import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/home/widgets/drawer_widget.dart';
import 'package:tobeto/screens/exam/widgets/exam_widget.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExamWidget(
                  title: TTexts.examTitle1,
                  message: TTexts.examMessage,
                  testName: TTexts.examTitle1,
                  buttonPadding: 42),
              SizedBox(height: TSizes.md),
              ExamWidget(
                  title: TTexts.examTitle2,
                  message: TTexts.examMessage,
                  testName: TTexts.examTitle2,
                  buttonPadding: 170),
              SizedBox(height: TSizes.md),
              ExamWidget(
                  title: TTexts.examTitle3,
                  message: TTexts.examMessage,
                  testName: TTexts.examTitle3,
                  buttonPadding: 168),
              SizedBox(height: TSizes.md),
              ExamWidget(
                  title: TTexts.examTitle4,
                  message: TTexts.examMessage,
                  testName: TTexts.examTitle4,
                  buttonPadding: 173),
              SizedBox(height: TSizes.md),
              ExamWidget(
                  title: TTexts.examTitle5,
                  message: TTexts.examMessage,
                  testName: TTexts.examTitle5,
                  buttonPadding: 74),
              SizedBox(height: TSizes.md),
              ExamWidget(
                  title: TTexts.examTitle6,
                  message: TTexts.examMessage,
                  testName: TTexts.examTitle6,
                  buttonPadding: 53),
              SizedBox(height: TSizes.md),
              ExamWidget(
                  title: TTexts.examTitle1,
                  message: TTexts.examMessage,
                  testName: TTexts.examTitle1,
                  buttonPadding: 42),
              SizedBox(height: TSizes.md),
              ExamWidget(
                  title: TTexts.examTitle2,
                  message: TTexts.examMessage,
                  testName: TTexts.examTitle2,
                  buttonPadding: 170),
              SizedBox(height: TSizes.md),
              ExamWidget(
                  title: TTexts.examTitle3,
                  message: TTexts.examMessage,
                  testName: TTexts.examTitle3,
                  buttonPadding: 168),
              SizedBox(height: TSizes.md),
              ExamWidget(
                  title: TTexts.examTitle4,
                  message: TTexts.examMessage,
                  testName: TTexts.examTitle4,
                  buttonPadding: 173),
              SizedBox(height: TSizes.md),
              ExamWidget(
                  title: TTexts.examTitle5,
                  message: TTexts.examMessage,
                  testName: TTexts.examTitle5,
                  buttonPadding: 74),
              SizedBox(height: TSizes.md),
              ExamWidget(
                  title: TTexts.examTitle6,
                  message: TTexts.examMessage,
                  testName: TTexts.examTitle6,
                  buttonPadding: 53),
            ],
          ),
        ),
      ),
    );
  }
}
