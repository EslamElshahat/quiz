import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function q;

  late final int resultScore;

  Result(this.q, this.resultScore);

  String get resultPhrase {
    String resultText = '';
    if (resultScore >= 60) {
      resultText = "Good";
    } else {
      resultText = "Bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
          Text(
            "Your Score is $resultScore",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 50),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              "Restart!",
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              q();
            },
          )
        ],
      ),
    );
  }
}
