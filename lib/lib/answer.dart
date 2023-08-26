import 'package:flutter/material.dart';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({super.key});

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  List<String> answers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Answers'),
        backgroundColor: Color.fromARGB(255, 98, 82, 203),
      ),
      body: Column(
        children: [
          for (int i = 0; i < answers.length - 1; i++)
            Container(
              height: 100,
              width: 100,
              child: Text(answers[i]),
            )
        ],
      ),
    );
  }
}
