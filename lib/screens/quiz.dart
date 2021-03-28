import 'package:flutter/material.dart';
import 'lecture.dart';
import 'package:vibration/vibration.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:convert';

class Question {
  final String id;
  final String qstatement;
  final String optiona;
  final String optionb;
  final String optionc;
  final String optiond;

  Question(this.id, this.qstatement, this.optiona, this.optionb, this.optionc,
      this.optiond);
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

  void reply(Question r, String ans) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LecturePage(),
      ),
    );

    String token = await FirebaseMessaging.instance.getAPNSToken();
    try {
      await http.post(
        Uri.parse('https://api.rnfirebase.io/messaging/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'token': token,
          'data': {'question_id': r.id, 'ans': ans}
        }),
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz"), centerTitle: true),
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
                  reply(Q, 'a');
                },
                child: Text(Q.optiona)),
            ElevatedButton(
                onPressed: () {
                  reply(Q, 'b');
                },
                child: Text(Q.optionb)),
            ElevatedButton(
                onPressed: () {
                  reply(Q, 'c');
                },
                child: Text(Q.optionc)),
            ElevatedButton(
                onPressed: () {
                  reply(Q, 'd');
                },
                child: Text(Q.optiond)),
          ],
        ),
      ),
    );
  }
}
