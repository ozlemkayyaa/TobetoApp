import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp());

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reviews Screen',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Reviews Screen'),
        ),
        body: const Center(
          child: Text('Reviews Screen'),
        ),
      ),
    );
  }
}
