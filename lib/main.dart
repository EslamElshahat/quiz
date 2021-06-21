import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'question.dart';
import 'answer.dart';
import 'result.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _totalScore = 0;
  int _questionIndex = 0;
  int num0 = 0, num1 = 0, num2 = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      num0 = 0;
      num1 = 0;
      num2 = 0;


    });
  }

  void answerQuestion(int score) {
    if (_questionIndex == 2) {
      _questionIndex = -1;
    } else {

      if (_questionIndex == 0) num0 = score ;
      if (_questionIndex == 1) num1 = score ;
      if (_questionIndex == 2) num2 = score ;
      _totalScore +=score;
      setState(() {
        _questionIndex += 1;
      });
    }
  }

  List<Map<String, Object>> _question = [
    {
      'questionText': 'What\'s your favourite color ? ',
      'answers': [
        {'text': "black", 'score': 10},
        {'text': "green", 'score': 20},
        {'text': "white", 'score': 30},
      ]
    },
    {
      'questionText': 'What\'s your favourite Animal ? ',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'lion', 'score': 20},
        {'text': 'tiger', 'score': 30},
        {'text': 'test', 'score': 40},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: Container(
            // width: double.infinity,
            child: _questionIndex < _question.length
                ? Quiz(_question, _questionIndex, answerQuestion)
                : Result(_resetQuiz,_totalScore)),
        floatingActionButton: FloatingActionButton(

          child: Icon(Icons.arrow_back),
          onPressed: (){
            if (_questionIndex == 1) _totalScore -= num0;
            if (_questionIndex == 2) _totalScore -= num1;
            if (_questionIndex == 3) _totalScore -= num2;


            setState(() {
              if(_questionIndex > 0){
                _questionIndex--;
              }
            });
          },
        ),
      ),
    );
  }
}
