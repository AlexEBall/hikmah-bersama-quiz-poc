import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/question.dart';

const String baseUrl = "https://opentdb.com/api.php";

Future<List<Question>> getQuestions() async {
  String url = '$baseUrl?amount=10&category=10&difficulty=easy&type=multiple';
  http.Response res = await http.get(url);

  List<Map<String, dynamic>> questions =
      List<Map<String, dynamic>>.from(json.decode(res.body)["results"]);

  return Question.fromData(questions);
}
