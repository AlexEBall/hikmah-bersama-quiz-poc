// import 'package:flutter/material.dart';
// import '../models/question.dart';

// import './home.dart';
// import './check_answers.dart';

// class QuizFinishedPage extends StatelessWidget {
//   static const String id = 'finished_screen';
//   final List<Question> questions;
//   final Map<int, dynamic> answers;

//   QuizFinishedPage({@required this.questions, @required this.answers});

//   @override
//   Widget build(BuildContext context) {
//     int correct = 0;
//     this.answers.forEach((index, value) {
//       if (this.questions[index].correctAnswer == value) correct++;
//     });

//     // TODO: This is where it gets saved to the db
//     // print(correct);

//     final TextStyle titleStyle = TextStyle(
//         color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.w500);
//     final TextStyle trailingStyle = TextStyle(
//         color: Theme.of(context).primaryColor,
//         fontSize: 20.0,
//         fontWeight: FontWeight.bold);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Result'),
//         elevation: 0,
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [
//           Theme.of(context).primaryColor,
//           Theme.of(context).accentColor
//         ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0)),
//                 child: ListTile(
//                   contentPadding: const EdgeInsets.all(16.0),
//                   title: Text("Total Questions", style: titleStyle),
//                   trailing: Text("${questions.length}", style: trailingStyle),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0)),
//                 child: ListTile(
//                   contentPadding: const EdgeInsets.all(16.0),
//                   title: Text("Score", style: titleStyle),
//                   trailing: Text("${correct / questions.length * 100}%",
//                       style: trailingStyle),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0)),
//                 child: ListTile(
//                   contentPadding: const EdgeInsets.all(16.0),
//                   title: Text("Correct Answers", style: titleStyle),
//                   trailing: Text("$correct/${questions.length}",
//                       style: trailingStyle),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0)),
//                 child: ListTile(
//                   contentPadding: const EdgeInsets.all(16.0),
//                   title: Text("Incorrect Answers", style: titleStyle),
//                   trailing: Text(
//                       "${questions.length - correct}/${questions.length}",
//                       style: trailingStyle),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   RaisedButton(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16.0, vertical: 20.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       color: Theme.of(context).accentColor.withOpacity(0.8),
//                       child: Text("Go Home"),
//                       onPressed: () =>
//                           Navigator.pushNamed(context, HomeScreen.id)),
//                   RaisedButton(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16.0, vertical: 20.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     color: Theme.of(context).primaryColor,
//                     child: Text("Check Answers"),
//                     onPressed: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (_) => CheckAnswersScreen(
//                             questions: questions,
//                             answers: answers,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
