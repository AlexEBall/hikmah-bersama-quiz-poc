import 'package:flutter/material.dart';

import '../models/question.dart';

class QuizScreen extends StatefulWidget {
  static const String id = 'quiz_screen';
  final List<Question> questions;

  QuizScreen({@required this.questions});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.questions[0].question);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Centered'),
      ),
    );
  }
}
