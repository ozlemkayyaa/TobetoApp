import 'package:flutter/material.dart';
import 'package:tobeto/widget/drawer_widget.dart';

void main() => runApp(const MaterialApp());

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

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
        title: const Text('Calendar Screen'),
      ),
      drawer: const DrawerWidget(),
      body: const Center(
        child: Text('Calendar Screen Body'),
      ),
    );
  }
}
