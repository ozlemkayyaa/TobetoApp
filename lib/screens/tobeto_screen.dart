import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp());

class TobetoScreen extends StatelessWidget {
  const TobetoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tobeto Screen',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tobeto Screen'),
        ),
        body: const Center(
          child: Text('Tobeto Screen'),
        ),
      ),
    );
  }
}
