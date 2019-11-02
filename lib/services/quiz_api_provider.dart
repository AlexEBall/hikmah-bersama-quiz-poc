// // import 'package:http/http.dart' as http;

// import '../models/question.dart';

// // const String baseUrl = "https://opentdb.com/api.php";

// var staticQuestions = {
//   'results': [
//     {
//       'category': 'Islam',
//       'type': 'multiple',
//       'difficulty': 'easy',
//       'question': 'What do we call the Angels who write down what we do?',
//       'correct_answer': 'Kiramin Katibin',
//       'incorrect_answers': ['Israfil', 'Mikail', 'Izrail']
//     },
//     {
//       'category': 'Islam',
//       'type': 'multiple',
//       'difficulty': 'easy',
//       'question': 'Pillars of Islam are also called?',
//       'correct_answer': 'Arkanal Islam',
//       'incorrect_answers': ['Qadr ul Islam', 'Yusuf Islam', 'Fi Amanillah']
//     },
//     {
//       'category': 'Islam',
//       'type': 'multiple',
//       'difficulty': 'easy',
//       'question': 'A Prophet is called what in Arabic?',
//       'correct_answer': 'Nabi',
//       'incorrect_answers': ['Rasul', 'Wahi', 'None of the above']
//     },
//     {
//       'category': 'Islam',
//       'type': 'multiple',
//       'difficulty': 'easy',
//       'question': 'What does Islam mean?',
//       'correct_answer':
//           'Islam means to obey Allah (s.w.t) and obey his commands',
//       'incorrect_answers': [
//         'Islam means to obey our parents',
//         'Islam means to obey our teachers and elders',
//         'None of the above'
//       ]
//     },
//     {
//       'category': 'Islam',
//       'type': 'multiple',
//       'difficulty': 'easy',
//       'question': 'Allah (s.w.t) has...?',
//       'correct_answer': 'A Son',
//       'incorrect_answers': ['A Partner', 'No Partner', 'A Daughter']
//     },
//     {
//       'category': 'Islam',
//       'type': 'multiple',
//       'difficulty': 'easy',
//       'question': 'How many Allah (s.w.t) are there?',
//       'correct_answer': 'Three',
//       'incorrect_answers': ['Two', 'One', 'Zero']
//     },
//     {
//       'category': 'Islam',
//       'type': 'multiple',
//       'difficulty': 'easy',
//       'question': 'Who made the sun, the moon, the stars, etc?',
//       'correct_answer': 'Allah (s.w.t)',
//       'incorrect_answers': [
//         'Muhammad (s.a.w)',
//         'Adam (a.s)',
//         'All of the above'
//       ]
//     },
//     {
//       'category': 'Islam',
//       'type': 'multiple',
//       'difficulty': 'easy',
//       'question': 'What is the first month of the Islamic Calendar?',
//       'correct_answer': 'Muharram',
//       'incorrect_answers': ['Ramdan', 'Shawwal', 'Rabi-ul-Awal']
//     },
//     {
//       'category': 'Islam',
//       'type': 'multiple',
//       'difficulty': 'easy',
//       'question': 'What do you say when you sneeze?',
//       'correct_answer': 'Alhamdu lilah',
//       'incorrect_answers': ['Ya Allah', 'Yarhamukallah', 'La llaha illal lah']
//     },
//     {
//       'category': 'Islam',
//       'type': 'multiple',
//       'difficulty': 'easy',
//       'question': 'What is Salat?',
//       'correct_answer': 'Praying',
//       'incorrect_answers': ['Giving to the poor', 'Fasting', 'Pilgrimage']
//     },
//   ]
// };

// Future<List<Question>> getQuestions() async {
//   // String url = '$baseUrl?amount=10&category=10&difficulty=easy&type=multiple';
//   // http.Response res = await http.get(url);

//   List<Map<String, dynamic>> questions = staticQuestions["results"];

//   return Question.fromData(questions);
// }
