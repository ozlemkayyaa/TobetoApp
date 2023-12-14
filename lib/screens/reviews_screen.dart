import 'package:flutter/material.dart';
import 'package:tobeto/widget/drawer_widget.dart';

void main() => runApp(const MaterialApp());

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: const Text('Reviews Screen'),
      ),
      drawer: const DrawerWidget(),
      body: const Center(
        child: Text('Reviews Body'),
      ),
    );
  }
}
