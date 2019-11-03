List<List<String>> createOptions(List<Map<String, dynamic>> questions) {
  return questions.map((Map<String, dynamic> question) {
    String answer = question['correct_answer'];
    List<String> choices = question['incorrect_answers'];

    choices.add(answer);
    choices.shuffle();

    return choices;
  }).toList();
}
