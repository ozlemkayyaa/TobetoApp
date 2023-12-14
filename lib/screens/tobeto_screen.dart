import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp());

class TobetoScreen extends StatelessWidget {
  const TobetoScreen({super.key});

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
        title: const Text('Tobeto Screen'),
      ),
      body: const Center(
        child: Text('Tobeto Body'),
      ),
    );
  }
}
