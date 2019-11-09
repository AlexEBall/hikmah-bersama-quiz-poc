import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import 'package:hikmah_bersama_quiz_poc/models/question.dart';
import 'package:hikmah_bersama_quiz_poc/utils/create_choices.dart';
import 'package:hikmah_bersama_quiz_poc/constants/constants.dart';

@immutable
class QuizState {
  final int currentIndex;
  final List<Color> colors;
  final List<List<String>> options;
  final List<Question> questions;
  final Map<String, String> answers;

  QuizState(
      {@required this.currentIndex,
      @required this.colors,
      @required this.options,
      @required this.questions,
      @required this.answers});

  factory QuizState.inital() {
    return QuizState(
      currentIndex: 0,
      colors: [kPrimary, kPrimary, kPrimary, kPrimary],
      options: createOptions(kQuestions),
      questions: [
        Question(
            categoryName: 'Islam',
            type: Type.multiple,
            difficulty: Difficulty.easy,
            question: 'What do we call the Angels who write down what we do?',
            correctAnswer: 'Kiramin Katibin',
            incorrectAnswers: ['Israfil', 'Mikail', 'Izrail']),
        Question(
            categoryName: 'Islam',
            type: Type.multiple,
            difficulty: Difficulty.easy,
            question: 'Pillars of Islam are also called?',
            correctAnswer: 'Arkanal Islam',
            incorrectAnswers: ['Qadr ul Islam', 'Yusuf Islam', 'Fi Amanillah']),
        Question(
            categoryName: 'Islam',
            type: Type.multiple,
            difficulty: Difficulty.easy,
            question: 'A Prophet is called what in Arabic?',
            correctAnswer: 'Nabi',
            incorrectAnswers: ['Rasul', 'Wahi', 'None of the above']),
        Question(
            categoryName: 'Islam',
            type: Type.multiple,
            difficulty: Difficulty.easy,
            question: 'Islam means to obey Allah (s.w.t) and obey his commands',
            correctAnswer:
                'Islam means to obey Allah (s.w.t) and obey his commands',
            incorrectAnswers: [
              'Islam means to obey our parents',
              'Islam means to obey our teachers and elders',
              'None of the above'
            ]),
        Question(
            categoryName: 'Islam',
            type: Type.multiple,
            difficulty: Difficulty.easy,
            question: 'Allah (s.w.t) has...?',
            correctAnswer: 'A Son',
            incorrectAnswers: ['A Partner', 'No Partner', 'A Daughter']),
        Question(
            categoryName: 'Islam',
            type: Type.multiple,
            difficulty: Difficulty.easy,
            question: 'How many Allah (s.w.t) are there?',
            correctAnswer: 'Three',
            incorrectAnswers: ['Two', 'One', 'Zero']),
        Question(
            categoryName: 'Islam',
            type: Type.multiple,
            difficulty: Difficulty.easy,
            question: 'Who made the sun, the moon, the stars, etc',
            correctAnswer: 'Allah (s.w.t)',
            incorrectAnswers: [
              'Muhammad (s.a.w)',
              'Adam (a.s)',
              'All of the above'
            ]),
        Question(
            categoryName: 'Islam',
            type: Type.multiple,
            difficulty: Difficulty.easy,
            question: 'What is the first month of the Islamic Calendar?',
            correctAnswer: 'Muharram',
            incorrectAnswers: ['Ramdan', 'Shawwal', 'Rabi-ul-Awal']),
        Question(
            categoryName: 'Islam',
            type: Type.multiple,
            difficulty: Difficulty.easy,
            question: 'What do you say when you sneeze?',
            correctAnswer: 'Alhamdu lilah',
            incorrectAnswers: [
              'Ya Allah',
              'Yarhamukallah',
              'La llaha illal lah'
            ]),
        Question(
            categoryName: 'Islam',
            type: Type.multiple,
            difficulty: Difficulty.easy,
            question: 'What is Salat?',
            correctAnswer: 'Praying',
            incorrectAnswers: ['Giving to the poor', 'Fasting', 'Pilgrimage']),
      ],
      answers: {},
    );
  }

  QuizState copyWith({
    int currentIndex,
    List<Color> colors,
    List<List<String>> options,
    List<Question> questions,
    Map<String, String> answers,
  }) {
    return QuizState(
        currentIndex: currentIndex ?? this.currentIndex,
        colors: colors ?? this.colors,
        options: options ?? this.options,
        questions: questions ?? this.questions,
        answers: answers ?? this.answers);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizState &&
          runtimeType == other.runtimeType &&
          currentIndex == other.currentIndex &&
          colors == other.colors &&
          options == other.options &&
          questions == other.questions &&
          answers == other.answers;

  @override
  int get hashCode =>
      currentIndex.hashCode ^
      colors.hashCode ^
      options.hashCode ^
      questions.hashCode ^
      answers.hashCode;
}
