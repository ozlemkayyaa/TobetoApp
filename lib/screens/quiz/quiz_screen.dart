import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/quiz/data/questions.dart';
import 'package:tobeto/screens/quiz/result_screen.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';
import 'package:tobeto/utils/constants/texts.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
  });

  @override
  State<QuizScreen> createState() {
    return _QuizScreen();
  }
}

class _QuizScreen extends State<QuizScreen> {
  PageController? controller = PageController(initialPage: 0);
  bool isPressed = false;

  Color trueAnswer = TColors.success;
  Color wrongAnswer = TColors.error;
  Color buttonControl = TColors.primary;

  int score = 0;

  @override
  Widget build(BuildContext buildcontext) {
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
      body: Padding(
        padding: const EdgeInsets.only(
            left: TSizes.md, right: TSizes.md, top: TSizes.xl),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller!,
          onPageChanged: (page) {
            setState(
              () {
                isPressed = false;
              },
            );
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text("Soru ${index + 1} / ${questions.length}",
                      style: Theme.of(context).textTheme.headlineLarge),
                ),
                const Divider(
                    color: TColors.darkGrey, height: 15.0, thickness: 2.0),
                const SizedBox(height: 25.0),
                Text(questions[index].question!,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: TSizes.spaceBtwSections),
                for (int i = 0; i < questions[index].answer!.length; i++)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: TSizes.md),
                    child: MaterialButton(
                      shape: const StadiumBorder(),
                      color: isPressed
                          ? questions[index].answer!.entries.toList()[i].value
                              ? trueAnswer
                              : wrongAnswer
                          : buttonControl,
                      padding: const EdgeInsets.symmetric(
                          vertical: TSizes.fontSizeLg),
                      onPressed: isPressed
                          ? () {}
                          : () {
                              setState(() {
                                isPressed = true;
                              });
                              if (questions[index]
                                  .answer!
                                  .entries
                                  .toList()[i]
                                  .value) {
                                score += 10;
                              } else {
                                setState(() {
                                  buttonControl;
                                });
                              }
                            },
                      child: Text(questions[index].answer!.keys.toList()[i],
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .apply(color: Colors.white)),
                    ),
                  ),
                const SizedBox(height: TSizes.spaceBtwSections),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: isPressed
                          ? index + 1 == questions.length
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (contex) => ResultScreen(score),
                                    ),
                                  );
                                }
                              : () {
                                  controller!.nextPage(
                                      duration:
                                          const Duration(microseconds: 400),
                                      curve: Curves.linear);
                                  setState(() {
                                    isPressed = false;
                                  });
                                }
                          : null,
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                            color: TColors.darkGrey, width: TSizes.xs),
                      ),
                      child: Text(
                          index + 1 == questions.length
                              ? TTexts.result
                              : TTexts.nextQuestion,
                          style: Theme.of(context).textTheme.titleLarge),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
