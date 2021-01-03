import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fityear/UI/pages/intro_screens.dart';
import 'package:velocity_x/velocity_x.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: "FitYear",
            home: Intro(),
            debugShowCheckedModeBanner: false,
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(backgroundColor: Colors.black,body: CircularProgressIndicator().centered(),),
        );
      }
    );
  }
}
