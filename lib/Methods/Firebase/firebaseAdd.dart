import 'package:cloud_firestore/cloud_firestore.dart';

adduser(String uid, String name, String imageUrl, String email) async{
  await FirebaseFirestore.instance.collection('users').doc(uid).set({
    'uid':uid,
    'name':name,
    "imageUrl":imageUrl,
    "email": email,
    'steps': 0
  },SetOptions(merge:true));
}