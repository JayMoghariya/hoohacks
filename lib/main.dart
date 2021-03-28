import 'package:flutter/material.dart';
import 'package:hoohacks/screens/lecture.dart';
import './screens/login.dart';
import 'package:firebase_core/firebase_core.dart';

bool logged = true;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HooHacks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        fontFamily: 'Georgia',
      ),
      home: logged ? LecturePage() : LoginPage(),
    );
  }
}
