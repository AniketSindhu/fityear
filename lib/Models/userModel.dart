import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String email;
  final String name;
  final String image;
  final String uid;

  UserModel({this.email,this.image,this.name,this.uid});

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      email: doc['email'],
      name: doc['name'],
      image: doc['imageUrl'],
      uid: doc['uid']
    );
  }
}