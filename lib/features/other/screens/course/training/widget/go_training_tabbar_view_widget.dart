import 'package:flutter/material.dart';
import 'package:tobeto/features/other/screens/course/training/data/go_training_data.dart';
import 'package:tobeto/features/other/screens/course/training/models/go_training_model.dart';
import 'package:tobeto/features/other/screens/course/training/widget/go_training_widget.dart';

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
          // İlk Sekme

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

          // İkinci Sekme
          const Center(
            child: Text("İkinci Sayfa"),
          ),
        ],
      ),
    );
  }
}
