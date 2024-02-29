import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tobeto/screens/quiz/data/questions.dart';
import 'package:tobeto/screens/quiz/result_screen.dart';
import 'package:tobeto/utils/constants/colors.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/sizes.dart';

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

  Color background = TColors.white;
  Color trueAnswer = TColors.success;
  Color wrongAnswer = TColors.error;
  Color buttonControl = TColors.primary;
  Color appBarColor = TColors.primary;
  int score = 0;

  @override
  Widget build(BuildContext buildcontext) {
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
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(TSizes.md),
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
                    color: TColors.profile2, height: 15.0, thickness: 2.0),
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
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                            color: TColors.secondary, width: 4.0),
                      ),
                      child: Text(
                        index + 1 == questions.length
                            ? "Sonucu Göster"
                            : "Sıradaki Soru",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
