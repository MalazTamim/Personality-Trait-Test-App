import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart'; 

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({@required this.questions, @required this.answerQuestion, @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>) //questions[_questionIndex]['answers'] gives lst of answers for chosen index
            .map((answer) {
          //after 'map' we have the anonymus function we are applying that returns a list of answer wedgets
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList() //to make sure its a list (its not necessary)
      ], //Thus, map function generates a new list of answer wedgets

      //P.S:  map() returns a new iterable (which is transformed to a list via toList())
    );
  }
}
