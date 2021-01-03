import 'package:firebase_auth/firebase_auth.dart';

Future<String> getCurrentUid()async{
  final User user = FirebaseAuth.instance.currentUser ;
  return user.uid;
}