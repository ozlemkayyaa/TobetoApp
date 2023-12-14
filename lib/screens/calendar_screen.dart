import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp());

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar Screen',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calendar Screen'),
        ),
        body: const Center(
          child: Text('Calendar Screen'),
        ),
      ),
    );
  }
}
