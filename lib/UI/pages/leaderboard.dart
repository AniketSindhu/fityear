import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Color(0xff0CFDCA),title: "Leaderboard".text.black.make(),centerTitle: true,),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').orderBy('steps',descending: true).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator().centered();
          }
          else if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    ListTile(
                      title: "${snapshot.data.documents[index].data()['name']}".text.gray300.make(),
                      leading: "#${index+1}".text.bold.white.size(18).make(),
                      subtitle: "Steps: ${snapshot.data.documents[index].data()['steps']}".text.gray300.make(),
                      trailing: CircleAvatar(backgroundImage: NetworkImage(snapshot.data.documents[index].data()['imageUrl']),),
                    ),
                    Divider(color:Colors.green)
                  ],
                );
              },
            ).py12();
          }
          else{
            return CircularProgressIndicator().centered();
          }
        }
      )
    );
  }
}