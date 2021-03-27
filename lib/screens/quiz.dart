import 'package:flutter/material.dart';
import 'package:hoohacks/main.dart';

class Question {
  final String qstatement = "What does the fox say?";
  final List<String> options = ["Woof Woof", "Skrrt Skrrt", "He He He", "Meow"];
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Question Q = Question();

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
            ElevatedButton(onPressed: () {}, child: Text(Q.options[0])),
            ElevatedButton(onPressed: () {}, child: Text(Q.options[1])),
            ElevatedButton(onPressed: () {}, child: Text(Q.options[2])),
            ElevatedButton(onPressed: () {}, child: Text(Q.options[3])),
          ],
        ),
      ),
    );
  }
}
