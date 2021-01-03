import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

logout() async{
  await FirebaseAuth.instance.signOut();
  await GoogleSignIn().signOut();
}