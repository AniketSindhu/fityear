
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fityear/Methods/Functions/getCurrentUser.dart';
import 'package:fityear/Models/userModel.dart';

Future<UserModel> getUser() async{
  final String uid  = await getCurrentUid();
  print(uid);
  final x = await FirebaseFirestore.instance.collection('users').doc(uid).get();
  return UserModel.fromDocument(x);  
}