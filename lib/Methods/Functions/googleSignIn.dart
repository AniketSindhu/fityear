import 'package:firebase_auth/firebase_auth.dart';
import 'package:fityear/Methods/Firebase/firebaseAdd.dart';
import 'package:fityear/Methods/Functions/isUserexist.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:velocity_x/velocity_x.dart';



Future<bool> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

  final User user = userCredential.user;
  final newUser = await isUserExist(user.uid);
  if(newUser){
    adduser(user.uid, user.displayName ,user.photoURL, user.email);
  }
  return true;
}