import 'package:flutter/material.dart';

const kQuestionStyle =
    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);

const kActive = Color(0xFF219329);
const kBackground = Color(0xFF9def9c);
const kHover = Color(0xFF52ac58);
const kPrimary = Color(0xFF69d070);
const kError = Color(0xFFf8524c);

const kCard = Color(0xFF3ab143);
const kSecondary = Color(0xFFFFE2D1);

const kSlides1 = Color(0xFF69D070);
const kSlides2 = Color(0xFF5E4C5A);
const kSlides3 = Color(0xFF55917F);

// TODO: Void method on model
var kQuestions = [
  {
    'category': 'Islam',
    'type': 'multiple',
    'difficulty': 'easy',
    'question': 'What do we call the Angels who write down what we do?',
    'correct_answer': 'Kiramin Katibin',
    'incorrect_answers': ['Israfil', 'Mikail', 'Izrail']
  },
  {
    'category': 'Islam',
    'type': 'multiple',
    'difficulty': 'easy',
    'question': 'Pillars of Islam are also called?',
    'correct_answer': 'Arkanal Islam',
    'incorrect_answers': ['Qadr ul Islam', 'Yusuf Islam', 'Fi Amanillah']
  },
  {
    'category': 'Islam',
    'type': 'multiple',
    'difficulty': 'easy',
    'question': 'A Prophet is called what in Arabic?',
    'correct_answer': 'Nabi',
    'incorrect_answers': ['Rasul', 'Wahi', 'None of the above']
  },
  {
    'category': 'Islam',
    'type': 'multiple',
    'difficulty': 'easy',
    'question': 'What does Islam mean?',
    'correct_answer': 'Islam means to obey Allah (s.w.t) and obey his commands',
    'incorrect_answers': [
      'Islam means to obey our parents',
      'Islam means to obey our teachers and elders',
      'None of the above'
    ]
  },
  {
    'category': 'Islam',
    'type': 'multiple',
    'difficulty': 'easy',
    'question': 'Allah (s.w.t) has...?',
    'correct_answer': 'A Son',
    'incorrect_answers': ['A Partner', 'No Partner', 'A Daughter']
  },
  {
    'category': 'Islam',
    'type': 'multiple',
    'difficulty': 'easy',
    'question': 'How many Allah (s.w.t) are there?',
    'correct_answer': 'Three',
    'incorrect_answers': ['Two', 'One', 'Zero']
  },
  {
    'category': 'Islam',
    'type': 'multiple',
    'difficulty': 'easy',
    'question': 'Who made the sun, the moon, the stars, etc?',
    'correct_answer': 'Allah (s.w.t)',
    'incorrect_answers': ['Muhammad (s.a.w)', 'Adam (a.s)', 'All of the above']
  },
  {
    'category': 'Islam',
    'type': 'multiple',
    'difficulty': 'easy',
    'question': 'What is the first month of the Islamic Calendar?',
    'correct_answer': 'Muharram',
    'incorrect_answers': ['Ramdan', 'Shawwal', 'Rabi-ul-Awal']
  },
  {
    'category': 'Islam',
    'type': 'multiple',
    'difficulty': 'easy',
    'question': 'What do you say when you sneeze?',
    'correct_answer': 'Alhamdu lilah',
    'incorrect_answers': ['Ya Allah', 'Yarhamukallah', 'La llaha illal lah']
  },
  {
    'category': 'Islam',
    'type': 'multiple',
    'difficulty': 'easy',
    'question': 'What is Salat?',
    'correct_answer': 'Praying',
    'incorrect_answers': ['Giving to the poor', 'Fasting', 'Pilgrimage']
  },
];
