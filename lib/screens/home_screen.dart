import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text('Home Screen Body'),
      ),
    );
  }
}
