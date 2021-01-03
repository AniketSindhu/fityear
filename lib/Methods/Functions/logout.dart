import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

logout() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('login', false);
  await FirebaseAuth.instance.signOut();
  await GoogleSignIn().signOut();
}