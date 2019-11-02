import 'package:flutter/foundation.dart';

enum Type { multiple, boolean }

enum Difficulty { easy, medium, hard }

class Question {
  final String categoryName;
  final Type type;
  final Difficulty difficulty;
  final String question;
  final String correctAnswer;
  final List<dynamic> incorrectAnswers;

  Question(
      {@required this.categoryName,
      @required this.type,
      @required this.difficulty,
      @required this.question,
      @required this.correctAnswer,
      @required this.incorrectAnswers});

  // Question.fromMap(Map<String, dynamic> data)
  //     : categoryName = data["category"],
  //       type = data["type"] == "multiple" ? Type.multiple : Type.boolean,
  //       difficulty = data["difficulty"] == "easy"
  //           ? Difficulty.easy
  //           : data["difficulty"] == "medium"
  //               ? Difficulty.medium
  //               : Difficulty.hard,
  //       question = data["question"],
  //       correctAnswer = data["correct_answer"],
  //       incorrectAnswers = data["incorrect_answers"];

  // TODO: Eventually implement this
  Question copyWith(
      {String this.categoryName,
      Type this.type,
      Difficulty this.difficulty,
      String this.question,
      String this.correctAnswer,
      List<dynamic> this.incorrectAnswers}) {
    return Question(
        categoryName: categoryName ?? this.categoryName,
        type: type ?? this.type,
        difficulty: difficulty ?? this.difficulty,
        question: question ?? this.question,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers);
  }

  // static List<Question> fromData(List<Map<String, dynamic>> data) {
  //   return data.map((question) => Question.fromMap(question)).toList();
  // }
}
