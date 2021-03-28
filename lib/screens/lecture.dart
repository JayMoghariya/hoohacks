import 'package:flutter/material.dart';
import 'quiz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LecturePage extends StatefulWidget {
  @override
  _LecturePageState createState() => _LecturePageState();
}

Question foxexample = Question(
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lecture"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(40),
        children: [
          Text(
            "Ongoing class",
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizPage(foxexample)));
              },
              child: Text("Testing"),
            ),
          )
        ],
      ),
    );
  }
}
