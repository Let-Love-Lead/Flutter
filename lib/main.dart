import 'package:flutter/material.dart';
import 'package:my_project/OnboardScreens/Firstpage.dart';
import 'package:my_project/screens/Pages.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login and User Authentication',
      debugShowCheckedModeBanner: false,
      home: Pages(),
    );
  }
}
