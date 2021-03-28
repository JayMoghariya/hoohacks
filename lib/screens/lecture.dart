import 'package:flutter/material.dart';
import 'package:hoohacks/main.dart';
import 'quiz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LecturePage extends StatefulWidget {
  @override
  _LecturePageState createState() => _LecturePageState();
}

Question foxexample = Question(
    "The specific heat capacity of a body depends on", [
  "Heat given",
  "Temperature raised",
  "Mass of the body",
  "Material of the body"
]);

class _LecturePageState extends State<LecturePage> {
  /* @override
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
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {}
    });
  }*/
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
