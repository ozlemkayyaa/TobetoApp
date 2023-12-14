import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp());

class CatalogeScreen extends StatelessWidget {
  const CatalogeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cataloge Screen',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cataloge Screen'),
        ),
        body: const Center(
          child: Text('Cataloge Screen'),
        ),
      ),
    );
  }
}
