import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> isUserExist(String uid)async{
  final x = await FirebaseFirestore.instance.collection('users').doc(uid).get();
  return x.exists;
}