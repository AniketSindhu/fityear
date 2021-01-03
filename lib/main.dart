import 'package:firebase_core/firebase_core.dart';
import 'package:fityear/UI/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fityear/UI/pages/intro_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool login=prefs.getBool('login');
  runApp(login==null||login==false?MyApp():MyApp1());
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
            home: Scaffold(
              backgroundColor: Colors.black,
              body: CircularProgressIndicator().centered(),
            ),
          );
        });
  }
}

class MyApp1 extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: "FitYear",
              home: HomePage(),
              debugShowCheckedModeBanner: false,
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: Colors.black,
              body: CircularProgressIndicator().centered(),
            ),
          );
        });
  }
}
