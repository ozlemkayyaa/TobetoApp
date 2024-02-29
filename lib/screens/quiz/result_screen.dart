import 'package:flutter/material.dart';
import 'package:tobeto/screens/exam/exam_screen.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    Color background = Colors.white;
    Color buttonColor = const Color.fromARGB(255, 148, 0, 253);
    Color appBarColor = const Color.fromARGB(255, 148, 0, 253);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WitWhiz",
          style: TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: appBarColor,
      ),
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "CONGRATULATIONS!",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 1, 1),
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 80.0,
            ),
            const Text(
              "SCORE",
              style: TextStyle(
                color: Color.fromARGB(255, 99, 17, 162),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              "${widget.score}",
              style: const TextStyle(
                color: Color.fromARGB(255, 99, 17, 162),
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 80.0,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExamScreen()));
              },
              color: buttonColor,
              child: const Text(
                "Try Again",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
