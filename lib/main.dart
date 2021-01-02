import 'package:flutter/material.dart';
import 'package:fityear/UI/pages/intro_screens.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FitYear",
      home: Intro(),
      debugShowCheckedModeBanner: false,
    );
  }
}
