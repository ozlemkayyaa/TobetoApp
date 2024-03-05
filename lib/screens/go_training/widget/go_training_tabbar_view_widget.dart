import 'package:flutter/material.dart';
import 'package:tobeto/screens/go_training/data/go_training_data.dart';
import 'package:tobeto/screens/go_training/models/go_training_model.dart';
import 'package:tobeto/screens/go_training/widget/about_widget.dart';
import 'package:tobeto/screens/go_training/widget/go_training_widget.dart';
import 'package:tobeto/utils/constants/texts.dart';

class GoTrainingTabBarViewWidget extends StatefulWidget {
  const GoTrainingTabBarViewWidget({
    super.key,
  });

  @override
  State<GoTrainingTabBarViewWidget> createState() =>
      _GoTrainingTabBarViewWidgetState();
}

class _GoTrainingTabBarViewWidgetState
    extends State<GoTrainingTabBarViewWidget> {
  @override
  Widget build(BuildContext context) {
    List<GoTrainingModel> trainingData = GoTrainingData.getLessons1();
    List<GoTrainingModel> trainingData2 = GoTrainingData.getLessons2();
    List<GoTrainingModel> trainingData3 = GoTrainingData.getLessons3();
    List<GoTrainingModel> trainingData4 = GoTrainingData.getLessons4();
    List<GoTrainingModel> trainingData5 = GoTrainingData.getLessons5();
    List<GoTrainingModel> trainingData6 = GoTrainingData.getLessons6();
    List<GoTrainingModel> trainingData7 = GoTrainingData.getLessons7();
    List<GoTrainingModel> trainingData8 = GoTrainingData.getLessons8();
    return Expanded(
      child: TabBarView(
        children: [
          // İçerik
          ListView(
            children: [
              ...trainingData.map((data) => GoTrainingWidget(lessonData: data)),
              ...trainingData2
                  .map((data) => GoTrainingWidget(lessonData: data)),
              ...trainingData3
                  .map((data) => GoTrainingWidget(lessonData: data)),
              ...trainingData4
                  .map((data) => GoTrainingWidget(lessonData: data)),
              ...trainingData5
                  .map((data) => GoTrainingWidget(lessonData: data)),
              ...trainingData6
                  .map((data) => GoTrainingWidget(lessonData: data)),
              ...trainingData7
                  .map((data) => GoTrainingWidget(lessonData: data)),
              ...trainingData8
                  .map((data) => GoTrainingWidget(lessonData: data)),
            ],
          ),

          // Hakkında
          const AboutWidget(
            baslangic: TTexts.baslangic1,
            bitis: TTexts.bitis1,
            tahminiSure: TTexts.tahminiSure1,
            egitimTuru: TTexts.egitimTuru1,
            kategori: TTexts.category1,
            seviye: TTexts.seviye1,
            icerik: TTexts.icerik1,
            ureticiFirma: TTexts.ureticiFirma,
            eEgitim: TTexts.eEgitim1,
            gorev: TTexts.gorev1,
            video: TTexts.video1,
            explain: TTexts.explain1,
          ),
        ],
      ),
    );
  }
}
