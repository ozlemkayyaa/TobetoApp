import 'package:flutter/material.dart';

class TrainingData {
  final String title;
  final String time;
  final String image;
  final Widget trainingPage; // Yeni eklenen sayfa

  TrainingData({
    required this.title,
    required this.time,
    required this.image,
    required this.trainingPage,
  });
}
