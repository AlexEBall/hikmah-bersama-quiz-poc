import 'package:test/test.dart';
import '../lib/utils/create_choices.dart';

void main() {
  group('Create Choices', () {
    test('adds answer to choices list', () {
      final List<Map<String, dynamic>> questions = [
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
        }
      ];

      final List<List<String>> result = createOptions(questions);

      for (var i = 0; i < result.length; i++) {
        expect(result[i].length, 4);
      }
    });
  });
}
