import 'package:flutter/material.dart';


class Question extends StatelessWidget {
  final Object questionText;
  //final String questionText;
  Question(this.questionText);
@override
Widget build(BuildContext context) {
return Container(
  width: double.infinity,
  margin: EdgeInsets.all(15.0),
  child: Text(
    questionText.toString(),
    //'',
    style: TextStyle(fontSize: 25),
    textAlign: TextAlign.center,
  ),
);
}
}