import 'package:flutter/material.dart';
import 'package:hoohacks/main.dart';
import 'lecture.dart';
import 'package:vibration/vibration.dart';

class Question {
  final String qstatement;
  final List<String> options;
  Question(this.qstatement, this.options);
}

class QuizPage extends StatefulWidget {
  Question gotQ;
  QuizPage(this.gotQ);
  @override
  _QuizPageState createState() => _QuizPageState(gotQ);
}

class _QuizPageState extends State<QuizPage> {
  Question Q;
  _QuizPageState(this.Q) {
    Vibration.vibrate(pattern: [100, 500, 300, 100, 500, 1000]);
  }

  void reply(int id) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LecturePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(30),
          children: [
            SizedBox(height: 40),
            SizedBox(
              width: 300,
              child: Text(
                Q.qstatement,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  reply(0);
                },
                child: Text(Q.options[0])),
            ElevatedButton(
                onPressed: () {
                  reply(1);
                },
                child: Text(Q.options[1])),
            ElevatedButton(
                onPressed: () {
                  reply(2);
                },
                child: Text(Q.options[2])),
            ElevatedButton(
                onPressed: () {
                  reply(3);
                },
                child: Text(Q.options[3])),
          ],
        ),
      ),
    );
  }
}
