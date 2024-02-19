import 'package:tobeto/screens/catalog/training/models/go_training_model.dart';
import 'package:tobeto/utils/constants/image_strings.dart';
import 'package:tobeto/utils/constants/texts.dart';

class GoTrainingData {
  static List<GoTrainingModel> getLessons1() {
    return [
      GoTrainingModel(
        title: TTexts.title1,
        time: "2dk",
        image: TImages.e1,
        like: 22,
        visible: 189,
        content: TTexts.content1,
        interest: TTexts.interest1,
      )
    ];
  }

  static List<GoTrainingModel> getLessons2() {
    return [
      GoTrainingModel(
        title: TTexts.title2,
        time: "1 sa 30 dk",
        image: TImages.e2,
        like: 21,
        visible: 142,
        content: TTexts.content2,
        interest: TTexts.interest2,
      )
    ];
  }

  static List<GoTrainingModel> getLessons3() {
    return [
      GoTrainingModel(
        title: TTexts.title3,
        time: "1 sa 30 dk",
        image: TImages.e3,
        like: 30,
        visible: 97,
        content: TTexts.content3,
        interest: TTexts.interest3,
      )
    ];
  }

  static List<GoTrainingModel> getLessons4() {
    return [
      GoTrainingModel(
        title: TTexts.title4,
        time: "8 dk",
        image: TImages.e4,
        like: 18,
        visible: 76,
        content: TTexts.content4,
        interest: TTexts.interest4,
      )
    ];
  }

  static List<GoTrainingModel> getLessons5() {
    return [
      GoTrainingModel(
        title: TTexts.title5,
        time: "4 dk",
        image: TImages.e5,
        like: 17,
        visible: 48,
        content: TTexts.content5,
        interest: TTexts.interest5,
      )
    ];
  }

  static List<GoTrainingModel> getLessons6() {
    return [
      GoTrainingModel(
        title: TTexts.title6,
        time: "4 dk",
        image: TImages.e6,
        like: 19,
        visible: 56,
        content: TTexts.content6,
        interest: TTexts.interest6,
      )
    ];
  }

  static List<GoTrainingModel> getLessons7() {
    return [
      GoTrainingModel(
        title: TTexts.title7,
        time: "4 dk",
        image: TImages.e7,
        like: 16,
        visible: 43,
        content: TTexts.content7,
        interest: TTexts.interest7,
      )
    ];
  }

  static List<GoTrainingModel> getLessons8() {
    return [
      GoTrainingModel(
        title: TTexts.title8,
        time: "5 dk",
        image: TImages.e8,
        like: 18,
        visible: 43,
        content: TTexts.content8,
        interest: TTexts.interest8,
      )
    ];
  }
}
