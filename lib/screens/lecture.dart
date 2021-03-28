import 'package:flutter/material.dart';
import 'quiz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LecturePage extends StatefulWidget {
  @override
  _LecturePageState createState() => _LecturePageState();
}

Question testq = Question(
  "0",
  "The specific heat capacity of a body depends on",
  "Heat given",
  "Temperature raised",
  "Mass of the body",
  "Material of the body",
);

class _LecturePageState extends State<LecturePage> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {
        print(message);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Question askQ = Question(
          message.data['question_id'],
          message.data['question_statement'],
          message.data['option_a'],
          message.data['option_b'],
          message.data['option_c'],
          message.data['option_d']);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => QuizPage(askQ)));
    });
    //Only for demo
    Future.delayed(
        const Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => QuizPage(testq))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lecture"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Text(
            "Ongoing Live Class",
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
