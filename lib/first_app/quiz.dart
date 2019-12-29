import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class QuestionOption {
  final int score;
  final String text;

  const QuestionOption({@required this.score, @required this.text});
}

class QuestionType {
  final String label;
  final List<QuestionOption> options;

  const QuestionType({@required this.label, @required this.options});
}

const List<QuestionType> questions = const [
  const QuestionType(
    label: 'First question',
    options: [
      const QuestionOption(score: 3, text: '1: First option'),
      const QuestionOption(score: 2, text: '1: Second option'),
      const QuestionOption(score: 1, text: '1: Third option'),
    ],
  ),
  const QuestionType(
    label: 'Second question',
    options: [
      const QuestionOption(score: 3, text: '2: First option'),
      const QuestionOption(score: 2, text: '2: Second option'),
      const QuestionOption(score: 1, text: '2: Third option'),
    ],
  ),
  const QuestionType(
    label: 'Third question',
    options: [
      const QuestionOption(score: 3, text: '3: First option'),
      const QuestionOption(score: 2, text: '3: Second option'),
      const QuestionOption(score: 1, text: '3: Third option'),
    ],
  ),
];

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int index = 0;
  int score = 0;

  void onAnswer(int score) {
    setState(() {
      this.score += score;
      this.index += 1;
    });
  }

  List<Widget> renderAnswers() {
    return questions[index]
        .options
        .map((question) => Answer(
            text: question.text, onClick: () => onAnswer(question.score)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final isCompleted = this.index == questions.length;

    return !isCompleted
        ? Column(
            children: <Widget>[
              Question(
                question: questions[index].label,
              ),
              ...renderAnswers()
            ],
          )
        : Center(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text('Completed'),
                  margin: EdgeInsets.only(bottom: 10),
                ),
                RaisedButton(
                  child: Text(
                    'Restart',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: () => setState(() {
                    this.index = 0;
                    this.score = 0;
                  }),
                )
              ],
            ),
          );
  }
}
